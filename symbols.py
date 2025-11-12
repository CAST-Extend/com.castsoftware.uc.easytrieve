import os, re, traceback
from collections import OrderedDict, defaultdict
from pathlib import Path
from cast.analysers import log, CustomObject, Bookmark, create_link
from cast.application import open_source_file
from easytrieve_parser import parse
from easytrieve_parser import is_file, is_macro, is_program, is_root
from easytrieve_parser import is_report, is_procedure, is_sql
from light_parser import Node, Token, Walker
from resolution import resolve as resolution_resolve


class Namespace:
    """
    Dictionary of symbols
    """
    def __init__(self):

        # defined symbols
        self.symbols = OrderedDict()

    def add_symbol(self, name, symbol):
        """
        Register a symbol
        Case insensitive
        """
        try:
            self.symbols[name.upper()].append(symbol)
        except:
            self.symbols[name.upper()] = [symbol]

    def get_local_symbols(self):
        """
        Access to all symbols as a dict(list)
        """
        return self.symbols

    def get_all_symbols(self):
        """
        Access to all symbols as a list
        """
        import itertools
        
        return list(itertools.chain.from_iterable(self.symbols.values()))

    def find_local_symbols(self, name, types=[]):
        """
        Search for a symbol of a given name with optional possible types
        """
        if not name:
            return []
        
        type_names = [_type.__name__ for _type in types]
        name = name.upper() # case insensitive
        if name in self.symbols:
            symbols = self.symbols[name]
            if types:
                return [symbol for symbol in symbols if type(symbol).__name__ in type_names]
            else:
                return symbols
        else:
            return []
    
    def find_local_symbol(self, name, types=[], begin_line=None):
        
        result = self.find_local_symbols(name, types)
        if len(result) == 1:
            return result[0]
        elif begin_line:
            
            for candidate in result:
                
                if candidate.get_begin_line() == begin_line:
                    return candidate
        
    def print(self, ident=0):
        """
        Pretty print.
        """
        result = ' '*ident + '%s %s\n' % (type(self).__name__, self.get_name())
        for symbols in self.symbols.values():
            for symbol in symbols:
                result += symbol.print(ident + 1)
        
        return result


class Symbol(Namespace):
    """
    base class for symbols
    """
    
    def __init__(self, name, parent=None):
        Namespace.__init__(self)
        self.__name = name
        self.__parent = parent

        # for saving
        self.__kb_symbol = None
        self.subObjectsGuids = {}
        self.sub_objects_names = {}

        self.__start_line = None
        # constructed latter during parsing
        self._ast = None
        
        # use the first code line or not
        self.__first_code_line = set()
        # idem
        self.__properties = {}
        
        # stats of symbols
        self.rpg_symbol_stats = defaultdict(int)
    
    def get_metamodel_type(self):
        raise NotImplementedError("Subclasses must implement get_metamodel_type method")
    
    def get_parent_symbol(self):
        return self.__parent

    def get_ancestor_symbol(self, symbols):
        """
        @param symbols:list of type
        """
        if type(self.get_parent_symbol()) in symbols:
            return self.get_parent_symbol()
        else:
            return self.get_parent_symbol().get_ancestor_symbol(symbols)
    
    def get_root_symbol(self):
        
        if self.__parent:
            return self.__parent.get_root_symbol()
        
        return self
    
    def get_name(self):
        """
        Return name
        """
        return self.__name
    
    def get_qualified_name(self):
        """
        Qualified name
        """
        
        if self.__parent:
            result = self.__parent.get_qualified_name() + "." + self.__name
        else:
            # module
            result = os.path.splitext(self.__name)[0]
        
        return result
    
    def resolve_symbols(self, name, types=[], already_seen=None):
        """
        Same as Namespace.find_local_symbols but also uses /COPY
        """
        if already_seen is None:
            already_seen = set()
        
        if self in already_seen:
            return []
        already_seen.add(self)

        result = self.find_local_symbols(name, types)
        
        # not nice but allow to make some tests pass
        main = self.find_local_symbol('MAIN', [MainSubRoutine])
        if main:
            result += main.resolve_symbols(name, types, already_seen)
        
        for module in self.get_included_modules():
            result += module.resolve_symbols(name, types, already_seen)
        
        # when not resolved : look up
        if not result and self.get_parent_symbol():
            result += self.get_parent_symbol().resolve_symbols(name, types, already_seen)

        return result
    
    def get_guid(self):
        
        begin = ''
        
        if self.__parent:
            begin = self.__parent.get_guid()
        else:
            begin = self.get_file().get_path()
        
        _type = self.get_metamodel_type()
        
        return begin + '.' + _type + '.' + self.get_guid_local_name().upper()
    
    def get_guid_local_name(self):
        
        return self.get_name()
    
    def get_kb_object(self):
        """
        Return the CAST knowledge base symbol. 
        """
        return self.__kb_symbol
    
    def set_kb_object(self, kb_symbol):
        
        self.__kb_symbol = kb_symbol
        
    def get_ast(self):
        """
        Access to AST of symbol.
        """
        return self._ast
    
    def get_begin_line(self):
        
        return self.__start_line
    
    def get_file(self):
        return self.__file
    
    def get_line_count(self):
        
        def get_all_tokens(ast_node):
            """
            Iterates on all tokens of a tree or forest
            """
            if type(ast_node) is Token:
                yield ast_node
            elif type(ast_node) is list:
                for token in ast_node:
                    for sub in get_all_tokens(token):
                        yield sub
            else:
                for token in ast_node.children:
                    for sub in get_all_tokens(token):
                        yield sub
        
        last_line = -1
        result = 0
        for token in get_all_tokens(self._ast):
            
            line = token.get_begin_line()
            if last_line != line:
                result += 1
                
            last_line = line
        
        return result - self.get_body_comments_line_count() - self.get_header_comments_line_count()

    def get_header_comments_line_count(self):
        
        comments = self.get_header_comments()
        # comments are line based
        return len(comments)

    def get_body_comments_line_count(self):

        comments = self.get_body_comments()
        # comments are line based
        return len(comments)

    def get_header_comments(self):
        """
        Comments before object
        """
        return self._ast.get_header_comments()
    
    def get_body_comments(self):
        """
        Comments inside object
        """
        return self._ast.get_body_comments()
        
    def get_final_guid(self, guid):
        """
        Construct a GUID when there are several objects with same name
        """
        if not guid in self.subObjectsGuids:
            self.subObjectsGuids[guid] = 0
            return guid
        value = self.subObjectsGuids[guid]
        self.subObjectsGuids[guid] = value+1
        return guid + '_' + str(value+1) 

    def get_final_name(self, name):
        """
        Construct a name when there are several equal names.
        """
        if not name in self.sub_objects_names:
            self.sub_objects_names[name] = 0
            return name
        value = self.sub_objects_names[name]
        self.sub_objects_names[name] = value+1
        return name + '_' + str(value+1) 

    def get_code_only_crc(self):
        
        node = self._ast
        
        if type(self._ast) is list:
            # build a fake node
            node = Node()
            node.children = self._ast
        
        # so that we reuse common code 
        return node.get_code_only_crc()
        
    def save(self, file=None, current_stats=None):
        
        if not self._ast:
            return
        if current_stats is None:
            current_stats = self.rpg_symbol_stats
        
        if not file:
            file = self.get_file()
        
        if not self.__kb_symbol:
            
            guid = self.get_guid()
            
            if self.get_parent_symbol():
                guid = self.get_parent_symbol().get_final_guid(self.get_guid())
                parent = self.__parent.get_kb_object()
            else:
                parent = file
                
            kb_symbol = CustomObject()
            self.__kb_symbol = kb_symbol
            kb_symbol.set_name(self.__name)
            if not self.__name:
                log.debug(str(self.get_ast()))
            kb_symbol.set_type(self.get_metamodel_type())
            kb_symbol.set_parent(parent)
            kb_symbol.set_guid(guid)
            kb_symbol.set_fullname(self.get_qualified_name())
            kb_symbol.save()
            current_stats[self.get_metamodel_type()] += 1

            if type(self) != Sql:
                crc = self.get_code_only_crc()
                kb_symbol.save_property('checksum.CodeOnlyChecksum', crc)
    
                codeLines = self.get_line_count()
                kb_symbol.save_property('metric.CodeLinesCount', codeLines)
            
            # special case for sourceFiles
            if type(self) == Module:

                # in those version range, UA do not calculate LOC on sourceFile so we do it ourself
                # due to the usage of <languagePattern id="Python" UsedByUA="false">
                file.save_property('metric.CodeLinesCount', self.get_line_count())
                file.save_property('metric.BodyCommentLinesCount', self.get_body_comments_line_count())
                file.save_property('metric.LeadingCommentLinesCount', self.get_header_comments_line_count())
                file.save_property('comment.sourceCodeComment', ''.join(comment.text+'\n' for comment in self.get_body_comments()))
                file.save_property('comment.commentBeforeObject', '')
            
            headerCommentsLines = self.get_header_comments_line_count()
            if headerCommentsLines:
                kb_symbol.save_property('metric.LeadingCommentLinesCount', headerCommentsLines)
                kb_symbol.save_property('comment.commentBeforeObject', ''.join(comment.text+'\n' for comment in self.get_header_comments()))
            bodyCommentsLines = self.get_body_comments_line_count()
            if bodyCommentsLines:
                kb_symbol.save_property('metric.BodyCommentLinesCount', bodyCommentsLines)
                kb_symbol.save_property('comment.sourceCodeComment', ''.join(comment.text+'\n' for comment in self.get_body_comments()))
            
            self._save_position(file)

        # recurse...
        for symbol in self.get_all_symbols():
            symbol.save(file=file, current_stats=current_stats)

        return kb_symbol

    def clean(self):
        
        self._ast = None
        self.__violations = defaultdict(list)
        # use the first code line or not
        self.__first_code_line = set()
        # idem
        self.__properties = {}

        # recurse...
        for symbol in self.get_all_symbols():
            symbol.clean()
    
    def _save_position(self, file):
        
        # problem with last line try to fix it with end_line +1 and end_column= 1
        self.__kb_symbol.save_position(Bookmark(file,
                                                self._ast.get_begin_line(),
                                                self._ast.get_begin_column(),
                                                self._ast.get_end_line()+1,
                                                1))

    def set_property(self, property_name, value):
        """
        Used to set a generic property on object
        
        mainly used for quality rules

        :param property_name: fullname of the property
        :param value: value of the property
        """
        self.__properties[property_name] = value

    def create_bookmark(self, ast):
        """
        Create a bookmark from an ast node
        """
        return Bookmark(self.get_module().get_file(), ast.get_begin_line(), ast.get_begin_column(), ast.get_end_line(), ast.get_end_column())        
        
    def print_tree(self, depth=0):
        """
        Print as a tree.
        """
        indent = ' ' * (depth * 2)
        print(indent, self.__class__.__name__)

        if type(self._ast) is list:        
            for token in self._ast:
                token.print_tree(depth+1)
        else:
            self._ast.print_tree(depth+1)

    def _light_parse(self, stream):
        """
        Create symbols and sub symbols.
        """
        symbol = self

    def _fully_parse(self, stream):
        """
        Reattach new ast to existing symbols.
        """
        symbol = self

        for node in stream:
            
            symbol = self
                
            if is_file(node):
                #log.debug("in file, token: {} ".format(node))
                #print("in file, token: {} ".format(node))
                name = node.get_name()
                symbol = File(name, self)
                symbol.__start_line = node.get_begin_line()
                symbol._ast = node
                self.add_symbol(name, symbol)
                symbol._fully_parse(node.get_sub_nodes())

            if is_procedure(node):
                #log.debug("in procedure, token: {} ".format(node))
                #print("in procedure, token: {} ".format(node))
                name = node.get_name()
                symbol = Procedure(name, self)
                symbol.__start_line = node.get_begin_line()
                symbol._ast = node
                self.add_symbol(name, symbol)
                symbol._fully_parse(node.get_sub_nodes())

            if is_report(node):
                #log.debug("in prototype, token: {} ".format(node))
                #print("in prototype, token: {} ".format(node))
                name = node.get_name()
                symbol = Report(name, self)
                symbol.__start_line = node.get_begin_line()
                symbol._ast = node
                self.add_symbol(name, symbol)
                symbol._fully_parse(node.get_sub_nodes())

            elif is_sql(node):
                name = node.get_name()
                # if parent is file or report, take grand parent
                parent = self.get_ancestor_symbol([Module, Procedure])
                symbol = Sql(name, parent)
                symbol.__start_line = node.get_begin_line()
                symbol._ast = node
                parent.add_symbol(name, symbol)
                symbol._fully_parse(node.get_sub_nodes())


class Library:
    """
    Store all the modules for global resolution.
    """
    def __init__(self):
        
        self.modules = []
        self.modules_per_name = defaultdict(list)
        
        self.stats = defaultdict(int)
    
    def stats_update(self, class_instance):
        for key, value in class_instance.stats.items():
            self.stats[key] += value

    def add_module(self, module):
        """
        Register a program or macro.
        """
        self.modules.append(module)
        self.modules_per_name[module.get_name().upper()].append(module)
        module.library = self
        
    def get_modules(self):
        
        return self.modules
        
    def find_path(self, path, from_path):
        """
        Search a module by path.
        
        path is of the form x, x/y, /y/z with or without file extension
        """
        
        basename = os.path.basename(path)
        name, ext = os.path.splitext(basename)
        
        candidates = self.modules_per_name[name.upper()]
        
        # first filter against rest of the path
        if len(candidates) > 1:
            
            dirname = os.path.dirname(path)
            if dirname:
                
                filtered_candidates = []
                for candidate in candidates:
                    
                    candidate_path = candidate.get_path()
                    candidate_dirname = os.path.dirname(candidate_path)
                    if os.path.basename(dirname).upper() == os.path.basename(candidate_dirname).upper():
                        filtered_candidates.append(candidate)
                        
                if filtered_candidates:
                    candidates = filtered_candidates
        
        # second filter with distance
        if len(candidates) > 1:
            candidates = get_closests(candidates, from_path)

        if len(candidates) >= 1:
            return candidates[0]
        
    def find_program(self, name, in_cl=True):
        """
        Search a program.
        """
        searched_name = name.upper()
        if '/' in searched_name:
            searched_name = searched_name.split('/')[-1]
        result = self.modules_per_name[searched_name.strip()]
                
        return result


class Module(Symbol):
    """
    Program or Macro
    """
    shared_stats = defaultdict(int)
    shared_link_stats = defaultdict(int)
    shared_error_link_stats = defaultdict(int)
    
    def __init__(self, path, _file=None, text=None):
        
        name, _ = os.path.splitext(os.path.basename(path))
        Symbol.__init__(self, name)

        # KB object representing the file
        self.__file = _file
        # optionnaly the code (for tests)
        self.__text = text
        self.__path = path

        self.library = None
        self.already_checked = defaultdict(list)
        
    def update_shared_stats(self):
        for key, value in self.rpg_symbol_stats.items():
            self.shared_stats[key] += value

    def get_file(self):
        return self.__file

    def get_text(self):
        """
        Return something to pass to parsing method.
        - text (for unit testing)
        - or opened file 
        """
        if self.__text is not None:
            return self.__text
        text = ''
        try:
            with open_source_file(self.get_path()) as f:
                text = f.read()
        except LookupError:
            log.info("Lookup error with wrong unknown encoding, try by forcing UTF-8 encoding")
            with open_source_file(self.get_path(), encoding="UTF-8") as f:
                text = f.read()

        return text
    
    def get_path(self):
        
        if self.__file:
            return self.__file.get_path()
        
        return self.__path
    
    def get_metamodel_type(self):
        # @todo
        return 'Eztprogram'
        
    def light_parse(self):
        
        try:
            self._ast = list(parse(self.get_text()))
#             print(self._ast)
            for node in self._ast:
                if is_root(node):
                    self._ast = node
                    break            
        except:
            log.info("Issue during parsing: " + str(traceback.format_exc()))
                
    def fully_parse(self):
        
        try:
            self._ast = list(parse(self.get_text()))
#             print(self._ast)
            for node in self._ast:
                if is_root(node):
                    self._ast = node
                    break
        except:
            log.info("Issue during parsing: " + str(traceback.format_exc()))

#         self._ast.print_tree()
        if self._ast:
            self._fully_parse(self._ast.get_sub_nodes())
    
    def resolve(self):
        
        resolution_resolve(self, self.library)
        
    def save_links(self):
        
        walker = Walker()
        walker.register_interpreter(LinkInterpreter(self, self.library))
        walker.walk([self.get_ast()])
                    

class Procedure(Symbol):
        
    def get_metamodel_type(self):
        return 'Easyproc'


class File(Symbol):
    
    def get_metamodel_type(self):
        return 'Easyfile'


class Report(Symbol):
    
    def get_metamodel_type(self):
        return 'Easyreport'
    

class Sql(Symbol):
    
    def get_metamodel_type(self):
        return 'EasySQLQuery'

    def save(self, file=None, current_stats=None):

        kb_symbol = Symbol.save(self, file, current_stats)
        parent_kb_symbol = self.get_parent_symbol().get_kb_object()
        bookmark = Bookmark(self.get_root_symbol().get_file(),
                            self.get_begin_line(),
                            1,
                            self.get_begin_line()+1,
                            1
                            )
        create_link('callLink', parent_kb_symbol, kb_symbol, bookmark)
        kb_symbol.save_property('CAST_SQL_MetricableQuery.sqlQuery',
                                self._ast.get_sql_text().text)


class UnknownProgram(Symbol):
    
    def get_metamodel_type(self):
        return 'EasyCalltoProgram'

    def save(self, file=None, current_stats=None):

        kb_symbol = Symbol.save(self, file, current_stats)
        kb_symbol.save_property('CAST_CallToProgram.programName',
                                self.get_name())


class LinkInterpreter:
    """
    Creates links.
    """
    def __init__(self, module, library):
        
        # current file
        self.file = module.get_file()
        
        # stack of symbols
        self.__symbol_stack = [module]
    
    def push_symbol(self, symbol):
        
        self.__symbol_stack.append(symbol)
    
    def pop_symbol(self):

        self.__symbol_stack.pop()

    def get_current_kb_symbol(self):
        
        return self.__symbol_stack[-1].get_kb_object()
    
    def get_current_symbol(self):
        
        return self.__symbol_stack[-1]

    def get_module(self):
        
        return self.__symbol_stack[0]

    def create_bookmark(self, ast):
        """
        Create a bookmark from an ast node
        """
        return Bookmark(self.file, ast.get_begin_line(), ast.get_begin_column(), ast.get_end_line(), ast.get_end_column())        

    def create_bookmark_first_line(self, ast):
        """
        Create a bookmark from an ast node
        """
        return Bookmark(self.file, ast.get_begin_line(), ast.get_begin_column(), ast.get_begin_line(), 80)        
    
    def create_bookmark_first_line_without_comment(self, ast):
        """
        Create a bookmark from an ast node
        First line of code of a node, skips the header comments
        """
        return Bookmark(self.file, 
                        ast.get_code_begin_line(), 
                        ast.get_code_begin_column(), 
                        ast.get_code_begin_line(), 
                        80)            
    
    def start_Procedure(self, procedure):
        
        symbol = self.get_current_symbol().find_local_symbol(procedure.get_name(),
                                                             [Procedure],
                                                             procedure.get_begin_line())
        
        self.push_symbol(symbol)
    
    def end_Procedure(self, procedure):
        self.pop_symbol()
    
    def start_Perform(self, statement):
        
        procedure = statement.get_procedure()
        caller = self.get_current_kb_symbol()
        for symbol in procedure.resolved_as:
            
            if not symbol.get_kb_object():
                continue
        
            create_link('callLink', 
                        caller, 
                        symbol.get_kb_object(),
                        self.create_bookmark(procedure))
        
    def start_Finish(self, statement):
        self.start_Perform(statement)

    def start_Start(self, statement):
        self.start_Perform(statement)

    def start_Put(self, statement):
        file = statement.get_file()
        caller = self.get_current_kb_symbol()
        
        for symbol in file.resolved_as:
            
            if not symbol.get_kb_object():
                continue
        
            create_link('accessWriteLink', 
                        caller, 
                        symbol.get_kb_object(),
                        self.create_bookmark(file))

        # optional from
        file = statement.get_from()
        if not file:
            return
        
        for symbol in file.resolved_as:
            
            if not symbol.get_kb_object():
                continue
        
            create_link('accessReadLink', 
                        caller, 
                        symbol.get_kb_object(),
                        self.create_bookmark(file))
        
    def start_Write(self, statement):
        self.start_Put(statement)

    def start_Get(self, statement):
        file = statement.get_file()
        caller = self.get_current_kb_symbol()
        
        for symbol in file.resolved_as:
            
            if not symbol.get_kb_object():
                continue
        
            create_link('accessReadLink', 
                        caller, 
                        symbol.get_kb_object(),
                        self.create_bookmark(file))

    def start_Point(self, statement):
        file = statement.get_file()
        caller = self.get_current_kb_symbol()
        
        for symbol in file.resolved_as:
            
            if not symbol.get_kb_object():
                continue
        
            create_link('accessWriteLink', 
                        caller, 
                        symbol.get_kb_object(),
                        self.create_bookmark(file))

    def start_Job(self, statement):
        file = statement.get_input()
        if not file:
            return
        caller = self.get_current_kb_symbol()
        
        for symbol in file.resolved_as:
            
            if not symbol.get_kb_object():
                continue
        
            create_link('accessReadLink', 
                        caller, 
                        symbol.get_kb_object(),
                        self.create_bookmark(file))

    def start_Sort(self, statement):
        caller = self.get_current_kb_symbol()
        file = statement.get_sorted()
        if not file:
            return
        
        for symbol in file.resolved_as:
            
            if not symbol.get_kb_object():
                continue
        
            create_link('accessReadLink', 
                        caller, 
                        symbol.get_kb_object(),
                        self.create_bookmark(file))

        file = statement.get_to()
        if not file:
            return
        
        for symbol in file.resolved_as:
            
            if not symbol.get_kb_object():
                continue
        
            create_link('accessWriteLink', 
                        caller, 
                        symbol.get_kb_object(),
                        self.create_bookmark(file))

    def start_Print(self, statement):
        file = statement.get_report()
        caller = self.get_current_kb_symbol()
        
        for symbol in file.resolved_as:
            
            if not symbol.get_kb_object():
                continue
        
            create_link('accessReadLink', 
                        caller, 
                        symbol.get_kb_object(),
                        self.create_bookmark(file))

    def start_Call(self, statement):
        program = statement.get_called_program()
        caller = self.get_current_kb_symbol()
        
        # ensure we have something
        self.create_unkonwn_program_if_needed(program)
        
        for symbol in program.resolved_as:
            
            if not symbol.get_kb_object():
                continue
        
            create_link('callLink', 
                        caller, 
                        symbol.get_kb_object(),
                        self.create_bookmark(program))

    def create_unkonwn_program_if_needed(self, identifier):
        # create an unknown program if needed
        if identifier.resolved_as:
            return # no need
        
        parent = self.get_current_symbol()
        name = identifier.get_name()
        unknown = parent.find_local_symbol(name, [UnknownProgram])
        if not unknown:
            unknown = UnknownProgram(name, parent)
            unknown.__start_line = identifier.get_begin_line()
            unknown._ast = identifier
            parent.add_symbol(name, unknown)
            unknown.save(file=self.file)
        
        identifier.resolved_as = [unknown]
            

def get_closests(modules, path):
    """
    From pathes, extract those who are closest from path
    """

    def file_distance(module, path2):
        """
        A file distance
        """
        relative_path = Path(os.path.relpath(module.get_path(), path2))

        return len(relative_path.parts)

    if not modules:
        return modules
    if not path:
        return modules
    m = min(file_distance(module, path) for module in modules)

    return [module for module in modules if file_distance(module, path) == m]



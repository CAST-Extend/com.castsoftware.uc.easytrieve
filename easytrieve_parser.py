from lexer import EasyTrieveLexer, Generic, SQLText
from light_parser import Parser, Statement, Seq, Any, Or, Term, Optional, Node


def parse(text):
    """
    Parsing of an easytrieve file.
    Text can be 
    - str (the text itself)
    - opened file 
    """
    if not type(text) is str:
        text = text.read()

    if text.startswith('BEGIN_PROGRAM('):
        # previously modified code by preprocessor
        text = text[text.find('\n')+1:]

    if text.startswith('MACRO'):
        parser = Parser(EasyTrieveLexer,
                    [Macro])
    else:
        parser = Parser(EasyTrieveLexer,
                        [Program],
                        [File, Data, Procedure, Job, Sort, Report],
                        [Perform, Start, Finish, Get, Write, Print, Put, Call, SQL])

    return parser.parse(text)


# main structure
class Macro(Statement):
    
    begin = Or('MACRO', 'MSTART')
    end = 'MEND'


class Program(Statement):
    
    begin = Any()
    end = None

# structure

class File(Statement):
    begin = 'FILE'
    end = None
    stopped_by_other_statement = True

    def get_name(self):
        children = self.get_children()
        next(children)
        return next(children).text
        

class Data(Statement):
    begin = Seq(Any(), Or('W', 'F', 'C', 'S'))
    end = None
    stopped_by_other_statement = True


class Procedure(Statement):
    begin = Seq(Any(), Optional('.'), 'PROC') 
    end = 'END-PROC'
    # in old vesions of language there was no end-proc
    stopped_by_other_statement = True

    def get_name(self):
        children = self.get_children()
        return next(children).text


class Job(Statement):
    begin = 'JOB'
    end = None
    stopped_by_other_statement = True


class Sort(Statement):
    begin = 'SORT'
    end = None
    stopped_by_other_statement = True


class Report(Statement):
    begin = 'REPORT'
    end = None
    stopped_by_other_statement = True

    def get_name(self):
        children = self.get_children()
        next(children)
        return next(children).text



# statements

class EasytrieveStatement:
    
    def __init__(self):
        self.destination = None
    
    def get_destination(self):
         
        return self.destination
     
    


class Perform(Term):
    """
    PERFORM <procedure-name>
    """
    match = Seq('PERFORM', Generic)

    def __init__(self):
        Term.__init__(self)
        self.procedure = None
        
    def get_procedure(self):
        return self.procedure
    
    def on_end(self):
        children = self.get_children()
        next(children) # command
        token = next(children)
        self.procedure = get_identifier_from_token(token)


class Start(Term):

    match = Seq(Or('START', 'RESTART'), Generic)

    def __init__(self):
        Term.__init__(self)
        self.procedure = None
        
    def get_procedure(self):
        return self.procedure
    
    def on_end(self):
        children = self.get_children()
        next(children) # command
        token = next(children)
        self.procedure = get_identifier_from_token(token)


class Finish(Term):

    match = Seq('FINISH', Generic)

    def __init__(self):
        Term.__init__(self)
        self.procedure = None
        
    def get_procedure(self):
        return self.procedure
    
    def on_end(self):
        children = self.get_children()
        next(children) # command
        token = next(children)
        self.procedure = get_identifier_from_token(token)

# on files

class Get(Term):
    
    match = Seq('GET', Generic)

    def __init__(self):
        Term.__init__(self)
        self.file = None
        
    def get_file(self):
        return self.file
    
    def on_end(self):
        children = self.get_children()
        next(children) # command
        token = next(children)
        self.file = get_identifier_from_token(token)


class Write(Term):
    
    match = Seq('WRITE', Generic)

    def __init__(self):
        Term.__init__(self)
        self.file = None
        
    def get_file(self):
        return self.file
    
    def on_end(self):
        children = self.get_children()
        next(children) # command
        token = next(children)
        self.file = get_identifier_from_token(token)


class Put(Term):
    
    match = Seq('PUT', Generic)

    def __init__(self):
        Term.__init__(self)
        self.file = None
        
    def get_file(self):
        return self.file
    
    def on_end(self):
        children = self.get_children()
        next(children) # command
        token = next(children)
        self.file = get_identifier_from_token(token)


# on reports

class Print(Term):

    match = Seq('PRINT', Generic)


# on programs

class Call(Term):
    
    match = Seq('CALL', Generic)


class SQL(Term):
    
    match = Seq('SQL', SQLText)

    def __init__(self):
        Term.__init__(self)
        self.sql_text = None
        
    def get_sql_text(self):
        return self.sql_text
    
    def get_name(self):
        return get_sql_query_name(self.sql_text.text)
    
    def on_end(self):
        children = self.get_children()
        next(children) # command
        token = next(children)
        self.sql_text = token




def get_sql_query_name(sql_query_text):
    # normalization of query name
    # see 
    # https://cast-products.atlassian.net/wiki/spaces/PDTGNL/pages/1902756/Rules+and+Best+practices+for+Modelisation#RulesandBestpracticesforModelisation-NamingofQueries
    max_words = 4
    sql_query_text = sql_query_text.strip()
    if sql_query_text.upper().startswith(('EXEC', 'EXECUTE')):
        # we don't show parameters in the name for procedure calls
        max_words = 2
    truncated_sql = sql_query_text
    
    splitted = sql_query_text.split()
    if len(splitted) > max_words:
        truncated_sql = " ".join(splitted[0:max_words])
        
    return truncated_sql



# expressions

class Identifier(Node):
    
    def __init__(self):
        
        Node.__init__(self)
        self.resolved_as = []
    
    def get_name(self):
        
        return self.children[0].text


# is_xxx functions

def is_root(node):
    return is_program(node) or is_macro(node)
    

def is_program(node):
    return isinstance(node, Program)


def is_macro(node):
    return isinstance(node, Macro)


def is_file(node):
    return isinstance(node, File)


def is_procedure(node):
    return isinstance(node, Procedure)


def is_report(node):
    return isinstance(node, Report)


def is_sql(node):
    return isinstance(node, SQL)


def get_identifier_from_token(token):
    
    node = Identifier()
    node.children = [token]
    return node

from light_parser.splitter import Splitter # @UnresolvedImport
from light_parser import Token # @UnresolvedImport
from pygments.token import Generic, Comment, String, Keyword, Name, Token as PygmentToken

from cast.analysers import log

SQLText = Generic.SQLText  # @UndefinedVariable


class EasyTrieveLexer:
    """
    A very basic lexer 
    """
    
    def __init__(self, stripnl=False):
        
        pass
    
    def add_filter(self, _):
        pass
    
    def get_tokens(self, text, unfiltered=False):
        """
        To keep compliant with pygment 
        
        But still returns positionned tokens
        """

        # text can be a file...
        if isinstance(text, str):
            text = text.split('\n')

        separators = ["'", '.',]
        splitter = Splitter(separators)

        inside_sql = False
        sql_begin_line = None
        sql_begin_column = None
        current_sql_text = None
        
        inside_string = False
        string_text = None
        string_begin_line = None
        string_begin_column = None
        
        # line by line...
        for line_number, line in enumerate(text, start=1):
            
            stripped_line = line.strip()
            # comment
            if stripped_line.startswith('*'):

                result = Token(line, Comment)
                result.begin_line = line_number
                result.end_line = line_number
                result.begin_column = 1
                result.end_column = 1+len(line)
                
                yield result
                
            else:
                
                if inside_sql:
                    sql_fragment = line.rstrip()
                    if sql_fragment.endswith('+'):
                        sql_fragment = sql_fragment[:-1].rstrip()
                        current_sql_text += sql_fragment + '\n'
                    else:
                        current_sql_text += sql_fragment

                        result = Token(current_sql_text, SQLText)
                        result.begin_line = sql_begin_line
                        result.end_line = line_number
                        result.begin_column = sql_begin_column
                        result.end_column = len(sql_fragment)

                        yield result

                        current_sql_text = None
                        inside_sql = False
                        sql_begin_line = None
                        sql_begin_column = None
                    
                else:
                    if line.lstrip().startswith('SQL') and not inside_string:
                        inside_sql = True
                        sql_begin_line = line_number
                        sql_position = line.find('SQL')
                        sql_begin_column = sql_position + 4
                        
                        
                        result = Token('SQL', Keyword)
                        result.begin_line = line_number
                        result.end_line = line_number
                        result.begin_column = sql_position + 1
                        result.end_column = sql_position + 3
                        
                        yield result
                        
                        sql_fragment = line[sql_position+3:]
                        
                        if sql_fragment.endswith('+'):
                            sql_fragment = sql_fragment[:-1].rstrip()
                            current_sql_text = sql_fragment + '\n'
                        else:
                            current_sql_text = sql_fragment
    
                            result = Token(current_sql_text, SQLText)
                            result.begin_line = sql_begin_line
                            result.end_line = line_number
                            result.begin_column = sql_begin_column
                            result.end_column = sql_begin_column+len(sql_fragment)
    
                            yield result
    
                            current_sql_text = None
                            inside_sql = False
                            sql_begin_line = None
                            sql_begin_column = None
                        
                    else:
                        # line does not start with SQL
                        begin_column = 1
                        
                        for element in splitter.split(line):
                            
                            if inside_string:
                                string_text += element
                                if element == "'":
                                    
                                    result = Token(string_text, String)
                                    result.begin_line = string_begin_line
                                    result.end_line = line_number
                                    result.begin_column = string_begin_column
                                    result.end_column = begin_column
            
                                    yield result
                                    
                                    inside_string = False
                            
                            elif element == "'":
                                inside_string = True
                                string_text = element
                                string_begin_line = line_number
                                string_begin_column = begin_column
                            else:
                                    
                                result = Token(element, Generic)
                                result.begin_line = line_number
                                result.end_line = line_number
                                result.begin_column = begin_column
                                result.end_column = begin_column+len(element)-1
        
                                yield result
                            
                            begin_column += len(element)


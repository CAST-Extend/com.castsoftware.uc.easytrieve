from collections import defaultdict, OrderedDict
from light_parser import Walker
from cast.analysers import log



def resolve(module, library):
    """
    Resolve the content of a file (a module or package)
    
    :param module: Package or Module
    :param library: Library
    """

    # force full parsing
    if not module.get_ast():
        module.fully_parse()
    
    # walk the forest
    walker = Walker()
    
    interpreter = ResolutionInterpreter(module, library)
    
    walker.register_interpreter(interpreter)
    walker.walk([module.get_ast()])
    
    interpreter.finish()    


class ResolutionInterpreter:
    """
    Resolve the ast of a module.
    """
    
    def __init__(self, module, library):
        """
        :param module: symbols.Module
        :param library: symbols.Library
        """
        self.__library = library
        self.__module = module

    def finish(self):
        pass

    def start_Perform(self, statement):
        from symbols import Procedure
        identifier = statement.get_procedure()
        identifier.resolved_as = self.__module.find_local_symbols(identifier.get_name(), 
                                                                  [Procedure])
        
    def start_Start(self, statement):
        self.start_Perform(statement)

    def start_Finish(self, statement):
        self.start_Perform(statement)

    def start_Restart(self, statement):
        self.start_Perform(statement)

    def start_Put(self, statement):
        from symbols import File
        identifier = statement.get_file()
        identifier.resolved_as = self.__module.find_local_symbols(identifier.get_name(), 
                                                                  [File])
        
        identifier = statement.get_from()
        if not identifier:
            return
        identifier.resolved_as = self.__module.find_local_symbols(identifier.get_name(), 
                                                                  [File])
        
    def start_Write(self, statement):
        self.start_Put(statement)
        
    def start_Get(self, statement):
        from symbols import File
        identifier = statement.get_file()
        identifier.resolved_as = self.__module.find_local_symbols(identifier.get_name(), 
                                                                  [File])

    def start_Point(self, statement):
        self.start_Get(statement)
                
    def start_Job(self, statement):
        from symbols import File
        identifier = statement.get_input()
        if not identifier:
            return
        identifier.resolved_as = self.__module.find_local_symbols(identifier.get_name(), 
                                                                  [File])

    def start_Sort(self, statement):
        from symbols import File
        identifier = statement.get_sorted()
        if not identifier:
            return
        identifier.resolved_as = self.__module.find_local_symbols(identifier.get_name(), 
                                                                  [File])

        identifier = statement.get_to()
        if not identifier:
            return
        identifier.resolved_as = self.__module.find_local_symbols(identifier.get_name(), 
                                                                  [File])
        
    def start_Print(self, statement):
        from symbols import Report
        identifier = statement.get_report()
        identifier.resolved_as = self.__module.find_local_symbols(identifier.get_name(), 
                                                                  [Report])

    def start_Call(self, statement):
        from symbols import Module
        identifier = statement.get_called_program()
        result = self.__library.find_path(identifier.get_name(), 
                                          self.__module.get_path())

        identifier.resolved_as = []
        if result:
            identifier.resolved_as = [result]
        
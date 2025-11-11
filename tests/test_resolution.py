import unittest
from symbols import Library, Module, Procedure, File
from easytrieve_parser import Perform, Put


class TestResolution(unittest.TestCase):
    
    def test_resolve_procedure(self):
        
        lib = Library()

        module = Module('PGM.ezt', text='''
* 
PERFORM CLOSE-CUXAD-CURS

CLOSE-CUXAD-CURS. PROC.
END-PROC.
        
''')
        lib.add_module(module)
        
        module.light_parse()
        module.fully_parse()

        module.resolve()

        procedure = module.find_local_symbols('CLOSE-CUXAD-CURS', [Procedure])[0]
        perform = list(module.get_ast().get_sub_nodes(Perform))[0]
        identifier = perform.get_procedure()

        self.assertEqual([procedure],identifier.resolved_as)

    def test_resolve_file(self):
        
        lib = Library()

        module = Module('PGM.ezt', text='''
* 
FILE ME7232
  EXT-CRITERIA2                     1     5 N
  EXT-BANK2                         6     2 N
  EXT-BRANCH2                       8     5 N
  EXT-OBLIGOR2                     13    10 N
  EXT-OBLIGAT2                     23    10 N
  EXT-TYPE2                        33     5 A
  EXT-DATE2                        38     6 N
  EXT-AMOUNT2                      44    10 P 2
  EXT-MAT-DT2                      54     6 N
  EXT-ORIG-DT2                     60     6 N


EXTRACT-ROUTINE. PROC
  PUT ME7232
END-PROC      
''')
        lib.add_module(module)
        
        module.light_parse()
        module.fully_parse()

        module.resolve()

        file = module.find_local_symbols('ME7232', [File])[0]

        procedure = module.find_local_symbols('EXTRACT-ROUTINE', [Procedure])[0]
        put = list(procedure.get_ast().get_sub_nodes(Put))[0]
        identifier = put.get_file()

        self.assertEqual([file],identifier.resolved_as)



if __name__ == "__main__":
    unittest.main()

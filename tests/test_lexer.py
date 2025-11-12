import unittest
from lexer import EasyTrieveLexer, Comment, SQLText, String, Keyword


class TestLexer(unittest.TestCase):

    def test_basic(self):

        text = """
*------------------------------------------------------------------*
WCUST-DISP-CTR      W         5  P VALUE 0

 SQL DECLARE CUXAD-CURS          +
     CURSOR FOR                  +
        FROM CUST_TB
"""
        lexer = EasyTrieveLexer()
        tokens = list(lexer.get_tokens(text))

        self.assertEqual(Comment, tokens[0].type)
        self.assertEqual('WCUST-DISP-CTR', tokens[1])
        self.assertEqual('SQL', tokens[12])
        self.assertEqual(SQLText, tokens[13].type)

    def test_string(self):

        text = """
*------------------------------------------------------------------*
WCUST-DISP-CTR      VALUE 'XXX'
"""
        lexer = EasyTrieveLexer()
        tokens = list(lexer.get_tokens(text))

        self.assertEqual(Comment, tokens[0].type)
        self.assertEqual('WCUST-DISP-CTR', tokens[1])
        self.assertEqual("'XXX'", tokens[5])
        self.assertEqual(String, tokens[5].type)

    def test_string_continuation(self):

        text = """
*------------------------------------------------------------------*
WCUST-DISP-CTR      VALUE 'XX+
                           X'
"""
        lexer = EasyTrieveLexer()
        tokens = list(lexer.get_tokens(text))

        self.assertEqual(Comment, tokens[0].type)
        self.assertEqual('WCUST-DISP-CTR', tokens[1])
        self.assertEqual(String, tokens[5].type)
        self.assertEqual(4, tokens[5].end_line)
        self.assertEqual(29, tokens[5].end_column)

    def test_string_continuation_with_sql_inside(self):

        text = """
*------------------------------------------------------------------*
WCUST-DISP-CTR      VALUE 'XX+
    SQL COMMIT'
"""
        lexer = EasyTrieveLexer()
        tokens = list(lexer.get_tokens(text))

#         for token in tokens:
#             print(token)

        self.assertEqual(Comment, tokens[0].type)
        self.assertEqual('WCUST-DISP-CTR', tokens[1])
        self.assertEqual(String, tokens[5].type)
        self.assertEqual(4, tokens[5].end_line)
        self.assertEqual(15, tokens[5].end_column)

    def test_remove_continuation_character(self):

        text = """
*------------------------------------------------------------------*
GET -
  MYFILE.

"""
        lexer = EasyTrieveLexer()
        tokens = list(lexer.get_tokens(text))

        for token in tokens:
            self.assertFalse(token == '-')

    def test_sql_not_at_start(self):

        text = """
*------------------------------------------------------------------*
 FILE UT01 SQL (  +
  SELECT   Z1.A_ADVC 
"""
        lexer = EasyTrieveLexer()
        tokens = list(lexer.get_tokens(text))

        self.assertEqual(Keyword, tokens[6].type)
        self.assertEqual(SQLText, tokens[7].type)
        self.assertEqual(''' (  
  SELECT   Z1.A_ADVC''', tokens[7].text)

    def test_sql_not_at_start_one_line(self):

        text = """
*------------------------------------------------------------------*
 FILE UT01 SQL SELECT   Z1.A_ADVC 
*------------------------------------------------------------------*
"""
        lexer = EasyTrieveLexer()
        tokens = list(lexer.get_tokens(text))

        self.assertEqual(Keyword, tokens[6].type)
        self.assertEqual(SQLText, tokens[7].type)
        self.assertEqual(''' SELECT   Z1.A_ADVC ''', tokens[7].text)

    def test_sql_continuation_with_spaces_after(self):

        text = """
W-VERSION-CHAR    W-VERSION  1   A   OCCURS 32                                  
                                                                                
 SQL INCLUDE LOCATION * FROM SYSIBM.SYSPACKAGE                                  
                                                                                
* CURSOR FOR CPACKAGE DETAILS                                                   
 SQL DECLARE CPACKAGE CURSOR FOR                   +                            
     SELECT 1 FROM SYSIBM.SYSPACKAGE               +                            
       WHERE COLLID = :W-COLLID                    +                            
         AND NAME = :W-PACKAGE                     +                            
         AND VERSION = :W-VERSION                                               
                                                                                
SORT UT01 TO UT01 USING (IN-REC)                                                
"""
        lexer = EasyTrieveLexer()
        tokens = list(lexer.get_tokens(text))
        
        self.assertEqual(SQLText, tokens[18].type)
        self.assertEqual(7, tokens[18].get_begin_line())
        self.assertEqual(11, tokens[18].get_end_line())


if __name__ == "__main__":
    unittest.main()

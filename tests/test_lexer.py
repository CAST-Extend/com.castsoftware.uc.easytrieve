import unittest
from lexer import EasyTrieveLexer, Comment, SQLText, String


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


if __name__ == "__main__":
    unittest.main()

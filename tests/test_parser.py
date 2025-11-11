import unittest
from easytrieve_parser import parse, Macro, Procedure, Program, File, Job, Sort, Data, SQL
from easytrieve_parser import Put, Write


class TestParser(unittest.TestCase):
    
    def test_parse_macro_with_begin_program(self):

        text = """BEGIN_PROGRAM(EZTCOPYA)
MACRO 0 LOC() PFX() SFX() H('  ')
"""

        ast = list(parse(text))
        
        node = ast[0]
        self.assertEqual(Macro, type(node))

    def test_parse_program_with_begin_program(self):

        text = """BEGIN_PROGRAM(DEMODB2A)
*------------------------------------------------------------------*
* PROGRAM: DEMODB2A                                                *
* PURPOSE: DEMONSTRATE NATIVE SQL SUPPORT                          *
*                                                                  *
* EASYTRAN:  DEBUG=(NOLKGO)                                        *
* EASYTRAN:  DCLINCL DCLACCTB                                      *
* END-EASYTRAN                                                     *
*------------------------------------------------------------------*

PARM SSID('DB2B') SQLID('TESTDB2')
LINE 1 WCUST-ID             +
       WCUST-ACCT-PRDCT-CD  +
       WCUST-ACCT-ID
END_PROGRAM
"""

        ast = list(parse(text))
        
        node = ast[0]
        self.assertEqual(Program, type(node))

    def test_parse_program_with_procedure(self):

        text = """
*------------------------------------------------------------------*
* PROGRAM: DEMODB2A                                                *
* PURPOSE: DEMONSTRATE NATIVE SQL SUPPORT                          *
*                                                                  *
* EASYTRAN:  DEBUG=(NOLKGO)                                        *
* EASYTRAN:  DCLINCL DCLACCTB                                      *
* END-EASYTRAN                                                     *
*------------------------------------------------------------------*

PARM SSID('DB2B') SQLID('TESTDB2')

CLOSE-CUXAD-CURS. PROC.

  SQL CLOSE CUXAD-CURS

  CASE SQLCODE
       WHEN 0
           DISPLAY 'CUXAD GOOD CLOSE ' SQLCODE
       OTHERWISE
           DISPLAY ' 1603  CUXAD OPEN  **ERROR*' SQLCODE
           WCUST-DISP-CTR = 100
  END-CASE

END-PROC.



LINE 1 WCUST-ID             +
       WCUST-ACCT-PRDCT-CD  +
       WCUST-ACCT-ID
END_PROGRAM
"""

        ast = list(parse(text))
        
        node = ast[0]
        self.assertEqual(Program, type(node))

        procedure = list(node.get_sub_nodes(Procedure))[0]
        self.assertEqual(Procedure, type(procedure))
        
        self.assertEqual(13, procedure.get_begin_line())
        self.assertEqual(25, procedure.get_end_line())
        self.assertEqual('CLOSE-CUXAD-CURS', procedure.get_name())

    def test_parse_file_01(self):

        text = """
*------------------------------------------------------------------*
* PROGRAM: DEMODB2B                                                *
* PURPOSE: DEMONSTRATE THE USE OF SQL FILE AS INPUT.               *
*                                                                  *
* EASYTRAN:  DCLINCL DCLACCTB                                      *
* END-EASYTRAN                                                     *
*------------------------------------------------------------------*
PARM SSID('DB2B') SQLID('TESTDB2')

FILE FILEIN1 SQL
SQL INCLUDE                                          +
          (CUST_ID, CUST_ACCT_PRDCT_CD CUST_ACCT_ID) +
       LOCATION *                                    +
       NULLABLE                                      +
       FROM CUST_TB

WCUST-CTR           W         5  P VALUE 0

JOB INPUT FILEIN1
WCUST-CTR = WCUST-CTR + 1
IF WCUST-CTR = 100
   STOP
END-IF.
"""

        ast = list(parse(text))
        
        node = ast[0]
        self.assertEqual(Program, type(node))

        file = list(node.get_sub_nodes(File))[0]
        self.assertEqual(11, file.get_begin_line())
        # it has eaten the SQL statement
        self.assertEqual(16, file.get_end_line())

        self.assertEqual('FILEIN1', file.get_name())

        data = list(node.get_sub_nodes(Data))[0]
        self.assertEqual(18, data.get_begin_line())
        self.assertEqual(18, data.get_end_line())

        job = list(node.get_sub_nodes(Job))[0]
        self.assertEqual(20, job.get_begin_line())
        self.assertEqual(24, job.get_end_line())

    def test_parse_sql(self):
        
        text = """
PARM SSID('DB2B') SQLID('TESTDB2')

SQL INCLUDE                                          +
          (CUST_ID, CUST_ACCT_PRDCT_CD CUST_ACCT_ID) +
       LOCATION *                                    +
       NULLABLE                                      +
       FROM CUST_TB

WCUST-CTR           W         5  P VALUE 0

JOB INPUT FILEIN1
WCUST-CTR = WCUST-CTR + 1
IF WCUST-CTR = 100
   STOP
END-IF.
"""

        ast = list(parse(text))
        
        node = ast[0]
        self.assertEqual(Program, type(node))

        sql = list(node.get_sub_nodes(SQL))[0]
        self.assertEqual(4, sql.get_begin_line())
        self.assertEqual(8, sql.get_end_line())
        
        self.assertEqual(''' INCLUDE
          (CUST_ID, CUST_ACCT_PRDCT_CD CUST_ACCT_ID)
       LOCATION *
       NULLABLE
       FROM CUST_TB''', sql.get_sql_text())

        self.assertEqual('INCLUDE (CUST_ID, CUST_ACCT_PRDCT_CD CUST_ACCT_ID)', sql.get_name())

    def test_parse_put_from(self):
        
        text = """
PARM SSID('DB2B') SQLID('TESTDB2')

PUT FILE1
PUT FILE1 FROM FILE2
PUT FILE1
"""

        ast = list(parse(text))
        
        node = ast[0]
        self.assertEqual(Program, type(node))

        puts = list(node.get_sub_nodes(Put))
        self.assertEqual(3, len(puts))
        self.assertEqual('FILE2', puts[1].get_from().get_name())

    def test_parse_write_from(self):
        
        text = """
PARM SSID('DB2B') SQLID('TESTDB2')

WRITE FILE1
WRITE FILE2 UPDATE FROM FILE2
WRITE FILE1
"""

        ast = list(parse(text))
        
        node = ast[0]
        self.assertEqual(Program, type(node))

        puts = list(node.get_sub_nodes(Write))
        self.assertEqual(3, len(puts))
        self.assertEqual('FILE2', puts[1].get_from().get_name())

    def test_parse_job(self):
        
        text = """
PARM SSID('DB2B') SQLID('TESTDB2')

JOB INPUT M8234D START(GET-PROCESS-DATE) FINISH(ACH-PROC)
  TRAN-WORK = PROOF-TRAN-RECORD
  PERFORM TEST-TRANS

*
JOB INPUT M8124D START(START-OBLIGAT-PROC) FINISH(LAST-REC-PROC)
*

"""

        ast = list(parse(text))
        
        node = ast[0]
        self.assertEqual(Program, type(node))

        jobs = list(node.get_sub_nodes(Job))
        self.assertEqual(2, len(jobs))
        self.assertEqual('M8234D', jobs[0].get_input().get_name())
        self.assertEqual('M8124D', jobs[1].get_input().get_name())

    def test_parse_job(self):
        
        text = """
PARM SSID('DB2B') SQLID('TESTDB2')

SORT PERSNL TO SORTWRK USING +
(REGION, BRANCH) NAME MYSORT
JOB INPUT SORTWRK NAME MYPROG
PRINT REPORT1

"""

        ast = list(parse(text))
        
        node = ast[0]
        self.assertEqual(Program, type(node))

        jobs = list(node.get_sub_nodes(Sort))
        self.assertEqual(1, len(jobs))
        self.assertEqual('PERSNL', jobs[0].get_sorted().get_name())
        self.assertEqual('SORTWRK', jobs[0].get_to().get_name())



if __name__ == "__main__":
    unittest.main()


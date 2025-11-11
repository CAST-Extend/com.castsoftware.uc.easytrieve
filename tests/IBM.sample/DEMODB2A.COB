       PROCESS ADV,FASTSRT,OPT
       PROCESS NUMPROC(NOPFD),TRUNC(BIN),NOLIST

       PROCESS LIST,MAP,NODYNAM                                         EASYT007
       PROCESS FASTSRT                                                  EASYT007
       PROCESS ARITH(EXTEND)                                            EASYT007
      ***************************************************************** EASYT007
      ** FS/PENGI V05.01, COPYRIGHT (C) 2020 TRANSIOM SOFTWARE INC.   * EASYT007
      ** EASYT007 - CHANGE LEVEL 372, DATE=04/09/2024, TIME 16.00.   ** EASYT007
      **                                                             ** EASYT007
      ** PROGRAM: NONAME - PENGIEZT RUN DATE: 06/22/24 TIME: 05.28   ** EASYT007
      *                                                               * EASYT007
      *  GENERATING OPTIONS:                                          * EASYT007
      *    COPYBOOK=NO,COPYNTAB=,COBVERBS=YES,DATEABE=NO,             * EASYT007
      *    DOWHILE=PERFORM,FSIGN=ALL,IOCODE=EASYT,IOMODE=DYNAM,       * EASYT007
      *    OVERFOLW=TAG,THRESMOD=FIX,SPOOLOPT=YES,MOVENUM=EASYT       * EASYT007
      *    EZVERS=STD                                                 * EASYT007
      *                                                               * EASYT007
      *---------------------------------------------------------------* EASYT007
      * TRANSLATOR GENERATED WARNINGS:                                * EASYT007
      *                                                               * EASYT007
      **                                                             ** EASYT007
      ***************************************************************** EASYT007
                                                                        EASYT007
      ***************************************************************** COBOLBAS
      * FS/PENGI GENERATED FILES IN THIS PROGRAM ARE:                 * COBOLBAS
      *                                                               * COBOLBAS
      *  DDNAME   SYSNAME   ORGANIZATION    ACCESS    FILEIO          * COBOLBAS
      *  ------   -------   ------------    ------    ------          * COBOLBAS
      * SYSPRINT            PRINTER        SEQUENTIAL  GEN/PRINT      * GENFILE
      *                                                               * COBOLBAS
      ******************* FS/PENGI GENERATED REPORT1 ****************** GENERATQ
      *                                                               * GENERATQ
      *  DDNAME   SYSNAME    REPORT TYPE   CTL BREAKS   SORT  READ    * GENERATQ
      *  ------   -------    -----------   ----------   ----  ----    * GENERATQ
      * SYSPRINT             1-UP FRAME        1         NO    NO     * GENERATQ
      *                                                               * GENERATQ
      *    CONTROL BREAK(S): LV1  =  FINAL                            * GENERATQ
      *                                                               * GENERATQ
      ***************************************************************** COBOLBAS
       EJECT                                                            COBOLBAS
       IDENTIFICATION DIVISION.                                         COBOLBAS
       PROGRAM-ID. NONAME.                                              COBOLBAS
       AUTHOR. NOAUTHOR.                                                COBOLBAS
       ENVIRONMENT DIVISION.                                            COBOLBAS
       CONFIGURATION SECTION.                                           COBOLBAS
       SOURCE-COMPUTER.  IBM-S370.                                      COBOLBAS
       OBJECT-COMPUTER.  IBM-S370.                                      COBOLBAS
       SPECIAL-NAMES.                                                   COBOLBAS
                        C01 IS CH1                                      COBOLBAS
                        C02 IS CH2                                      COBOLBAS
                        C03 IS CH3                                      COBOLBAS
                        C04 IS CH4                                      COBOLBAS
                        C05 IS CH5                                      COBOLBAS
                        C06 IS CH6                                      COBOLBAS
                        C07 IS CH7                                      COBOLBAS
                        C08 IS CH8                                      COBOLBAS
                        C09 IS CH9                                      COBOLBAS
                        C10 IS CH10                                     COBOLBAS
                        C11 IS CH11                                     COBOLBAS
                        C12 IS CH12                                     COBOLBAS
           CURRENCY SIGN IS '$'.                                        COBOLBAS
                                                                        COBOLBAS
       INPUT-OUTPUT SECTION.                                            COBOLBAS
       FILE-CONTROL.                                                    COBOLBAS
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI EXPANDED SEQUENTIAL SYSPRINT FILE ENTRY.                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
           SELECT SYSPRINT ASSIGN TO S-SYSPRINT                         GENFILE
                  ORGANIZATION IS SEQUENTIAL                            GENFILE
                  FILE STATUS IS SYSPRINT-STATUS                        GENFILE
                  ACCESS MODE IS SEQUENTIAL.                            GENFILE
                                                                        GENFILE
       DATA DIVISION.                                                   COBOLBAS
       FILE SECTION.                                                    COBOLBAS
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED FD FOR REPORT1 REPORT.                  * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       FD  SYSPRINT                                                     GENERATQ
           RECORDING MODE IS F                                          GENERATQ
           LABEL RECORDS ARE OMITTED                                    GENERATQ
           BLOCK CONTAINS 0 RECORDS                                     GENERATQ
           RECORD CONTAINS 132                                          GENERATQ
           DATA RECORD IS SYSPRINT-RECORD.                              GENERATQ
       01  SYSPRINT-RECORD PIC X(132).                                  GENERATQ
                                                                        GENERATQ
       WORKING-STORAGE SECTION.                                         COBOLBAS
                                                                        EASYT007
      ***************************************************************** EASYT007
      * GENERAL PURPOSE INDEX AND SUBSCRIPT COUNTERS.                 * EASYT007
      ***************************************************************** EASYT007
       01  WORK-AREA0.                                                  EASYT007
           02 PARM-REGISTER          USAGE IS POINTER.                  EASYT007
           02 PARM-REGISTER-9 REDEFINES PARM-REGISTER PIC S9(09) COMP.  EASYT007
           02 PARM-LENGTH            PIC S9(04) COMP VALUE ZEROS.       EASYT007
           02 WS-FAKE-INDEX          PIC S9(09) COMP VALUE ZEROS.       EASYT007
           02 WS-WORK-INDEX REDEFINES WS-FAKE-INDEX USAGE IS INDEX.     EASYT007
           02 WS-PENGI-PAGE          PIC   ZZ,ZZZ-.                     EASYT007
           02 WS-PENGI-MOVE-G.                                          EASYT007
              03 FILLER              PIC X(32).                         EASYT007
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR PENGI-STATUS-TAB.         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  PENGI-STATUS-TAB.                                            DEFINE
           02 PENGI-CODE0            PIC 9(02) VALUE 0.                 DEFINE
           02 PENGI-STATUS           PIC X(200) VALUE ALL '24'.         DEFINE
           02 PENGI-CODES REDEFINES PENGI-STATUS OCCURS 100 TIMES       DEFINE
                                     PIC 9(02).                         DEFINE
           02 SYSPRINT-EZSTATUS     COMP PIC S9(09).                    DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR PENGI-STATUS-TAB IS 206
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR WORK-AREA1.               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  WORK-AREA1.                                                  DEFINE
           02 FILLER                 PIC X(16) VALUE 'WORK-AREA1'.      DEFINE
           02 WS-PENGI-DYN-ALLOC.                                       DEFINE
              03 FILLER                COMP PIC S9(4) VALUE 80.         DEFINE
              03 WS-PENGI-ALLOC-REQ     PIC X(20) VALUE SPACES.         DEFINE
              03 WS-PENGI-ALLOC-TEXT    PIC X(60) VALUE                 DEFINE
              'SPACE=(CYL,(10,50),RLSE),UNIT=SYSDA'.                    DEFINE
           02 WS-PENGI-DYN-SYSOUT.                                      DEFINE
              03 FILLER                COMP PIC S9(4) VALUE 80.         DEFINE
              03 WS-PENGI-SYSOUT-REQ    PIC X(20) VALUE SPACES.         DEFINE
              03 WS-PENGI-SYSOUT-TEXT   PIC X(60) VALUE                 DEFINE
              'SYSOUT=*,REFDD=SYSPRINT'.                                DEFINE
           02 WS-PENGI-DYN-DEALLOC.                                     DEFINE
              03 FILLER                COMP PIC S9(4) VALUE 20.         DEFINE
              03 WS-PENGI-DEALLOC-REQ   PIC X(20) VALUE SPACES.         DEFINE
           02 WS-PENGI-FSYSVC99      PIC X(08) VALUE 'FSYSVC99'.        DEFINE
           02 WS-PENGI-EZ-STAT1.                                        DEFINE
              03 FILLER                 PIC X(32) VALUE                 DEFINE
              '    - - - - - IO STATISTICS FOR '.                       DEFINE
              03 WS-PENGI-EZ-JID        PIC X(3) VALUE 'JOB'.           DEFINE
              03 WS-PENGI-EZ-JOB        PIC X(2).                       DEFINE
              03 FILLER                 PIC X(10) VALUE ' - - - -'.     DEFINE
           02 WS-PENGI-EZ-STAT2.                                        DEFINE
              03 FILLER                 PIC X(60) VALUE                 DEFINE
              '  FILE  ---I/O COUNT--- ORG     RECFM   I/O    LRECL   IODEFINE
      -    'M'.                                                         DEFINE
              03 FILLER                 PIC X(03) VALUE SPACES.         DEFINE
              03 FILLER                 PIC X(07) VALUE 'BLKSIZE'.      DEFINE
           02 WS-PENGI-EZ-STAT3.                                        DEFINE
              03 WS-PENGI-EZ-DDNAME     PIC X(08).                      DEFINE
              03 WS-PENGI-EZ-IO-COUNT   PIC ZZZ,ZZZ,ZZZ,ZZ9.            DEFINE
              03 FILLER                 PIC X(01) VALUE SPACES.         DEFINE
              03 WS-PENGI-EZ-ORG        PIC X(08).                      DEFINE
              03 FILLER                 PIC X(01) VALUE SPACES.         DEFINE
              03 WS-PENGI-EZ-RECFM      PIC X(3).                       DEFINE
              03 FILLER                 PIC X(03) VALUE SPACES.         DEFINE
              03 WS-PENGI-EZ-IOTYPE     PIC X(7).                       DEFINE
              03 FILLER                 PIC X(01) VALUE SPACES.         DEFINE
              03 WS-PENGI-EZ-LRECL      PIC ZZ,ZZ9.                     DEFINE
              03 FILLER                 PIC X(01) VALUE SPACES.         DEFINE
              03 WS-PENGI-EZ-IOMOD      PIC X(08) VALUE SPACES.         DEFINE
              03 FILLER                 PIC X(02) VALUE SPACES.         DEFINE
              03 WS-PENGI-EZ-BLKSIZE    PIC ZZZ,ZZ9.                    DEFINE
           02 WS-PENGI-EZ-SINP-RECS  COMP-3 PIC S9(18) VALUE ZERO.      DEFINE
           02 WS-PENGI-EZ-SOUT-RECS  COMP-3 PIC S9(18) VALUE ZERO.      DEFINE
           02 WS-PENGI-NULL         COMP PIC S9(04) VALUE -1.           DEFINE
           02 WS-PENGI-ZERO         COMP PIC S9(04) VALUE 0.            DEFINE
           02 WS-PENGI-RETURN       COMP PIC S9(09) VALUE 0.            DEFINE
           02 WS-INTEGER-S9-D0      COMP-3 PIC S9(18) VALUE ZERO.       DEFINE
           02 WS-INTEGER-F9-D0      COMP-3 PIC 9(18) VALUE ZERO.        DEFINE
           02 WS-INTEGER-Q9-D0       PIC X(18) VALUE SPACE.             DEFINE
           02 WS-INTEGER-Z9-D0       PIC 9(18) VALUE ZERO.              DEFINE
           02 WS-PENGI-DATE          PIC X(08).                         DEFINE
           02 WS-PENGI-DATE-E REDEFINES WS-PENGI-DATE                   DEFINE
                                     PIC 99/99/99.                      DEFINE
           02 WS-PENGI-DATE-9        PIC 9(06) VALUE ZERO.              DEFINE
           02 WS-PENGI-DATE-P        PIC Z9/99/99.                      DEFINE
           02 WS-PENGI-DATE-PX REDEFINES WS-PENGI-DATE-P                DEFINE
                                     PIC X(08).                         DEFINE
           02 WS-PENGI-DATE-LONG     PIC X(10).                         DEFINE
           02 WS-PENGI-DATE-LONG-E REDEFINES WS-PENGI-DATE-LONG         DEFINE
                                     PIC 99/99/9999.                    DEFINE
           02 WS-PENGI-DATE-LONG-9   PIC 9(08) VALUE ZERO.              DEFINE
           02 WS-PENGI-DATE-LONG-P   PIC Z9/99/9999.                    DEFINE
           02 WS-PENGI-DATE-LONG-PX REDEFINES WS-PENGI-DATE-LONG-P      DEFINE
                                     PIC X(10).                         DEFINE
           02 WS-PENGI-TIME          PIC X(08).                         DEFINE
           02 WS-PENGI-TIME-E REDEFINES WS-PENGI-TIME                   DEFINE
                                     PIC 99/99/99.                      DEFINE
           02 WS-PENGI-TIME-9        PIC 9(08) VALUE ZERO.              DEFINE
           02 WS-PENGI-TIME-P        PIC Z9/99/99.                      DEFINE
           02 WS-PENGI-SORT-RETURN   PIC S9(5).                         DEFINE
           02 WS-PENGI-FCSIGN       COMP PIC S9(6).                     DEFINE
           02 WS-PENGI-STOP-EXCID    PIC X(06).                         DEFINE
           02 WS-JOB1-REPORT-SKIP   COMP PIC S9(4) VALUE 0.             DEFINE
           02 WS-JOB1-REPORT-LEVL   COMP PIC S9(4) VALUE 0.             DEFINE
           02 WS-JOB1-ABEND          PIC X(1) VALUE 'N'.                DEFINE
           02 WS-JOB1-FLAG           PIC 9(1) VALUE 0.                  DEFINE
              88 JOB1-PENDING         VALUE 0.                          DEFINE
              88 JOB1-REQUEST-STOP    VALUE 2 3.                        DEFINE
              88 JOB1-STOP-JOB        VALUE 2.                          DEFINE
              88 JOB1-STOP-RUN        VALUE 3.                          DEFINE
              88 JOB1-SPECIAL-PROC    VALUE 4 5.                        DEFINE
              88 JOB1-START-PROC      VALUE 4.                          DEFINE
              88 JOB1-FINISH-PROC     VALUE 5.                          DEFINE
           02 WS-JOB1-SORTED         PIC X(1) VALUE 'N'.                DEFINE
           02 WS-JOB1-REPORT1-SW     PIC X VALUE SPACE.                 DEFINE
           02 WS-PENGI-SQL-PARMS.                                       DEFINE
              03 WS-PENGI-DB2-PLAN      PIC X(08) VALUE '?'.            DEFINE
              03 FILLER                 PIC X(01) VALUE ':'.            DEFINE
              03 WS-PENGI-DB2-SSID      PIC X(04) VALUE 'DB2B'.         DEFINE
              03 FILLER                 PIC X(01) VALUE ':'.            DEFINE
              03 WS-PENGI-DB2-SQLID     PIC X(08) VALUE 'TESTDB2'.      DEFINE
              03 FILLER                 PIC X(01) VALUE ':'.            DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR WORK-AREA1 IS 602
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR WORK-GAREA0.              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  WORK-GAREA0.                                                 DEFINE
           02 WCUST-DISP-CTR        COMP-3 PIC 9(9) VALUE 0.            DEFINE
           02 WCUST-ID               PIC X(9) VALUE ' '.                DEFINE
           02 WCUST-ACC-PRD-CD       PIC X(3) VALUE ' '.                DEFINE
           02 WCUST-ACCT-ID          PIC X(23) VALUE ' '.               DEFINE
           02 WCUST-ACC-ID-NUL      COMP PIC S9(04) VALUE +0.           DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR WORK-GAREA0 IS 42
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0001.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0001.                                                    DEFINE
           02 DLN-0001-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(17) VALUE                   DEFINE
              ' CUXAD GOOD OPEN '.                                      DEFINE
              03 DLN-0001-SQLCODE   PIC Z,ZZZ,ZZZ,ZZZ-.                 DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0001 IS 31
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0002.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0002.                                                    DEFINE
           02 DLN-0002-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(27) VALUE                   DEFINE
              ' 1603  CUXAD OPEN  **ERROR '.                            DEFINE
              03 DLN-0002-SQLCODE   PIC Z,ZZZ,ZZZ,ZZZ-.                 DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0002 IS 41
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0003.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0003.                                                    DEFINE
           02 DLN-0003-GROUP-0.                                         DEFINE
              03 DLN-0003-WCUST-ID  PIC X(9).                           DEFINE
              03 DLN-0003-WCUST-ACC-PRD-CD PIC X(3).                    DEFINE
              03 DLN-0003-WCUST-ACCT-ID PIC X(23).                      DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0003 IS 35
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0004.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0004.                                                    DEFINE
           02 DLN-0004-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(23) VALUE                   DEFINE
              ' CUXAD   FETCH *ERROR* '.                                DEFINE
              03 DLN-0004-SQLCODE   PIC Z,ZZZ,ZZZ,ZZZ-.                 DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0004 IS 37
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0005.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0005.                                                    DEFINE
           02 DLN-0005-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(17) VALUE                   DEFINE
              'CUXAD GOOD CLOSE '.                                      DEFINE
              03 DLN-0005-SQLCODE   PIC Z,ZZZ,ZZZ,ZZZ-.                 DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0005 IS 31
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0006.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0006.                                                    DEFINE
           02 DLN-0006-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(27) VALUE                   DEFINE
              ' 1603  CUXAD OPEN  **ERROR*'.                            DEFINE
              03 DLN-0006-SQLCODE   PIC Z,ZZZ,ZZZ,ZZZ-.                 DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0006 IS 41
                                                                        EASYT007
           EXEC SQL                                                     EASYT007
                INCLUDE SQLCA                                           EASYT007
           END-EXEC.                                                    EASYT007
                                                                        DCLINCL
           EXEC SQL                                                     DCLINCL
                INCLUDE DCLACCTB                                        DCLINCL
           END-EXEC.                                                    DCLINCL
                                                                        DEFINE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI REPORT1 LINE STORAGE DEFINITION FOR F01-HD01.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  F01-HD01.                                                    DEFINE
           02 F01-HD01-GROUP-0.                                         DEFINE
              03 FILLER             PIC X(25) VALUE SPACES.             DEFINE
              03 FILLER               PIC X(29) VALUE                   DEFINE
              'CUSTOMER PRODUCT CODE LISTING'.                          DEFINE
              03 FILLER             PIC X(26) VALUE SPACES.             DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR F01-HD01 IS 80
                                                                        DEFINE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI REPORT1 LINE STORAGE DEFINITION FOR F01-HD02.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  F01-HD02.                                                    DEFINE
           02 FILLER             PIC X(80) VALUE SPACES.                DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR F01-HD02 IS 80
                                                                        DEFINE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI REPORT1 LINE STORAGE DEFINITION FOR F01-LN01.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  F01-LN01.                                                    DEFINE
           02 F01-LN01-GROUP-0.                                         DEFINE
              03 FILLER             PIC X(11) VALUE SPACES.             DEFINE
              03 F01-LN01-WCUST-ID  PIC X(9).                           DEFINE
              03 FILLER             PIC X(11) VALUE SPACES.             DEFINE
              03 F01-LN01-WCUST-ACC-PRD-CD PIC X(3).                    DEFINE
              03 FILLER             PIC X(11) VALUE SPACES.             DEFINE
              03 F01-LN01-WCUST-ACCT-ID PIC X(23).                      DEFINE
              03 FILLER             PIC X(12) VALUE SPACES.             DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR F01-LN01 IS 80
                                                                        DEFINE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI REPORT1 LINE STORAGE DEFINITION FOR F01-CF01.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  F01-CF01.                                                    DEFINE
           02 F01-CF01-GROUP-0.                                         DEFINE
              03 FILLER             PIC X(11) VALUE SPACES.             DEFINE
              03 F01-CF01-WCUST-ID  PIC X(9).                           DEFINE
              03 FILLER             PIC X(11) VALUE SPACES.             DEFINE
              03 F01-CF01-WCUST-ACC-PRD-CD PIC X(3).                    DEFINE
              03 FILLER             PIC X(11) VALUE SPACES.             DEFINE
              03 F01-CF01-WCUST-ACCT-ID PIC X(23).                      DEFINE
              03 FILLER             PIC X(12) VALUE SPACES.             DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR F01-CF01 IS 80
                                                                        EASYT007
       01  PROGRAM-INFO-TABLE.                                          COBOLBAS
           02 PROGRAM-NAME    PIC X(08) VALUE 'NONAME'.                 COBOLBAS
           02 PROGRAM-TYPE    PIC X(08) VALUE 'COBOL-4'.                COBOLBAS
           02 PROGRAM-OPSYS   PIC X(04) VALUE 'MVS'.                    COBOLBAS
           02 PROGRAM-DATE    PIC X(08) VALUE '06/22/24'.               COBOLBAS
           02 PROGRAM-TIME    PIC X(08) VALUE '05.28'.                  COBOLBAS
           02 ABEND-REQUEST   PIC 9(04) VALUE ZEROES.                   COBOLBAS
           02 ABEND-MESSAGE   PIC X(80) VALUE SPACES.                   COBOLBAS
                                                                        FUNCTION
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * CCL1 GENERATED FUNCTION RETURN CODES                          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  WS-FUNCTION-RETURN-CODES.                                    FUNCTION
           02 RC       OCCURS 0001 TIMES PIC 9(9) COMP.                 FUNCTION
           02 RC-COBSTAT                   PIC 9(09) COMP.              FUNCTION
           02 RC-BOOLEAN                   PIC 9(09) COMP.              FUNCTION
           02 RC-DATESWP                   PIC 9(09) COMP.              FUNCTION
           02 RC-REPCHR0                   PIC 9(09) COMP.              FUNCTION
           02 RC-HEXSTR0                   PIC 9(09) COMP.              FUNCTION
           02 RC-HEXSTR1                   PIC 9(09) COMP.              FUNCTION
           02 RC-ABEND00                   PIC 9(09) COMP.              FUNCTION
           02 RC-ABRCODE                   PIC 9(09) COMP.              FUNCTION
           02 RC-CHKOVF0                   PIC 9(09) COMP.              FUNCTION
           02 RC-PRINTSRV                  PIC 9(09) COMP.              FUNCTION
                                                                        FUNCTION
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED INTERNAL BUCKETS.                       * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
       01  PENGI-RESERVED-FIELDS.                                       GRESERVE
           02 PENGI-COUNT       PIC 9(05) COMP-3 VALUE 1.               GRESERVE
           02 PENGI-PAGE        PIC 9(07) COMP-3 VALUE ZEROES.          GRESERVE
           02 PENGI-DATE        PIC X(08) VALUE SPACES.                 GRESERVE
           02 PENGI-DATE-2 REDEFINES PENGI-DATE PIC 99/99/99.           GRESERVE
           02 PENGI-TIME-1.                                             GRESERVE
              03 PENGI-TIME     PIC 9(06) VALUE ZEROES.                 GRESERVE
              03 FILLER        PIC 9(02) VALUE ZEROES.                  GRESERVE
           02 PENGI-TIME-2 REDEFINES PENGI-TIME-1 PIC 9(08).            GRESERVE
           02 PENGI-ASKTIME     PIC S9(15) COMP-3.                      GRESERVE
           02 PENGI-CTLID       PIC X(64).                              GRESERVE
           02 PENGI-CTL         PIC X(64).                              GRESERVE
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED STORAGE COUNTERS.                       * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
       01  PENGI-NEXT-LINE.                                             GENERATQ
           02 FILLER            PIC X(01) VALUE SPACES.                 GENERATQ
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED REPORT1 REPORT STORAGE AREAS.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
       01  PENGI-REPORT1-GROUP.                                         GENERATQ
           02 REPORT1-DEBUGID   PIC X(02) VALUE ' '.                    GENERATQ
           02 REPORT1-DEBUGID-N REDEFINES                               GENERATQ
              REPORT1-DEBUGID   PIC 9(02).                              GENERATQ
           02 REPORT1-LINE0     PIC S9(09) COMP   VALUE 58.             GENERATQ
           02 REPORT1-LMAX0     PIC S9(09) COMP   VALUE 59.             GENERATQ
           02 REPORT1-LMAX1     PIC S9(09) COMP   VALUE 58.             GENERATQ
           02 REPORT1-LMAX2     PIC S9(09) COMP   VALUE 57.             GENERATQ
           02 REPORT1-LMAX3     PIC S9(09) COMP   VALUE 56.             GENERATQ
           02 REPORT1-LORPH     PIC S9(09) COMP   VALUE 0.              GENERATQ
           02 REPORT1-PAGE0     PIC 9(07) COMP-3 VALUE ZERO.            GENERATQ
           02 REPORT1-COUNT     PIC 9(11) COMP-3 VALUE ZERO.            GENERATQ
           02 REPORT1-CNTRL     PIC X(01)        VALUE SPACES.          GENERATQ
           02 REPORT1-FOOTSW    PIC X(01)        VALUE 'N'.             GENERATQ
              88 REPORT1-FOOTON VALUE 'Y'.                              GENERATQ
           02 REPORT1-PENGI-CTL  PIC X(64) JUST RIGHT VALUE SPACES.     GENERATQ
           02 REPORT1-PENGI-CTLID PIC X(64) JUST RIGHT VALUE SPACES.    GENERATQ
           02 REPORT1-PENGI-CTLIDL  PIC S9(09) COMP VALUE 11.           GENERATQ
           02 REPORT1-PENGI-CTLDISP PIC S9(09) COMP VALUE ZERO.         GENERATQ
           02 REPORT1-PENGI-FIRST-SW PIC X(01) VALUE 'S'.               GENERATQ
              88 REPORT1-FIRST-DETAIL  VALUE 'S' 'H'.                   GENERATQ
              88 REPORT1-AFTER-BREAK   VALUE 'S'.                       GENERATQ
              88 REPORT1-NO1ST-DETAIL  VALUE 'N'.                       GENERATQ
           02 REPORT1-PAGE-RENUM-SW    PIC X(01) VALUE SPACE.           GENERATQ
              88 REPORT1-PAGE-RENUM   VALUE 'Y'.                        GENERATQ
           02 REPORT1-LSEQ-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-ADV-CNTRL  PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-PAGE-SIZE  PIC S9(09) COMP VALUE 58.              GENERATQ
           02 REPORT1-DSPL-SIZE  PIC S9(09) COMP VALUE 66.              GENERATQ
           02 REPORT1-CSKP-CNTRL PIC S9(09) COMP VALUE 1.               GENERATQ
           02 REPORT1-LNXT-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
      *,REPORT1-LGRP-CNTRL = THE NUMBER OF LINES IN DTL LINES GROUP
           02 REPORT1-LGRP-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-L1ST-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-LSAV-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-DSKP-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-RSKP-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-WSKP-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-HSKP-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-HOFF-CNTRL PIC S9(09) COMP VALUE 1.               GENERATQ
           02 REPORT1-PNXT-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-PADV-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-PADJ-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-FINL-CNTRL PIC X VALUE 'N'.                       GENERATQ
           02 REPORT1-PFOOT-LEVL PIC 9(03) COMP-3 VALUE ZERO.           GENERATQ
                                                                        GENERATQ
           02 REPORT1-PSKP-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-LXIT-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-DADV-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-RXIT-IO    PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT1-PENGI-RECORD PIC X(132).                          GENERATQ
           02 REPORT1-HEADER-LINES PIC S9(09) COMP VALUE 1.             GENERATQ
                                                                        GENERATQ
           02 REPORT1-CTL-LEVEL PIC 9(03) COMP-3 VALUE ZERO.            GENERATQ
              88 R01-BRK-FINAL VALUE 1.                                 GENERATQ
           02 REPORT1-BREAK-LEVL  PIC S9(04) COMP VALUE ZERO.           GENERATQ
              88 R01-HBR-FINAL VALUE 1.                                 GENERATQ
                                                                        GENFILE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS RETURN CODE AND MESSAGE FOR SYSPRINT FILE.  * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  SYSPRINT-IO-COUNT      PIC 9(09) VALUE ZERO COMP.            GENFILE
       01  SYSPRINT-IOSW          PIC X(01) VALUE 'C'.                  GENFILE
           88 SYSPRINT-OPEN       VALUE 'O'.                            GENFILE
           88 SYSPRINT-CLOSED     VALUE 'C'.                            GENFILE
       01  SYSPRINT-ACCEPT-FLAG   PIC X(01) VALUE 'Y'.                  GENFILE
           88 ACCEPT-SYSPRINT-RECORD VALUE 'Y'.                         GENFILE
           88 BYPASS-SYSPRINT-RECORD VALUE 'B'.                         GENFILE
       01  SYSPRINT-MESSAGE.                                            GENFILE
           02 FILLER            PIC X(28)                               GENFILE
                                VALUE 'FILE I/O ERROR, RETURN CODE='.   GENFILE
           02 SYSPRINT-STATUS     PIC X(02) VALUE SPACES.               GENFILE
              88 SYSPRINT-GOOD-OPEN VALUE '00' '97'.                    GENFILE
              88 SYSPRINT-GOOD-IO   VALUE '00' '04'.                    GENFILE
              88 END-OF-SYSPRINT    VALUE '10'.                         GENFILE
           02 FILLER            PIC X(16) VALUE ', FILE=SYSPRINT'.      GENFILE
                                                                        GENFILE
       01  SYSPRINT-RECORD-SIZE-G.                                      GENFILE
           02 SYSPRINT-FILE-FIB.                                        GENFILE
              03 SYSPRINT-OPSYS         PIC X(03) VALUE 'MVS'.          GENFILE
              03 SYSPRINT-RECFM         PIC X(01) VALUE 'F'.            GENFILE
              03 SYSPRINT-DDNAME        PIC X(08) VALUE 'SYSPRINT'.     GENFILE
              03 SYSPRINT-FCB-ADCON     PIC 9(09) COMP VALUE ZERO.      GENFILE
              03 SYSPRINT-RECORD-SIZE   PIC  9(09) COMP VALUE ZERO.     GENFILE
           02 SYSPRINT-RECORD-GSIZ   PIC S9(09) COMP VALUE 132.         GENERATQ
           02 SYSPRINT-RECORD-TAIL   PIC S9(09) COMP VALUE ZERO.        GENERATQ
           02 SYSPRINT-RECORD-KEYE   PIC S9(09) COMP VALUE ZERO.        GENERATQ
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI INTERNALLY GENERATED REPORT1 SAVE AREAS.                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  REPORT1-SAVE-AREAS.                                          GENERATQ
           02 R01-SAV-WCUST-ACCT-ID             PIC X(23)               GENERATQ
                                     VALUE LOW-VALUES.                  GENERATQ
           02 R01-SAV-WCUST-ACC-PRD-CD          PIC X(3)                GENERATQ
                                     VALUE LOW-VALUES.                  GENERATQ
           02 R01-SAV-WCUST-ID                  PIC X(9)                GENERATQ
                                     VALUE LOW-VALUES.                  GENERATQ
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI INTERNALLY GENERATED REPORT1 CTL BREAK BUCKETS          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
                                                                        GENERATQ
       01  REPORT1-LEVEL0-BUCKETS COMP-3.                               GENERATQ
           02 R01-LV0-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT1-LEVEL1-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R01-LV1-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI INTERNALLY GENERATED HD1-F01-LN01 HEADER LAYOUT.        * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  HD1-F01-LN01.                                                GENERATQ
           02 FILLER            PIC X(11) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(08) VALUE 'WCUST-ID'.             GENERATQ
           02 FILLER            PIC X(04) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(19) VALUE 'WCUST-ACCT-PRDCT-CD'.  GENERATQ
           02 FILLER            PIC X(08) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(13) VALUE 'WCUST-ACCT-ID'.        GENERATQ
      *,PENGI - THE COMPUTED LENGTH FOR HD1-F01-LN01 IS 63
                                                                        DATESWP
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * DATESWP - WORK AREAS FOR REFORMATING 6-8 CHAR DATE.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  WS-DATESWP-A1-9             PIC 9(08).                       DATESWP
       01  WS-DATESWP-A1 REDEFINES WS-DATESWP-A1-9.                     DATESWP
           02 FILLER                   PIC 9(02).                       DATESWP
           02 WS-DATESWP-Y1-1          PIC 9(02).                       DATESWP
           02 WS-DATESWP-M1-1          PIC 9(02).                       DATESWP
           02 WS-DATESWP-D1-1          PIC 9(02).                       DATESWP
                                                                        DATESWP
       01  WS-DATESWP-A1-2 REDEFINES WS-DATESWP-A1.                     DATESWP
           02 FILLER                   PIC 9.                           DATESWP
           02 WS-DATESWP-C1-2          PIC 9.                           DATESWP
           02 WS-DATESWP-Y1-2          PIC 9(02).                       DATESWP
           02 WS-DATESWP-M1-2          PIC 9(02).                       DATESWP
           02 WS-DATESWP-D1-2          PIC 9(02).                       DATESWP
                                                                        DATESWP
       01  WS-DATESWP-A1-3 REDEFINES WS-DATESWP-A1-2.                   DATESWP
           02 WS-DATESWP-C1-3          PIC 9(02).                       DATESWP
           02 WS-DATESWP-Y1-3          PIC 9(02).                       DATESWP
           02 WS-DATESWP-M1-3          PIC 9(02).                       DATESWP
           02 WS-DATESWP-D1-3          PIC 9(02).                       DATESWP
                                                                        DATESWP
       01  WS-DATESWP-A2-9             PIC 9(08).                       DATESWP
       01  WS-DATESWP-A2 REDEFINES WS-DATESWP-A2-9.                     DATESWP
           02 FILLER                   PIC 9(02).                       DATESWP
           02 WS-DATESWP-M2-1          PIC 9(02).                       DATESWP
           02 WS-DATESWP-D2-1          PIC 9(02).                       DATESWP
           02 WS-DATESWP-Y2-1          PIC 9(02).                       DATESWP
                                                                        DATESWP
       01  WS-DATESWP-A2E REDEFINES WS-DATESWP-A2-9.                    DATESWP
           02 FILLER                   PIC 9(02).                       DATESWP
           02 WS-DATESWP-D2-1E         PIC 9(02).                       DATESWP
           02 WS-DATESWP-M2-1E         PIC 9(02).                       DATESWP
           02 WS-DATESWP-Y2-1E         PIC 9(02).                       DATESWP
                                                                        DATESWP
       01  WS-DATESWP-A2-2 REDEFINES WS-DATESWP-A2E.                    DATESWP
           02 FILLER                   PIC 9.                           DATESWP
           02 WS-DATESWP-M2-2          PIC 9(02).                       DATESWP
           02 WS-DATESWP-D2-2          PIC 9(02).                       DATESWP
           02 WS-DATESWP-C2-2          PIC 9.                           DATESWP
           02 WS-DATESWP-Y2-2          PIC 9(02).                       DATESWP
                                                                        DATESWP
       01  WS-DATESWP-A2-3 REDEFINES WS-DATESWP-A2-2.                   DATESWP
           02 WS-DATESWP-M2-3          PIC 9(02).                       DATESWP
           02 WS-DATESWP-D2-3          PIC 9(02).                       DATESWP
           02 WS-DATESWP-C2-3          PIC 9(02).                       DATESWP
           02 WS-DATESWP-Y2-3          PIC 9(02).                       DATESWP
                                                                        DATESWP
       01  WS-DATESWP-A2E-3 REDEFINES WS-DATESWP-A2-3.                  DATESWP
           02 WS-DATESWP-D2-3E         PIC 9(02).                       DATESWP
           02 WS-DATESWP-M2-3E         PIC 9(02).                       DATESWP
           02 WS-DATESWP-C2-3E         PIC 9(02).                       DATESWP
           02 WS-DATESWP-Y2-3E         PIC 9(02).                       DATESWP
                                                                        DATESWP
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * TABLE OF FILE NAMES USED IN THE PROGRAM.                      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  WS-PENGI-ESPI-INFO-HEADER.                                   PENGIEND
           02 WS-PENGI-ESPI-ABEND     PIC X(16) VALUE ' '.              PENGIEND
           02 WS-PENGI-ESPI-INFO.                                       PENGIEND
              03 WS-PENGI-ESPI-OPTION PIC X(16) VALUE 'ESPI-FULL-LOWER'.PENGIEND
              03 WS-PENGI-ESPI-FILES.                                   PENGIEND
                 04 WS-PENGI-ESPI-SYSPRINT.                             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'STATIC'.              PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'SYSPRINT'.            PENGIEND
                 04 FILLER   PIC  X(02) VALUE X'FFFF'.                  PENGIEND
                                                                        PENGIEND
       LINKAGE SECTION.                                                 COBOLBAS
                                                                        COBOLBAS
       01 LS-PENGI-PARM.                                                EASYT007
          02 LS-PENGI-PARM-LENT       PIC S9(04) COMP.                  EASYT007
          02 LS-PENGI-PARM-TEXT OCCURS 1 TO 256 TIMES                   EASYT007
                      DEPENDING ON LS-PENGI-PARM-LENT                   EASYT007
                      PIC X(01).                                        EASYT007
                                                                        EASYT007
           EXEC SQL                                                     EASYT007
             DECLARE CUXAD-CURS                                         EASYT007
                     CURSOR FOR                                         EASYT007
             SELECT                                                     EASYT007
                     CUST_ID,                                           EASYT007
                     CUST_ACCT_PRDCT_CD,                                EASYT007
                     CUST_ACCT_ID                                       EASYT007
                  FROM CUST_TB                                          EASYT007
                                                                        EASYT007
           END-EXEC                                                     EASYT007
                                                                        EASYT007
           EJECT                                                        GENERATQ
       PROCEDURE DIVISION USING                                         COBOLBAS
                          LS-PENGI-PARM.                                COBOLBAS
            PERFORM D00000-SET-FSYESPI1-TRAP.                           COBOLBAS
       A00000-PROGRAM-ENTRY.                                            EASYT007
           MOVE 'MSGOFF' TO  WS-PENGI-DEALLOC-REQ                       EASYT007
           CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-DEALLOC            EASYT007
           MOVE 'ALLOC FJSYABE' TO WS-PENGI-SYSOUT-REQ                  EASYT007
           CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             EASYT007
           MOVE 'ALLOC CEEDUMP' TO WS-PENGI-SYSOUT-REQ                  EASYT007
           CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             EASYT007
           ACCEPT WS-PENGI-DATE-LONG-9 FROM DATE YYYYMMDD               EASYT007
           MOVE WS-PENGI-DATE-LONG-9(3:6) TO WS-PENGI-DATE-9            EASYT007
           MOVE ZERO TO RC-DATESWP                                      DATESWP
           MOVE ZEROES          TO WS-DATESWP-A2-9                      DATESWP
           MOVE WS-PENGI-DATE-9 TO WS-DATESWP-A1-9                      DATESWP
           MOVE WS-DATESWP-Y1-1 TO WS-DATESWP-Y2-1                      DATESWP
           MOVE WS-DATESWP-M1-1 TO WS-DATESWP-M2-1                      DATESWP
           MOVE WS-DATESWP-D1-1 TO WS-DATESWP-D2-1                      DATESWP
           MOVE WS-DATESWP-A2-9 TO WS-PENGI-DATE-9                      DATESWP
           MOVE ZERO TO RC-DATESWP                                      DATESWP
           MOVE ZEROES          TO WS-DATESWP-A2-9                      DATESWP
           MOVE WS-PENGI-DATE-LONG-9 TO WS-DATESWP-A1-9                 DATESWP
           MOVE WS-DATESWP-C1-3 TO WS-DATESWP-C2-3                      DATESWP
           MOVE WS-DATESWP-Y1-3 TO WS-DATESWP-Y2-3                      DATESWP
           MOVE WS-DATESWP-M1-3 TO WS-DATESWP-M2-3                      DATESWP
           MOVE WS-DATESWP-D1-3 TO WS-DATESWP-D2-3                      DATESWP
           MOVE WS-DATESWP-A2-9 TO WS-PENGI-DATE-LONG-9                 DATESWP
           MOVE WS-PENGI-DATE-9 TO WS-PENGI-DATE-E                      EASYT007
           MOVE WS-PENGI-DATE-LONG-9 TO WS-PENGI-DATE-LONG-E            EASYT007
           MOVE WS-PENGI-DATE-9      TO WS-PENGI-DATE-P                 EASYT007
           MOVE WS-PENGI-DATE-LONG-9 TO WS-PENGI-DATE-LONG-P            EASYT007
           ACCEPT WS-PENGI-TIME-9 FROM TIME                             EASYT007
           COMPUTE WS-PENGI-TIME-9 = WS-PENGI-TIME-9 / 100              EASYT007
           MOVE WS-PENGI-TIME-9 TO WS-PENGI-TIME-E                      EASYT007
           INSPECT WS-PENGI-TIME-E REPLACING ALL '/' BY '.'.            EASYT007
           MOVE WS-PENGI-TIME-9 TO WS-PENGI-TIME-P                      EASYT007
           INSPECT WS-PENGI-TIME-P REPLACING ALL '/' BY '.'.            EASYT007
                                                                        EASYT007
           SET PARM-REGISTER TO ADDRESS OF LS-PENGI-PARM.               EASYT007
                                                                        EASYT007
      * CONVERSION TABLE OF EASYTRIEVE PLUS FILE-STATUS TO COBOL:       EASYT007
      *                                                                 EASYT007
      *    EASYTREVE  COBOL                                             EASYT007
      *       00       00     GOOD-IO.                                  EASYT007
      *       04       10     END-OF-FILE.                              EASYT007
      *       08       02     DUPLICATE ALT KEY EXISTS.                 EASYT007
      *       12       22     DUPLICATE VSAM KEY (WRITE).               EASYT007
      *       16       23     RECORD NOT FOUND ON VSAM.                 EASYT007
                                                                        EASYT007
      * => THE TABLE IS REALTIVE TO ZERO, THEREFORE SLOTS ARE AT +1.    EASYT007
           MOVE 00 TO PENGI-CODES (1)                                   EASYT007
           MOVE 04 TO PENGI-CODES (11)                                  EASYT007
           MOVE 08 TO PENGI-CODES (03)                                  EASYT007
           MOVE 12 TO PENGI-CODES (23)                                  EASYT007
           MOVE 16 TO PENGI-CODES (24).                                 EASYT007
                                                                        EASYT007
#00003     CALL 'FSYDB250' USING WS-PENGI-DB2-PLAN.                     EASYT007
#00146     MOVE 1 TO REPORT1-LGRP-CNTRL.                                EASYT007
#00146     MOVE 1 TO REPORT1-L1ST-CNTRL.                                EASYT007
#00146     MOVE 'ALLOC SORTWK01' TO WS-PENGI-ALLOC-REQ                  EASYT007
#00146     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC.             EASYT007
#00146     MOVE 'ALLOC SORTWK02' TO WS-PENGI-ALLOC-REQ                  EASYT007
#00146     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC.             EASYT007
#00146     MOVE 'ALLOC SORTWK03' TO WS-PENGI-ALLOC-REQ                  EASYT007
#00146     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC.             EASYT007
                                                                        EASYT007
#00066***************************************************************** EASYT007
#00066* JOB1 INITIATION ROUTINE                                       * EASYT007
#00066***************************************************************** EASYT007
#00066 A01000-JOB1-ENTRY.                                               EASYT007
#00066                                                                  EASYT007
#00066     PERFORM A01120-JOB1-OPEN                                     EASYT007
#00066     PERFORM A01010-JOB1-READ                                     EASYT007
#00066       UNTIL JOB1-REQUEST-STOP.                                   EASYT007
#00066                                                                  EASYT007
#00066     MOVE ZERO TO WS-JOB1-FLAG.                                   EASYT007
#00146     IF WS-JOB1-REPORT1-SW = 'Y'                                  EASYT007
#00146         PERFORM B00090-REPORT1-TERMINATE                         EASYT007
#00146     END-IF.                                                      EASYT007
#00146                                                                  EASYT007
#00146     MOVE 'JOB1'  TO WS-PENGI-EZ-JID                              EASYT007
#00146     MOVE '1' TO WS-PENGI-EZ-JOB                                  EASYT007
#00146     DISPLAY ' '                                                  EASYT007
#00146     DISPLAY WS-PENGI-EZ-STAT1                                    EASYT007
#00146     DISPLAY ' '                                                  EASYT007
#00146     DISPLAY WS-PENGI-EZ-STAT2                                    EASYT007
#00146     MOVE 'PRINTER' TO WS-PENGI-EZ-ORG                            EASYT007
#00146     MOVE 'OUTPUT'  TO WS-PENGI-EZ-IOTYPE                         EASYT007
      *,FILE DCB INFO. IS FROM THE DEFAULT VALUES.
#00146     MOVE 'SYSPRINT'  TO WS-PENGI-EZ-DDNAME                       EASYT007
#00146     MOVE SYSPRINT-IO-COUNT TO WS-PENGI-EZ-IO-COUNT               EASYT007
#00146     MOVE 'FBA' TO WS-PENGI-EZ-RECFM                              EASYT007
#00146     COMPUTE WS-PENGI-EZ-LRECL = (132 + 1)                        EASYT007
#00146     MOVE 0 TO WS-PENGI-EZ-BLKSIZE                                EASYT007
#00146     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#00146     MOVE SPACES TO WS-PENGI-EZ-IOMOD                             EASYT007
#00146     CLOSE SYSPRINT                                               EASYT007
#00146                                                                  EASYT007
#00146     MOVE ZERO TO SYSPRINT-IO-COUNT                               EASYT007
#00146     MOVE  'C' TO SYSPRINT-IOSW.                                  EASYT007
#00146                                                                  EASYT007
#00146     MOVE WS-PENGI-RETURN TO RETURN-CODE. GOBACK.                 EASYT007
#00146                                                                  EASYT007
#00066***************************************************************** EASYT007
#00066* JOB1 FILE READ ROUTINE                                        * EASYT007
#00066***************************************************************** EASYT007
#00066 A01010-JOB1-READ.                                                EASYT007
      *,EXIT IF STOP/STOP EXECUTE TO PREVENT AN EXTRA READ
#00066     IF (NOT JOB1-REQUEST-STOP)                                   EASYT007
#00066         PERFORM A01020-JOB1-READ-NEXT                            EASYT007
#00066     END-IF.                                                      EASYT007
#00066                                                                  EASYT007
#00066***************************************************************** EASYT007
#00066* JOB1 FILE READ-NEXT ROUTINE                                   * EASYT007
#00066***************************************************************** EASYT007
#00066 A01020-JOB1-READ-NEXT.                                           EASYT007
#00066     IF NOT JOB1-REQUEST-STOP                                     EASYT007
#00066         GO TO A01030-JOB1-RUN.                                   EASYT007
#00066                                                                  EASYT007
#00066***************************************************************** EASYT007
#00066* JOB1 MAIN PROCESSING ROUTINE                                  * EASYT007
#00066***************************************************************** EASYT007
#00066 A01030-JOB1-RUN.                                                 EASYT007
#00067     PERFORM A01040-OPEN-CUXAD-CURS                               EASYT007
#00067        THRU A01050-OPEN-CUXAD-CURS-EXIT                          EASYT007
#00069     PERFORM TEST AFTER UNTIL (WCUST-DISP-CTR = 100 )             EASYT007
#00069        PERFORM A01100-DOWHL-1-PROC2-1                            EASYT007
#00069            THRU A01110-DOWHL-1-PROC2-1-EXIT                      EASYT007
#00075     END-PERFORM                                                  EASYT007
#00075                                                                  EASYT007
#00077     PERFORM A01080-CLOSE-CUXAD-CURS                              EASYT007
#00077        THRU A01090-CLOSE-CUXAD-CURS-EXIT                         EASYT007
#00078     SET JOB1-STOP-JOB TO TRUE                                    EASYT007
#00078     GO TO A01010-JOB1-READ.                                      EASYT007
#00078                                                                  EASYT007
#00083*-*************************************************************** EASYT007
#00083* JOB1 PROC NAME: OPEN-CUXAD-CURS                               * EASYT007
#00083***************************************************************** EASYT007
#00083 A01040-OPEN-CUXAD-CURS.                                          EASYT007
#00084                                                                  EASYT007
#00084     EXEC SQL                                                     EASYT007
#00084       OPEN CUXAD-CURS                                            EASYT007
#00084     END-EXEC.                                                    EASYT007
#00084                                                                  EASYT007
#00086     EVALUATE SQLCODE                                             EASYT007
#00087        WHEN 0                                                    EASYT007
#00088           MOVE SQLCODE TO DLN-0001-SQLCODE                       EASYT007
#00088           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00088           WRITE SYSPRINT-RECORD  FROM DLN-0001                   EASYT007
#00088                   AFTER ADVANCING 1                              EASYT007
#00088           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00088           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00089           CONTINUE                                               EASYT007
#00089        WHEN OTHER                                                EASYT007
#00090           MOVE SQLCODE TO DLN-0002-SQLCODE                       EASYT007
#00090           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00090           WRITE SYSPRINT-RECORD  FROM DLN-0002                   EASYT007
#00090                   AFTER ADVANCING 1                              EASYT007
#00090           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00090           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00091           MOVE 100  TO WCUST-DISP-CTR                            EASYT007
#00092           CONTINUE                                               EASYT007
#00092     END-EVALUATE.                                                EASYT007
#00092                                                                  EASYT007
#00093 A01050-OPEN-CUXAD-CURS-EXIT. EXIT.                               EASYT007
#00098                                                                  EASYT007
#00098*-*************************************************************** EASYT007
#00098* JOB1 PROC NAME: FETCH-NEXT-ADDR                               * EASYT007
#00098***************************************************************** EASYT007
#00098 A01060-FETCH-NEXT-ADDR.                                          EASYT007
#00100                                                                  EASYT007
#00100     EXEC SQL                                                     EASYT007
#00100       FETCH                                                      EASYT007
#00101               CUXAD-CURS                                         EASYT007
#00102       INTO                                                       EASYT007
#00103               :WCUST-ID,                                         EASYT007
#00104               :WCUST-ACC-PRD-CD,                                 EASYT007
#00105               :WCUST-ACCT-ID :WCUST-ACC-ID-NUL                   EASYT007
#00105     END-EXEC                                                     EASYT007
#00107     EVALUATE SQLCODE                                             EASYT007
#00108        WHEN 0                                                    EASYT007
#00109           MOVE WCUST-ACCT-ID TO DLN-0003-WCUST-ACCT-ID           EASYT007
#00109           MOVE WCUST-ACC-PRD-CD TO DLN-0003-WCUST-ACC-PRD-CD     EASYT007
#00109           MOVE WCUST-ID TO DLN-0003-WCUST-ID                     EASYT007
#00109           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00109           WRITE SYSPRINT-RECORD  FROM DLN-0003                   EASYT007
#00109                   AFTER ADVANCING 1                              EASYT007
#00109           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00109           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00112        WHEN 100                                                  EASYT007
#00113           PERFORM A01080-CLOSE-CUXAD-CURS                        EASYT007
#00113              THRU A01090-CLOSE-CUXAD-CURS-EXIT                   EASYT007
#00114           MOVE 100  TO WCUST-DISP-CTR                            EASYT007
#00115           CONTINUE                                               EASYT007
#00115        WHEN OTHER                                                EASYT007
#00116           MOVE SQLCODE TO DLN-0004-SQLCODE                       EASYT007
#00116           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00116           WRITE SYSPRINT-RECORD  FROM DLN-0004                   EASYT007
#00116                   AFTER ADVANCING 1                              EASYT007
#00116           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00116           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00117           MOVE 100  TO WCUST-DISP-CTR                            EASYT007
#00118           CONTINUE                                               EASYT007
#00118     END-EVALUATE.                                                EASYT007
#00118                                                                  EASYT007
#00119 A01070-FETCH-NEXT-ADDR-EXIT. EXIT.                               EASYT007
#00124                                                                  EASYT007
#00124*-*************************************************************** EASYT007
#00124* JOB1 PROC NAME: CLOSE-CUXAD-CURS                              * EASYT007
#00124***************************************************************** EASYT007
#00124 A01080-CLOSE-CUXAD-CURS.                                         EASYT007
#00126                                                                  EASYT007
#00126     EXEC SQL                                                     EASYT007
#00126       CLOSE CUXAD-CURS                                           EASYT007
#00126     END-EXEC                                                     EASYT007
#00128     EVALUATE SQLCODE                                             EASYT007
#00129        WHEN 0                                                    EASYT007
#00130           MOVE SQLCODE TO DLN-0005-SQLCODE                       EASYT007
#00130           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00130           WRITE SYSPRINT-RECORD  FROM DLN-0005                   EASYT007
#00130                   AFTER ADVANCING 1                              EASYT007
#00130           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00130           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00131           CONTINUE                                               EASYT007
#00131        WHEN OTHER                                                EASYT007
#00132           MOVE SQLCODE TO DLN-0006-SQLCODE                       EASYT007
#00132           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00132           WRITE SYSPRINT-RECORD  FROM DLN-0006                   EASYT007
#00132                   AFTER ADVANCING 1                              EASYT007
#00132           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00132           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00133           MOVE 100  TO WCUST-DISP-CTR                            EASYT007
#00134           CONTINUE                                               EASYT007
#00134     END-EVALUATE.                                                EASYT007
#00134                                                                  EASYT007
#00136 A01090-CLOSE-CUXAD-CURS-EXIT. EXIT.                              EASYT007
#00069                                                                  EASYT007
#00069*--************************************************************** EASYT007
#00069* JOB1 PROC NAME: DOWHL-1-PROC2-1                               * EASYT007
#00069***************************************************************** EASYT007
#00069 A01100-DOWHL-1-PROC2-1.                                          EASYT007
#00070     COMPUTE WCUST-DISP-CTR =                                     EASYT007
#00070         WCUST-DISP-CTR + 1                                       EASYT007
#00071     PERFORM A01060-FETCH-NEXT-ADDR                               EASYT007
#00071        THRU A01070-FETCH-NEXT-ADDR-EXIT                          EASYT007
#00072     IF SQLCODE = ZEROS                                           EASYT007
#00073        PERFORM A01130-GENERATE-REPORT1                           EASYT007
#00073           THRU A01140-GENERATE-REPORT1-EXIT                      EASYT007
#00074     END-IF.                                                      EASYT007
#00074                                                                  EASYT007
#00075 A01110-DOWHL-1-PROC2-1-EXIT.                                     EASYT007
#00075     EXIT.                                                        EASYT007
#00075                                                                  EASYT007
#00066***************************************************************** EASYT007
#00066* JOB1 FILE OPEN ROUTINE                                        * EASYT007
#00066***************************************************************** EASYT007
#00066 A01120-JOB1-OPEN.                                                EASYT007
#00066     SET JOB1-PENDING TO TRUE.                                    EASYT007
#00141     MOVE 'X' TO SYSPRINT-IOSW                                    EASYT007
#00141     PERFORM B00080-REPORT1-OPEN                                  EASYT007
#00141     MOVE 'C' TO SYSPRINT-IOSW.                                   EASYT007
#00141                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * REPORT1 - INTERFACE ROUTINE AND GENERATE MACRO PARAMETERS     * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141 A01130-GENERATE-REPORT1.                                         EASYT007
#00141     MOVE 'Y' TO WS-JOB1-REPORT1-SW.                              EASYT007
#00141                                                                  GENFILE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI REPORT1 MAIN LINE INTERFACE ROUTINES.                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141     PERFORM B00000-REPORT1-MAINLINE                              GENERATQ
#00141        THRU B00010-REPORT1-MAINLINE-EXIT.                        GENERATQ
#00146                                                                  EASYT007
#00146 A01140-GENERATE-REPORT1-EXIT. EXIT.                              EASYT007
#00141                                                                  GENERATQ
#00141     EJECT                                                        GENERATQ
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 MAIN LINE.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
#00141 B00000-REPORT1-MAINLINE.                                         GENERATQ
#00141     MOVE 'N' TO REPORT1-FINL-CNTRL                               GENERATQ
#00141     MOVE ZERO TO REPORT1-CTL-LEVEL.                              GENERATQ
#00141     IF SYSPRINT-IOSW = 'C'                                       GENERATQ
#00141         PERFORM B00080-REPORT1-OPEN                              GENERATQ
#00141         PERFORM B00020-REPORT1-SAVE                              GENERATQ
#00141     ELSE                                                         GENERATQ
#00141     IF REPORT1-COUNT = 0                                         GENERATQ
#00141         PERFORM B00020-REPORT1-SAVE.                             GENERATQ
#00141                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 DETAIL LOGIC.          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141     PERFORM B00040-REPORT1-DTL-FORMULAS.                         GENERATQ
#00141     MOVE WCUST-ACCT-ID TO R01-SAV-WCUST-ACCT-ID.                 GENERATQ
#00141     MOVE WCUST-ACC-PRD-CD TO R01-SAV-WCUST-ACC-PRD-CD.           GENERATQ
#00141     MOVE WCUST-ID TO R01-SAV-WCUST-ID.                           GENERATQ
#00141                                                                  GENERATQ
#00141     MOVE WCUST-ACCT-ID TO F01-LN01-WCUST-ACCT-ID                 GENERATQ
#00141     MOVE WCUST-ACC-PRD-CD TO F01-LN01-WCUST-ACC-PRD-CD           GENERATQ
#00141     MOVE WCUST-ID TO F01-LN01-WCUST-ID                           GENERATQ
#00141     MOVE ZERO TO REPORT1-LSEQ-CNTRL                              GENERATQ
#00141     MOVE 1 TO REPORT1-ADV-CNTRL                                  GENERATQ
#00141     ADD 1 TO REPORT1-LSEQ-CNTRL                                  GENERATQ
#00141     PERFORM B00150-REPORT1-TEST-LMAX1                            GENERATQ
#00141                                                                  GENERATQ
#00141     MOVE ZERO TO REPORT1-PSKP-CNTRL                              GENERATQ
#00141     MOVE F01-LN01 TO REPORT1-PENGI-RECORD                        GENERATQ
#00141     PERFORM B00100-REPORT1-DO-IO0                                GENERATQ
#00141                                                                  GENERATQ
#00141     MOVE 'Y' TO REPORT1-FOOTSW                                   GENERATQ
#00141     MOVE 'N' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00141 B00010-REPORT1-MAINLINE-EXIT. EXIT.                              GENERATQ
#00141                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR SAVING REPORT1 FIELDS.         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141 B00020-REPORT1-SAVE.                                             GENERATQ
#00141     MOVE 'FINAL TOTAL' TO PENGI-CTLID.                           GENERATQ
#00141                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR FINAL CONTROL BREAK.                                      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141 B00030-REPORT1-LV1-FORMULAS.                                     GENERATQ
#00141     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00141     MOVE 'FINAL TOTAL' TO PENGI-CTLID                            GENERATQ
#00141     MOVE ALL '*'  TO PENGI-CTL.                                  GENERATQ
#00141                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR REPORT1 DETAIL FORMULAS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141 B00040-REPORT1-DTL-FORMULAS.                                     GENERATQ
#00141     ADD 1 TO REPORT1-COUNT.                                      GENERATQ
#00141     ADD PENGI-COUNT TO R01-LV1-PENGI-COUNT.                      GENERATQ
#00141     MOVE ZERO TO REPORT1-CTL-LEVEL.                              GENERATQ
#00141                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT1               * GENCTEXT
      * FINAL CONTROL BREAK AMENITIES.                                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141 B00050-REPORT1-LV1-BREAK.                                        GENERATQ
#00141     PERFORM B00030-REPORT1-LV1-FORMULAS.                         GENERATQ
#00141     MOVE ZERO TO REPORT1-LSEQ-CNTRL                              GENERATQ
#00141     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00141     PERFORM B00060-REPORT1-CLEAR-LV1.                            GENERATQ
#00141                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT1 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141 B00060-REPORT1-CLEAR-LV1.                                        GENERATQ
#00141     INITIALIZE REPORT1-LEVEL1-BUCKETS.                           GENERATQ
#00141                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR PRINTING REPORT1 HEADERS.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141 B00070-REPORT1-HDR.                                              GENERATQ
#00141     ACCEPT PENGI-DATE-2 FROM DATE.                               GENERATQ
#00141     ACCEPT PENGI-TIME-2 FROM TIME.                               GENERATQ
#00141     MOVE 'Y' TO REPORT1-FOOTSW.                                  GENERATQ
#00141     MOVE 0 TO REPORT1-LINE0                                      GENERATQ
#00141                                                                  GENERATQ
#00141     IF REPORT1-PAGE-RENUM                                        GENERATQ
#00141        MOVE ZEROS TO REPORT1-PAGE0                               GENERATQ
#00141        MOVE SPACE TO REPORT1-PAGE-RENUM-SW                       GENERATQ
#00141     END-IF                                                       GENERATQ
#00141     ADD  1 TO REPORT1-PAGE0                                      GENERATQ
#00141     MOVE REPORT1-PAGE0 TO PENGI-PAGE.                            GENERATQ
#00141     MOVE 'PAGE' TO F01-HD01(69:5)                                COBSTAT
#00141     MOVE WS-PENGI-DATE-P TO F01-HD01(1:8)                        COBSTAT
#00141     MOVE REPORT1-PAGE0 TO WS-PENGI-PAGE                          COBSTAT
#00141     MOVE WS-PENGI-PAGE TO F01-HD01(74:7)                         COBSTAT
#00141     ADD 1 TO REPORT1-LINE0                                       GENERATQ
#00141     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#00141     WRITE SYSPRINT-RECORD                                        PRINTSRV
#00141            FROM F01-HD01 AFTER ADVANCING CH1.                    PRINTSRV
#00141     ADD 3 TO REPORT1-LINE0                                       GENERATQ
#00141     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#00141     WRITE SYSPRINT-RECORD                                        PRINTSRV
#00141            FROM F01-HD02 AFTER ADVANCING 3.                      PRINTSRV
#00141     ADD 1 TO REPORT1-LINE0                                       GENERATQ
#00141     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#00141     WRITE SYSPRINT-RECORD                                        PRINTSRV
#00141            FROM HD1-F01-LN01 AFTER ADVANCING 1.                  PRINTSRV
#00141     MOVE 'H' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00141     MOVE REPORT1-LINE0 TO REPORT1-HSKP-CNTRL                     GENERATQ
#00141     PERFORM B00170-REPORT1-ADJUST-PAGE                           GENERATQ
#00141     MOVE REPORT1-LINE0 TO REPORT1-RSKP-CNTRL                     GENERATQ
#00141     MOVE REPORT1-L1ST-CNTRL TO REPORT1-LNXT-CNTRL.               GENERATQ
#00141                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED REPORT1 OPEN ROUTINE.                         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141 B00080-REPORT1-OPEN.                                             GENERATQ
#00141     MOVE 'H' TO REPORT1-PENGI-FIRST-SW                           GENERATQ
#00141     COMPUTE SYSPRINT-RECORD-SIZE =                               GENERATQ
#00141               (SYSPRINT-RECORD-GSIZ)                             GENERATQ
#00141     IF SYSPRINT-IOSW = 'X'                                       GENERATQ
#00141     MOVE 'ALLOC SYSPRINT' TO WS-PENGI-SYSOUT-REQ                 GENERATQ
#00141     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             GENERATQ
#00141     OPEN OUTPUT SYSPRINT.                                        PRINTSRV
#00141     MOVE 'O' TO SYSPRINT-IOSW                                    GENERATQ
#00141     IF NOT SYSPRINT-GOOD-IO                                      GENERATQ
#00141         DISPLAY SYSPRINT-MESSAGE                                 GENERATQ
#00141         MOVE 3001 TO WS-PENGI-RETURN                             ABRCODE
#00141         MOVE SYSPRINT-MESSAGE TO ABEND-MESSAGE                   GENERATQ
#00141         PERFORM C00000-ABEND-CALL-FSABEC16.                      ABEND00
#00141                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED REPORT1 TERMINATION ROUTINES.                 * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141 B00090-REPORT1-TERMINATE.                                        GENERATQ
#00141     IF SYSPRINT-IOSW NOT = 'O'                                   GENERATQ
#00141         PERFORM B00080-REPORT1-OPEN.                             GENERATQ
#00141     MOVE 1 TO REPORT1-BREAK-LEVL                                 GENERATQ
#00141     MOVE 'Y' TO REPORT1-FINL-CNTRL                               GENERATQ
#00141     MOVE REPORT1-BREAK-LEVL TO REPORT1-PFOOT-LEVL                GENERATQ
#00141                                                                  GENERATQ
#00141     PERFORM B00050-REPORT1-LV1-BREAK                             GENERATQ
#00141     MOVE ZERO TO REPORT1-CTL-LEVEL                               GENERATQ
#00141     IF REPORT1-LNXT-CNTRL NOT = ZERO                             GENERATQ
#00141        MOVE SPACES TO REPORT1-PENGI-RECORD                       GENERATQ
#00141        PERFORM B00110-REPORT1-DO-IO1-A                           GENERATQ
#00141        PERFORM B00120-REPORT1-DO-IO2-A                           GENERATQ
#00141        MOVE ZERO TO REPORT1-ADV-CNTRL                            GENERATQ
#00141        MOVE ZERO TO REPORT1-LNXT-CNTRL                           GENERATQ
#00141     END-IF                                                       GENERATQ
#00141     MOVE 0 TO REPORT1-COUNT, REPORT1-PAGE0.                      GENERATQ
#00141     MOVE SPACE TO REPORT1-PAGE-RENUM-SW.                         GENERATQ
#00141     MOVE REPORT1-LMAX0 TO REPORT1-LINE0.                         GENERATQ
#00141     IF SYSPRINT-IO-COUNT < ZERO                                  GENERATQ
#00141        PERFORM B00130-REPORT1-DO-IO-CH1                          GENERATQ
#00141     END-IF.                                                      GENERATQ
#00141                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI COMMON I/O LOGIC FOR HANDLING REPORT1                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141 B00100-REPORT1-DO-IO0.                                           GENERATQ
#00141     IF REPORT1-PENGI-RECORD = SPACES                             GENERATQ
#00141        ADD REPORT1-ADV-CNTRL TO REPORT1-LNXT-CNTRL               GENERATQ
#00141        MOVE ZERO TO REPORT1-ADV-CNTRL                            GENERATQ
#00141     ELSE                                                         GENERATQ
#00141        ADD REPORT1-ADV-CNTRL TO REPORT1-LNXT-CNTRL               GENERATQ
#00141        PERFORM B00110-REPORT1-DO-IO1-A                           GENERATQ
#00141        PERFORM B00120-REPORT1-DO-IO2-A                           GENERATQ
#00141        MOVE ZERO TO REPORT1-LNXT-CNTRL                           GENERATQ
#00141        MOVE ZERO TO REPORT1-ADV-CNTRL                            GENERATQ
#00141     END-IF.                                                      GENERATQ
#00141                                                                  GENERATQ
#00141* THIS ROUTINE ADVANCES PRINTING TO MAKE SURE THAT THERE IS NO    GENERATQ
#00141* MORE THAN 3 OUTSTANDING BLANK LINES TO PRINT.                   GENERATQ
#00141*                                                                 GENERATQ
#00141* INPUT : REPORT1-NXT-CNTRL FOR NUMBER OF LINES TO ADVANCE.       GENERATQ
#00141* OUTPUT: REPORT1-ADV-CNTRL FOR THE REMAINING # OF LINES.         GENERATQ
#00141                                                                  GENERATQ
#00141 B00110-REPORT1-DO-IO1-A.                                         GENERATQ
#00141     PERFORM TEST BEFORE UNTIL REPORT1-LNXT-CNTRL <= 3            GENERATQ
#00141        SUBTRACT 3 FROM REPORT1-LNXT-CNTRL                        GENERATQ
#00141        MOVE SPACES TO SYSPRINT-RECORD                            GENERATQ
#00141        ADD 1 TO SYSPRINT-IO-COUNT                                GENERATQ
#00141        WRITE SYSPRINT-RECORD                                     PRINTSRV
#00141               AFTER ADVANCING 3                                  PRINTSRV
#00141        PERFORM B00160-REPORT1-TEST-IO-ERR                        GENERATQ
#00141        ADD 3 TO REPORT1-LINE0                                    GENERATQ
#00141        ADD 3 TO REPORT1-RSKP-CNTRL                               GENERATQ
#00141     END-PERFORM.                                                 GENERATQ
#00141     MOVE REPORT1-LNXT-CNTRL TO REPORT1-ADV-CNTRL.                GENERATQ
#00141* I/O ROUTINE FOR PRINTING FROM THE REPORT WORK AREA.             GENERATQ
#00141* INPUT : REPORT1-ADV-CNTRL FOR #OF LINES TO ADVANCE              GENERATQ
#00141*         REPORT1-PENGI-RECORD CONTAINS DATA TO PRINT             GENERATQ
#00141                                                                  GENERATQ
#00141 B00120-REPORT1-DO-IO2-A.                                         GENERATQ
#00141     ADD REPORT1-ADV-CNTRL TO REPORT1-LINE0                       GENERATQ
#00141     ADD REPORT1-ADV-CNTRL TO REPORT1-RSKP-CNTRL                  GENERATQ
#00141     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#00141     WRITE SYSPRINT-RECORD                                        PRINTSRV
#00141            FROM REPORT1-PENGI-RECORD AFTER ADVANCING             PRINTSRV
                  REPORT1-ADV-CNTRL.                                    PRINTSRV
#00141     PERFORM B00160-REPORT1-TEST-IO-ERR.                          GENERATQ
#00141                                                                  GENERATQ
#00141* I/O ROUTINE FOR PRINTING TO CH1.                                GENERATQ
#00141* INPUT : REPORT1-ADV-CNTRL FOR #OF LINES TO COUNT                GENERATQ
#00141*         SYSPRINT-RECORD CONTAINS DATA TO PRINT.                 GENERATQ
#00141                                                                  GENERATQ
#00141 B00130-REPORT1-DO-IO-CH1.                                        GENERATQ
#00141     ADD REPORT1-ADV-CNTRL TO REPORT1-LINE0                       GENERATQ
#00141     ADD REPORT1-ADV-CNTRL TO REPORT1-RSKP-CNTRL                  GENERATQ
#00141     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#00141     WRITE SYSPRINT-RECORD                                        PRINTSRV
#00141            AFTER ADVANCING CH1                                   PRINTSRV
#00141                                                                  GENERATQ
#00141     PERFORM B00160-REPORT1-TEST-IO-ERR.                          GENERATQ
#00141                                                                  GENERATQ
#00141* MAIN OVERFLOW ROUTINE FOR DETAIL AND TOTAL PRINTING.            GENERATQ
#00141* INPUT : REPORT1-LNXT-CNTRL CONTAINS #OF OUTSTANDING LINES.      GENERATQ
#00141*         REPORT1-ADV-CNTRL #OF LINES TO ADVANCE FOR THIS I/O.    GENERATQ
#00141                                                                  GENERATQ
#00141 B00150-REPORT1-TEST-LMAX1.                                       GENERATQ
#00141     IF REPORT1-LSEQ-CNTRL < 2                                    GENERATQ
#00141        COMPUTE REPORT1-WSKP-CNTRL = REPORT1-LINE0 +              GENERATQ
#00141                REPORT1-ADV-CNTRL + REPORT1-LNXT-CNTRL            GENERATQ
#00141        IF REPORT1-WSKP-CNTRL > REPORT1-LMAX1                     GENERATQ
#00141           ADD REPORT1-ADV-CNTRL TO REPORT1-LNXT-CNTRL            GENERATQ
#00141           MOVE ZERO TO REPORT1-ADV-CNTRL                         GENERATQ
#00141           PERFORM B00070-REPORT1-HDR                             GENERATQ
#00141           MOVE 1 TO REPORT1-ADV-CNTRL                            GENERATQ
#00141           MOVE ZERO TO REPORT1-LNXT-CNTRL                        GENERATQ
#00141           ADD REPORT1-HOFF-CNTRL TO REPORT1-ADV-CNTRL            GENERATQ
#00141        END-IF                                                    GENERATQ
#00141     ELSE                                                         GENERATQ
#00141        COMPUTE REPORT1-WSKP-CNTRL = REPORT1-LINE0 +              GENERATQ
#00141                REPORT1-ADV-CNTRL + REPORT1-LNXT-CNTRL            GENERATQ
#00141        IF REPORT1-WSKP-CNTRL > REPORT1-LMAX1                     GENERATQ
#00141           COMPUTE REPORT1-ADV-CNTRL =                            GENERATQ
#00141                   REPORT1-WSKP-CNTRL - REPORT1-LMAX1             GENERATQ
#00141           MOVE ZERO TO REPORT1-LNXT-CNTRL                        GENERATQ
#00141           IF REPORT1-LINE0 > REPORT1-LMAX1                       GENERATQ
#00141              MOVE 1 TO REPORT1-ADV-CNTRL                         GENERATQ
#00141           END-IF                                                 GENERATQ
#00141           PERFORM B00070-REPORT1-HDR                             GENERATQ
#00141           ADD REPORT1-LNXT-CNTRL TO REPORT1-ADV-CNTRL            GENERATQ
#00141           MOVE ZERO TO REPORT1-LNXT-CNTRL                        GENERATQ
#00141        END-IF                                                    GENERATQ
#00141     END-IF.                                                      GENERATQ
#00141                                                                  GENERATQ
#00141* PRINTER I/O ERROR HANDLING ROUTINE.                             GENERATQ
#00141                                                                  GENERATQ
#00141 B00160-REPORT1-TEST-IO-ERR.                                      GENERATQ
#00141     IF NOT SYSPRINT-GOOD-IO                                      GENERATQ
#00141         DISPLAY SYSPRINT-MESSAGE                                 GENERATQ
#00141         MOVE 3002 TO WS-PENGI-RETURN                             ABRCODE
#00141         MOVE SYSPRINT-MESSAGE TO ABEND-MESSAGE                   GENERATQ
#00141         PERFORM C00000-ABEND-CALL-FSABEC16.                      ABEND00
#00141                                                                  GENERATQ
#00141* COMPUTE MAXIMUM PAGE LINES THAT CAN FIT IN THE PAGESIZE AREA    GENERATQ
#00141* ROUTINE IS INVOKED FROM THE REPORT HEADER PROCESSING ROUTINE.   GENERATQ
#00141                                                                  GENERATQ
#00141 B00170-REPORT1-ADJUST-PAGE.                                      GENERATQ
#00141     COMPUTE REPORT1-LMAX0 = REPORT1-LMAX1                        GENERATQ
#00141     COMPUTE REPORT1-LMAX2 = REPORT1-LMAX1 - 1                    GENERATQ
#00141     COMPUTE REPORT1-LMAX3 = REPORT1-LMAX1 - 2.                   GENERATQ
#00141                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      *           ++ END OF GENERATED CODE FOR REPORT1 ++             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141                                                                  ABEND00
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * FSABEC16: PROGRAM ABNORMALLY TERMINATES PROCESSING            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141 C00000-ABEND-CALL-FSABEC16.                                      ABEND00
#00141     MOVE WS-PENGI-RETURN TO ABEND-REQUEST                        ABEND00
#00141     MOVE 'ALLOC FJSYABE' TO WS-PENGI-SYSOUT-REQ                  ABEND00
#00141     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             ABEND00
#00141     CALL 'FSABEC16' USING PROGRAM-INFO-TABLE.                    ABEND00
#00141* THIS IF BELOW PREVENTS COBOL COMPILER WARNING MESSAGES          ABEND00
#00141     IF (RETURN-CODE > 0 OR RETURN-CODE < 0 OR RETURN-CODE = 0)   ABEND00
#00141        GOBACK                                                    ABEND00
#00141     END-IF.                                                      ABEND00
#00141                                                                  PENGIEND
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * ESTABLISH ESPIE TRAP VIA CALL TO FSYESPI1 PROGRAM.            * GENCTEXT
      * NOTE: !!!! THIS CALL MUST REMAIN AS A STATIC CALL.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00141 D00000-SET-FSYESPI1-TRAP.                                        PENGIEND
#00141     MOVE 'ALLOC FJSYABE' TO WS-PENGI-SYSOUT-REQ                  PENGIEND
#00141     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             PENGIEND
#00141     CALL 'FSYESPI1' USING                                        PENGIEND
#00141           PROGRAM-INFO-TABLE WS-PENGI-ESPI-INFO.                 PENGIEND
#00141                                                                  PENGIEND

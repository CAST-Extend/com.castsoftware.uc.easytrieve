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
      *                                                               * COBOLBAS
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
       DATA DIVISION.                                                   COBOLBAS
       FILE SECTION.                                                    COBOLBAS
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
           02 WS-PENGI-SQL-PARMS.                                       DEFINE
              03 WS-PENGI-DB2-PLAN      PIC X(08) VALUE '?'.            DEFINE
              03 FILLER                 PIC X(01) VALUE ':'.            DEFINE
              03 WS-PENGI-DB2-SSID      PIC X(04) VALUE 'DB2B'.         DEFINE
              03 FILLER                 PIC X(01) VALUE ':'.            DEFINE
              03 WS-PENGI-DB2-SQLID     PIC X(08) VALUE 'TESTDB2'.      DEFINE
              03 FILLER                 PIC X(01) VALUE ':'.            DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR WORK-AREA1 IS 601
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
      *,PENGI - THE COMPUTED LENGTH FOR WORK-GAREA0 IS 40
                                                                        EASYT007
           EXEC SQL                                                     EASYT007
                INCLUDE SQLCA                                           EASYT007
           END-EXEC.                                                    EASYT007
                                                                        DCLINCL
           EXEC SQL                                                     DCLINCL
                INCLUDE DCLACCTB                                        DCLINCL
           END-EXEC.                                                    DCLINCL
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * JOB1_GCURS OPEN/CLOSE INDICATORS AND COUNTERS.                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  JOB1-GCURS-FLAGS.                                            EASYT007
           02 JOB1-GCURS-IOSW        PIC X(01) VALUE 'C'.               EASYT007
              88 JOB1-GCURS-OPEN      VALUE 'O'.                        EASYT007
              88 JOB1-GCURS-CLOSED    VALUE 'C'.                        EASYT007
           02 JOB1-GCURS-STATUS      PIC X(02) VALUE SPACES.            EASYT007
              88 JOB1-GCURS-GOOD-IO   VALUE '00'.                       EASYT007
              88 END-OF-JOB1-GCURS    VALUE '10'.                       EASYT007
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
                DECLARE JOB1_GCURS CURSOR FOR                           EASYT007
                SELECT CUST_ID,                                         EASYT007
                       CUST_ACCT_PRDCT_CD,                              EASYT007
                       CUST_ACCT_ID                                     EASYT007
                  FROM CUST_TB                                          EASYT007
           END-EXEC.                                                    EASYT007
                                                                        EASYT007
       PROCEDURE DIVISION USING                                         COBOLBAS
                          LS-PENGI-PARM.                                COBOLBAS
            PERFORM C00000-SET-FSYESPI1-TRAP.                           COBOLBAS
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
#00070     MOVE 'ALLOC SORTWK01' TO WS-PENGI-ALLOC-REQ                  EASYT007
#00070     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC.             EASYT007
#00070     MOVE 'ALLOC SORTWK02' TO WS-PENGI-ALLOC-REQ                  EASYT007
#00070     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC.             EASYT007
#00070     MOVE 'ALLOC SORTWK03' TO WS-PENGI-ALLOC-REQ                  EASYT007
#00070     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC.             EASYT007
                                                                        EASYT007
#00056***************************************************************** EASYT007
#00056* JOB1 INITIATION ROUTINE                                       * EASYT007
#00056***************************************************************** EASYT007
#00056 A01000-JOB1-ENTRY.                                               EASYT007
#00056                                                                  EASYT007
#00056     PERFORM A01050-JOB1-OPEN                                     EASYT007
#00056     PERFORM A01010-JOB1-READ                                     EASYT007
#00056       UNTIL JOB1-REQUEST-STOP.                                   EASYT007
#00056                                                                  EASYT007
#00056     MOVE ZERO TO WS-JOB1-FLAG.                                   EASYT007
#00070     MOVE WS-PENGI-RETURN TO RETURN-CODE. GOBACK.                 EASYT007
#00070                                                                  EASYT007
#00056***************************************************************** EASYT007
#00056* JOB1 FILE READ ROUTINE                                        * EASYT007
#00056***************************************************************** EASYT007
#00056 A01010-JOB1-READ.                                                EASYT007
      *,EXIT IF STOP/STOP EXECUTE TO PREVENT AN EXTRA READ
#00056     IF (NOT JOB1-REQUEST-STOP)                                   EASYT007
#00056         PERFORM A01020-JOB1-READ-NEXT                            EASYT007
#00056     END-IF.                                                      EASYT007
#00056                                                                  EASYT007
#00056***************************************************************** EASYT007
#00056* JOB1 FILE READ-NEXT ROUTINE                                   * EASYT007
#00056***************************************************************** EASYT007
#00056 A01020-JOB1-READ-NEXT.                                           EASYT007
#00056     PERFORM A01060-JOB1-FETCH.                                   EASYT007
#00056     IF NOT JOB1-REQUEST-STOP                                     EASYT007
#00056         GO TO A01030-JOB1-RUN.                                   EASYT007
#00056                                                                  EASYT007
#00056***************************************************************** EASYT007
#00056* JOB1 MAIN PROCESSING ROUTINE                                  * EASYT007
#00056***************************************************************** EASYT007
#00056 A01030-JOB1-RUN.                                                 EASYT007
#00065     COMPUTE WCUST-DISP-CTR =                                     EASYT007
#00065         WCUST-DISP-CTR + 1                                       EASYT007
#00066     IF WCUST-DISP-CTR = 100                                      EASYT007
#00067        SET JOB1-STOP-JOB TO TRUE                                 EASYT007
#00067        GO TO A01010-JOB1-READ                                    EASYT007
#00070     END-IF.                                                      EASYT007
#00070                                                                  EASYT007
#00070 A01040-AUTO-GENERATE-READ.                                       EASYT007
#00070     MOVE 1 TO WS-JOB1-FLAG                                       EASYT007
#00070     GO TO A01010-JOB1-READ.                                      EASYT007
#00056                                                                  EASYT007
#00056***************************************************************** EASYT007
#00056* JOB1 FILE OPEN ROUTINE                                        * EASYT007
#00056***************************************************************** EASYT007
#00056 A01050-JOB1-OPEN.                                                EASYT007
#00056     SET JOB1-PENDING TO TRUE.                                    EASYT007
#00056                                                                  EASYT007
#00056***************************************************************** EASYT007
#00056* JOB1 JOB INPUT SQL ROUTINE                                    * EASYT007
#00056***************************************************************** EASYT007
#00056 A01060-JOB1-FETCH.                                               EASYT007
#00061     IF JOB1-GCURS-CLOSED                                         EASYT007
#00061        EXEC SQL                                                  EASYT007
#00061             OPEN JOB1_GCURS                                      EASYT007
#00061        END-EXEC                                                  EASYT007
#00061        PERFORM A01070-JOB1-CHECKSQL                              EASYT007
#00061        SET JOB1-GCURS-OPEN TO TRUE                               EASYT007
#00061     END-IF                                                       EASYT007
#00061                                                                  EASYT007
#00061     EXEC SQL                                                     EASYT007
#00061          FETCH JOB1_GCURS                                        EASYT007
#00061            INTO :WCUST-ID,                                       EASYT007
#00062                 :WCUST-ACC-PRD-CD,                               EASYT007
#00063                 :WCUST-ACCT-ID                                   EASYT007
#00063     END-EXEC                                                     EASYT007
#00063                                                                  EASYT007
#00063     PERFORM A01070-JOB1-CHECKSQL                                 EASYT007
#00063                                                                  EASYT007
#00063     IF SQLCODE = 100                                             EASYT007
#00063        EXEC SQL                                                  EASYT007
#00063             CLOSE JOB1_GCURS                                     EASYT007
#00063        END-EXEC                                                  EASYT007
#00063        PERFORM A01070-JOB1-CHECKSQL                              EASYT007
#00063        SET JOB1-STOP-JOB TO TRUE                                 EASYT007
#00063     END-IF.                                                      EASYT007
#00056                                                                  EASYT007
#00056***************************************************************** EASYT007
#00056* JOB1 JOB INPUT SQL ERROR CHECK                                * EASYT007
#00056***************************************************************** EASYT007
#00056 A01070-JOB1-CHECKSQL.                                            EASYT007
#00056     IF SQLCODE = (ZERO OR 100)                                   EASYT007
#00056        CONTINUE                                                  EASYT007
#00056     ELSE                                                         EASYT007
#00056        DISPLAY PROGRAM-NAME ' - JOB1 JOB1_GCURS I/O ERROR'       EASYT007
#00056        CALL 'FSSQLERR' USING SQLCA                               EASYT007
              MOVE 3001 TO WS-PENGI-RETURN                              ABRCODE
#00056        MOVE 'JOB1_GCURS I/O ERROR. REFER TO SYSOUT MESSAGES.'    EASYT007
#00056                                             TO ABEND-MESSAGE     EASYT007
              PERFORM B00000-ABEND-CALL-FSABEC16                        ABEND00
#00056     END-IF.                                                      EASYT007
                                                                        ABEND00
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * FSABEC16: PROGRAM ABNORMALLY TERMINATES PROCESSING            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       B00000-ABEND-CALL-FSABEC16.                                      ABEND00
           MOVE WS-PENGI-RETURN TO ABEND-REQUEST                        ABEND00
           MOVE 'ALLOC FJSYABE' TO WS-PENGI-SYSOUT-REQ                  ABEND00
           CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             ABEND00
           CALL 'FSABEC16' USING PROGRAM-INFO-TABLE.                    ABEND00
      * THIS IF BELOW PREVENTS COBOL COMPILER WARNING MESSAGES          ABEND00
           IF (RETURN-CODE > 0 OR RETURN-CODE < 0 OR RETURN-CODE = 0)   ABEND00
              GOBACK                                                    ABEND00
           END-IF.                                                      ABEND00
                                                                        PENGIEND
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * ESTABLISH ESPIE TRAP VIA CALL TO FSYESPI1 PROGRAM.            * GENCTEXT
      * NOTE: !!!! THIS CALL MUST REMAIN AS A STATIC CALL.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       C00000-SET-FSYESPI1-TRAP.                                        PENGIEND
           MOVE 'ALLOC FJSYABE' TO WS-PENGI-SYSOUT-REQ                  PENGIEND
           CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             PENGIEND
           CALL 'FSYESPI1' USING                                        PENGIEND
                 PROGRAM-INFO-TABLE WS-PENGI-ESPI-INFO.                 PENGIEND
                                                                        PENGIEND

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
      * 001. => 05 O-WAGE <================== "F" SIGN WILL BE FORCED * EASYT007
      * 002. => 05 BONUS <=================== "F" SIGN WILL BE FORCED * EASYT007
      **                                                             ** EASYT007
      ***************************************************************** EASYT007
                                                                        EASYT007
      ***************************************************************** COBOLBAS
      * FS/PENGI GENERATED FILES IN THIS PROGRAM ARE:                 * COBOLBAS
      *                                                               * COBOLBAS
      *  DDNAME   SYSNAME   ORGANIZATION    ACCESS    FILEIO          * COBOLBAS
      *  ------   -------   ------------    ------    ------          * COBOLBAS
      * FILEIN              SEQ                        INPUT          * FDYNIOR
      * FILEOUT             SEQ                        OUTPUT         * FDYNIOR
      * SYSPRINT            PRINTER        SEQUENTIAL  GEN/PRINT      * GENFILE
      *                                                               * COBOLBAS
      ******************* FS/PENGI GENERATED REPORT1 ****************** GENERATQ
      *                                                               * GENERATQ
      *  DDNAME   SYSNAME    REPORT TYPE   CTL BREAKS   SORT  READ    * GENERATQ
      *  ------   -------    -----------   ----------   ----  ----    * GENERATQ
      * SYSPRINT             1-UP FRAME        2         NO    NO     * GENERATQ
      *                                                               * GENERATQ
      *    CONTROL BREAK(S): LV1  =  FINAL                            * GENERATQ
      *                      LV2  =  COMPANY                          * GENERATQ
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
           02 FILEIN-EZSTATUS       COMP PIC S9(09).                    DEFINE
           02 FILEOUT-EZSTATUS      COMP PIC S9(09).                    DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR PENGI-STATUS-TAB IS 214
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
      *,PENGI - THE COMPUTED LENGTH FOR WORK-AREA1 IS 579
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR WORK-GAREA0.              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  WORK-GAREA0.                                                 DEFINE
           02 BONUS                  PIC S9(7)V9(2) VALUE +0.           DEFINE
           02 BONUS-9U REDEFINES BONUS                                  DEFINE
                                     PIC 9(7)V9(2).                     DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR WORK-GAREA0 IS 9
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI REPORT1 LINE STORAGE DEFINITION FOR F01-HD01.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  F01-HD01.                                                    DEFINE
           02 F01-HD01-GROUP-0.                                         DEFINE
              03 FILLER             PIC X(24) VALUE SPACES.             DEFINE
              03 FILLER               PIC X(22) VALUE                   DEFINE
              'EXECUTIVE BONUS REPORT'.                                 DEFINE
              03 FILLER             PIC X(24) VALUE SPACES.             DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR F01-HD01 IS 70
                                                                        DEFINE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI REPORT1 LINE STORAGE DEFINITION FOR F01-HD02.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  F01-HD02.                                                    DEFINE
           02 FILLER             PIC X(70) VALUE SPACES.                DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR F01-HD02 IS 70
                                                                        DEFINE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI REPORT1 LINE STORAGE DEFINITION FOR F01-LN01.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  F01-LN01.                                                    DEFINE
           02 F01-LN01-GROUP-0.                                         DEFINE
              03 FILLER             PIC X(04) VALUE SPACES.             DEFINE
              03 F01-LN01-COMPANY   PIC X(2).                           DEFINE
              03 FILLER             PIC X(07) VALUE SPACES.             DEFINE
              03 F01-LN01-BRANCH    PIC X(3).                           DEFINE
              03 FILLER             PIC X(06) VALUE SPACES.             DEFINE
              03 F01-LN01-OFFICER   PIC X(4).                           DEFINE
              03 FILLER             PIC X(05) VALUE SPACES.             DEFINE
              03 F01-LN01-RATE      PIC ZZ.9(03)-.                      DEFINE
              03 F01-LN01-RATE-Z                                        DEFINE
                       REDEFINES F01-LN01-RATE      PIC X(7).           DEFINE
              03 FILLER             PIC X(03) VALUE SPACES.             DEFINE
              03 F01-LN01-WAGE      PIC ZZZ,ZZZ.9(02)-.                 DEFINE
              03 F01-LN01-WAGE-Z                                        DEFINE
                       REDEFINES F01-LN01-WAGE      PIC X(11).          DEFINE
              03 FILLER             PIC X(03) VALUE SPACES.             DEFINE
              03 F01-LN01-BONUS     PIC Z,ZZZ,ZZZ.9(02)-.               DEFINE
              03 F01-LN01-BONUS-Z                                       DEFINE
                       REDEFINES F01-LN01-BONUS     PIC X(13).          DEFINE
              03 FILLER             PIC X(02) VALUE SPACES.             DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR F01-LN01 IS 70
                                                                        DEFINE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI REPORT1 LINE STORAGE DEFINITION FOR F01-CF01.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  F01-CF01.                                                    DEFINE
           02 F01-CF01-GROUP-0.                                         DEFINE
              03 FILLER             PIC X(04) VALUE SPACES.             DEFINE
              03 F01-CF01-COMPANY   PIC X(2).                           DEFINE
              03 FILLER             PIC X(07) VALUE SPACES.             DEFINE
              03 F01-CF01-BRANCH    PIC X(3).                           DEFINE
              03 FILLER             PIC X(06) VALUE SPACES.             DEFINE
              03 F01-CF01-OFFICER   PIC X(4).                           DEFINE
              03 FILLER             PIC X(05) VALUE SPACES.             DEFINE
              03 F01-CF01-RATE      PIC ZZ.9(03)-.                      DEFINE
              03 F01-CF01-RATE-Z                                        DEFINE
                       REDEFINES F01-CF01-RATE      PIC X(7).           DEFINE
              03 FILLER             PIC X(03) VALUE SPACES.             DEFINE
              03 F01-CF01-WAGE      PIC ZZZ,ZZZ.9(02)-.                 DEFINE
              03 F01-CF01-WAGE-Z                                        DEFINE
                       REDEFINES F01-CF01-WAGE      PIC X(11).          DEFINE
              03 FILLER             PIC X(03) VALUE SPACES.             DEFINE
              03 F01-CF01-BONUS     PIC Z,ZZZ,ZZZ.9(02)-.               DEFINE
              03 F01-CF01-BONUS-Z                                       DEFINE
                       REDEFINES F01-CF01-BONUS     PIC X(13).          DEFINE
              03 FILLER             PIC X(02) VALUE SPACES.             DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR F01-CF01 IS 70
                                                                        DEFINE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI REPORT1 LINE STORAGE DEFINITION FOR F01-CF02.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  F01-CF02.                                                    DEFINE
           02 F01-CF02-GROUP-0.                                         DEFINE
              03 F01-CF02-WAGE      PIC S9(6)V9(2).                     DEFINE
              03 F01-CF02-WAGE-Z                                        DEFINE
                       REDEFINES F01-CF02-WAGE      PIC X(8).           DEFINE
              03 FILLER             PIC X(03) VALUE SPACES.             DEFINE
              03 F01-CF02-BONUS     PIC S9(7)V9(2).                     DEFINE
              03 F01-CF02-BONUS-Z                                       DEFINE
                       REDEFINES F01-CF02-BONUS     PIC X(9).           DEFINE
              03 FILLER             PIC X(50) VALUE SPACES.             DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR F01-CF02 IS 70
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
       01  WS-FSDYNIO0   PIC X(08) VALUE 'FSDYNIO0'.                    FDYNIOR
                                                                        FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS CODE AND MESSAGE FOR FILEIN FILE            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  FILEIN-IO-COUNT     PIC 9(09) COMP VALUE ZEROES.             FDYNIOR
       01  FILEIN-EOF-DELAY-FLAG PIC X(02) VALUE SPACES.                FDYNIOR
           88 FILEIN-EOF-DELAYED VALUE 'DE'.                            FDYNIOR
       01  FILEIN-IOSW         PIC X(01) VALUE 'C'.                     FDYNIOR
           88 FILEIN-OPEN      VALUE 'O'.                               FDYNIOR
           88 FILEIN-CLOSED    VALUE 'C'.                               FDYNIOR
       01  FILEIN-ACCEPT-FLAG  PIC X(01) VALUE 'Y'.                     FDYNIOR
           88 ACCEPT-FILEIN-RECORD VALUE 'Y'.                           FDYNIOR
           88 BYPASS-FILEIN-RECORD VALUE 'B'.                           FDYNIOR
       01  FILEIN-MESSAGE.                                              FDYNIOR
           02 FILLER         PIC X(28)                                  FDYNIOR
                             VALUE 'FILE I/O ERROR, RETURN CODE='.      FDYNIOR
           02 FILEIN-STATUS  PIC X(02) VALUE SPACES.                    FDYNIOR
              88 FILEIN-GOOD-OPEN VALUE '00' '97'.                      FDYNIOR
              88 FILEIN-GOOD-IO   VALUE '00' '04'.                      FDYNIOR
              88 END-OF-FILEIN    VALUE '10'.                           FDYNIOR
           02 FILLER         PIC X(26) VALUE ' FILEIN'.                 FDYNIOR
                                                                        FDYNIOR
       01  FILEIN-DYNAM-FIB.                                            FDYNIOR
           02 FILEIN-OPSYS        PIC X(03) VALUE 'MVS'.                FDYNIOR
           02 FILEIN-RECFM        PIC X(01) VALUE 'F'.                  FDYNIOR
           02 FILEIN-PHORG        PIC X(08) VALUE 'SEQ'.                FDYNIOR
           02 FILEIN-DDNAME       PIC X(08) VALUE 'FILEIN'.             FDYNIOR
           02 FILEIN-IOM-NAME     PIC X(08) VALUE SPACES.               FDYNIOR
           02 FILEIN-IOM-ADCON    POINTER VALUE NULL.                   FDYNIOR
           02 FILEIN-IOM-ADCON2   POINTER VALUE NULL.                   FDYNIOR
           02 FILEIN-KEY-PTR      POINTER VALUE NULL.                   FDYNIOR
           02 FILEIN-KEY-REL      PIC X(08) VALUE SPACES.               FDYNIOR
      * THE REAL LRECL IS ACQUIRED BY I/O MODULE AT OPEN TIME           FDYNIOR
           02 FILEIN-DCB-LRECL    PIC S9(09) COMP VALUE 80.             FDYNIOR
      * INITIAL SIZE IS ACQUIRED BY I/O MODULE AT OPEN TIME             FDYNIOR
           02 FILEIN-RECORD-SIZE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 FILEIN-RECORD-GSIZ  PIC S9(09) COMP VALUE 80.             FDYNIOR
           02 FILEIN-RECORD-TAIL  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 FILEIN-RECORD-KEYE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 FILEIN-RECORD-VEND  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 FILEIN-IO-REQUEST   PIC X(08) VALUE SPACES.               FDYNIOR
           02 FILEIN-IO-REQTYPE   PIC X(08) VALUE SPACES.               FDYNIOR
           02 FILEIN-IO-ERCODE1   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 FILEIN-IO-ERCODE2   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 FILEIN-IO-VSMEMSG   PIC X(80) VALUE SPACES.               FDYNIOR
           02 FILEIN-IO-BITS0     PIC X(01) VALUE X'08'.                FDYNIOR
           02 FILEIN-IO-BITS1     PIC X(01) VALUE X'00'.                FDYNIOR
           02 FILEIN-IO-BUFNO     PIC S9(04) COMP VALUE 4.              FDYNIOR
           02 FILEIN-RECORD-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 FILEIN-IOAREA-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 FILLER              PIC X(04) VALUE HIGH-VALUES.          FDYNIOR
           02 FILEIN-VSERMOD-PTR  POINTER VALUE NULL.                   FDYNIOR
           02 FILEIN-IOAREA1-ADC  POINTER VALUE NULL.                   FDYNIOR
           02 FILEIN-IOM-ADCON0   POINTER VALUE NULL.                   FDYNIOR
           02 FILEIN-DCB-BLKSIZE  PIC S9(9) COMP VALUE ZERO.            FDYNIOR
           02 FILEIN-RECFM2       PIC X(1)  VALUE 'U'.                  FDYNIOR
           02 FILLER              PIC X(11) VALUE HIGH-VALUES.          FDYNIOR
                                                                        FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS CODE AND MESSAGE FOR FILEOUT FILE           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  FILEOUT-IO-COUNT     PIC 9(09) COMP VALUE ZEROES.            FDYNIOR
       01  FILEOUT-EOF-DELAY-FLAG PIC X(02) VALUE SPACES.               FDYNIOR
           88 FILEOUT-EOF-DELAYED VALUE 'DE'.                           FDYNIOR
       01  FILEOUT-IOSW         PIC X(01) VALUE 'C'.                    FDYNIOR
           88 FILEOUT-OPEN      VALUE 'O'.                              FDYNIOR
           88 FILEOUT-CLOSED    VALUE 'C'.                              FDYNIOR
       01  FILEOUT-ACCEPT-FLAG  PIC X(01) VALUE 'Y'.                    FDYNIOR
           88 ACCEPT-FILEOUT-RECORD VALUE 'Y'.                          FDYNIOR
           88 BYPASS-FILEOUT-RECORD VALUE 'B'.                          FDYNIOR
       01  FILEOUT-MESSAGE.                                             FDYNIOR
           02 FILLER         PIC X(28)                                  FDYNIOR
                             VALUE 'FILE I/O ERROR, RETURN CODE='.      FDYNIOR
           02 FILEOUT-STATUS  PIC X(02) VALUE SPACES.                   FDYNIOR
              88 FILEOUT-GOOD-OPEN VALUE '00' '97'.                     FDYNIOR
              88 FILEOUT-GOOD-IO   VALUE '00' '04'.                     FDYNIOR
              88 END-OF-FILEOUT    VALUE '10'.                          FDYNIOR
           02 FILLER         PIC X(26) VALUE ' FILEOUT'.                FDYNIOR
                                                                        FDYNIOR
       01  FILEOUT-DYNAM-FIB.                                           FDYNIOR
           02 FILEOUT-OPSYS        PIC X(03) VALUE 'MVS'.               FDYNIOR
           02 FILEOUT-RECFM        PIC X(01) VALUE 'F'.                 FDYNIOR
           02 FILEOUT-PHORG        PIC X(08) VALUE 'SEQ'.               FDYNIOR
           02 FILEOUT-DDNAME       PIC X(08) VALUE 'FILEOUT'.           FDYNIOR
           02 FILEOUT-IOM-NAME     PIC X(08) VALUE SPACES.              FDYNIOR
           02 FILEOUT-IOM-ADCON    POINTER VALUE NULL.                  FDYNIOR
           02 FILEOUT-IOM-ADCON2   POINTER VALUE NULL.                  FDYNIOR
           02 FILEOUT-KEY-PTR      POINTER VALUE NULL.                  FDYNIOR
           02 FILEOUT-KEY-REL      PIC X(08) VALUE SPACES.              FDYNIOR
      * THE REAL LRECL IS ACQUIRED BY I/O MODULE AT OPEN TIME           FDYNIOR
           02 FILEOUT-DCB-LRECL    PIC S9(09) COMP VALUE 80.            FDYNIOR
      * INITIAL SIZE IS ACQUIRED BY I/O MODULE AT OPEN TIME             FDYNIOR
           02 FILEOUT-RECORD-SIZE  PIC S9(09) COMP VALUE ZERO.          FDYNIOR
           02 FILEOUT-RECORD-GSIZ  PIC S9(09) COMP VALUE 80.            FDYNIOR
           02 FILEOUT-RECORD-TAIL  PIC S9(09) COMP VALUE ZERO.          FDYNIOR
           02 FILEOUT-RECORD-KEYE  PIC S9(09) COMP VALUE ZERO.          FDYNIOR
           02 FILEOUT-RECORD-VEND  PIC S9(09) COMP VALUE ZERO.          FDYNIOR
           02 FILEOUT-IO-REQUEST   PIC X(08) VALUE SPACES.              FDYNIOR
           02 FILEOUT-IO-REQTYPE   PIC X(08) VALUE SPACES.              FDYNIOR
           02 FILEOUT-IO-ERCODE1   PIC X(02) VALUE ZEROS.               FDYNIOR
           02 FILEOUT-IO-ERCODE2   PIC X(02) VALUE ZEROS.               FDYNIOR
           02 FILEOUT-IO-VSMEMSG   PIC X(80) VALUE SPACES.              FDYNIOR
           02 FILEOUT-IO-BITS0     PIC X(01) VALUE X'08'.               FDYNIOR
           02 FILEOUT-IO-BITS1     PIC X(01) VALUE X'00'.               FDYNIOR
           02 FILEOUT-IO-BUFNO     PIC S9(04) COMP VALUE 4.             FDYNIOR
           02 FILEOUT-RECORD-PTR   POINTER VALUE NULL.                  FDYNIOR
           02 FILEOUT-IOAREA-PTR   POINTER VALUE NULL.                  FDYNIOR
           02 FILLER              PIC X(04) VALUE HIGH-VALUES.          FDYNIOR
           02 FILEOUT-VSERMOD-PTR  POINTER VALUE NULL.                  FDYNIOR
           02 FILEOUT-IOAREA1-ADC  POINTER VALUE NULL.                  FDYNIOR
           02 FILEOUT-IOM-ADCON0   POINTER VALUE NULL.                  FDYNIOR
           02 FILEOUT-DCB-BLKSIZE  PIC S9(9) COMP VALUE ZERO.           FDYNIOR
           02 FILEOUT-RECFM2       PIC X(1)  VALUE 'U'.                 FDYNIOR
           02 FILLER              PIC X(11) VALUE HIGH-VALUES.          FDYNIOR
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
           02 REPORT1-PENGI-CTLIDL  PIC S9(09) COMP VALUE 13.           GENERATQ
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
              88 R01-BRK-COMPANY VALUE 2.                               GENERATQ
           02 REPORT1-BREAK-LEVL  PIC S9(04) COMP VALUE ZERO.           GENERATQ
              88 R01-HBR-FINAL VALUE 2.                                 GENERATQ
              88 R01-HBR-COMPANY VALUE 1.                               GENERATQ
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI INTERNALLY GENERATED REPORT1 SAVE AREAS.                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  REPORT1-SAVE-AREAS.                                          GENERATQ
           02 R01-SAV-COMPANY                   PIC X(2)                GENERATQ
                                     VALUE LOW-VALUES.                  GENERATQ
           02 R01-TXT-COMPANY.                                          GENERATQ
              03 R01-EDT-COMPANY                PIC X(2)                GENERATQ
                                     VALUE LOW-VALUES.                  GENERATQ
           02 R01-SAV-RATE                      PIC S9(02)V9(03)        GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R01-SAV-OFFICER                   PIC X(4)                GENERATQ
                                     VALUE LOW-VALUES.                  GENERATQ
           02 R01-SAV-BRANCH                    PIC X(3)                GENERATQ
                                     VALUE LOW-VALUES.                  GENERATQ
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI INTERNALLY GENERATED REPORT1 CTL BREAK BUCKETS          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
                                                                        GENERATQ
       01  REPORT1-LEVEL0-BUCKETS COMP-3.                               GENERATQ
           02 R01-LV0-BONUS                  PIC S9(17)V9(2)  VALUE +0. GENERATQ
           02 R01-LV0-WAGE                   PIC S9(17)V9(2)  VALUE +0. GENERATQ
           02 R01-LV0-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT1-LEVEL1-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R01-LV1-BONUS                  PIC S9(17)V9(2)  VALUE +0. GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R01-LV1-WAGE                   PIC S9(17)V9(2)  VALUE +0. GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R01-LV1-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT1-LEVEL2-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R01-LV2-BONUS                  PIC S9(17)V9(2)  VALUE +0. GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R01-LV2-WAGE                   PIC S9(17)V9(2)  VALUE +0. GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R01-LV2-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI INTERNALLY GENERATED HD1-F01-LN01 HEADER LAYOUT.        * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  HD1-F01-LN01.                                                GENERATQ
           02 FILLER            PIC X(02) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(07) VALUE 'COMPANY'.              GENERATQ
           02 FILLER            PIC X(03) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(06) VALUE 'BRANCH'.               GENERATQ
           02 FILLER            PIC X(03) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(07) VALUE 'OFFICER'.              GENERATQ
           02 FILLER            PIC X(04) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(04) VALUE 'RATE'.                 GENERATQ
           02 FILLER            PIC X(08) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(04) VALUE 'WAGE'.                 GENERATQ
           02 FILLER            PIC X(11) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(05) VALUE 'BONUS'.                GENERATQ
      *,PENGI - THE COMPUTED LENGTH FOR HD1-F01-LN01 IS 64
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
      * WORK AREAS FOR REPORTS OVERFLOW TESTING                       * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  WS-PENGI-QMASKOV-GROUP.                                      CHKOVF0
           02 WS-PENGI-EDIT-6-2-1  PIC 999,999.9(02)-.                  CHKOVF0
           02 WS-PENGI-EDIT-7-2-2  PIC 9,999,999.9(02)-.                CHKOVF0
                                                                        CHKOVF0
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
                 04 WS-PENGI-ESPI-1-FILEIN.                             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'DYNAMIC'.             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'FILEIN'.              PENGIEND
                 04 WS-PENGI-ESPI-2-FILEOUT.                            PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'DYNAMIC'.             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'FILEOUT'.             PENGIEND
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
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR FILEIN-IO-AREA.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  FILEIN-IO-AREA.                                              DEFINE
           02 FILLER PIC X                                              DEFINE
                     OCCURS 0 TO 32767 TIMES                            DEFINE
                     DEPENDING ON FILEIN-RECORD-TAIL.                   DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR FILEIN-IO-AREA IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR FILEIN-RECORD.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  FILEIN-RECORD.                                               DEFINE
           02 FILEIN-GRECORD.                                           DEFINE
              03 COBCOPYA.                                              DEFINE
                 04 COMPANY                PIC X(2).                    DEFINE
                 04 BRANCH                 PIC X(3).                    DEFINE
                 04 OFFICER                PIC X(4).                    DEFINE
                 04 WAGE                   PIC S9(6)V9(2).              DEFINE
                 04 RATE                   PIC S9(2)V9(3).              DEFINE
                 04 FILLER                 PIC X(58).                   DEFINE
           02 FILLER  OCCURS 0 TO 32687 TIMES DEPENDING ON              DEFINE
           FILEIN-RECORD-VEND                                           DEFINE
                                     PIC X(01).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR FILEIN-RECORD IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR FILEOUT-IO-AREA.          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  FILEOUT-IO-AREA.                                             DEFINE
           02 FILLER PIC X                                              DEFINE
                     OCCURS 0 TO 32767 TIMES                            DEFINE
                     DEPENDING ON FILEOUT-RECORD-TAIL.                  DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR FILEOUT-IO-AREA IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR FILEOUT-RECORD.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  FILEOUT-RECORD.                                              DEFINE
           02 FILEOUT-GRECORD.                                          DEFINE
              03 O-COBCOPYA.                                            DEFINE
                 04 O-COMPANY              PIC X(2).                    DEFINE
                 04 O-BRANCH               PIC X(3).                    DEFINE
                 04 O-OFFICER              PIC X(4).                    DEFINE
                 04 O-WAGE                 PIC S9(6)V9(2).              DEFINE
                 04 O-WAGE-9U REDEFINES O-WAGE                          DEFINE
                                           PIC 9(6)V9(2).               DEFINE
                 04 O-RATE                 PIC S9(2)V9(3).              DEFINE
                 04 FILLER                 PIC X(58).                   DEFINE
           02 FILLER  OCCURS 0 TO 32687 TIMES DEPENDING ON              DEFINE
           FILEOUT-RECORD-VEND                                          DEFINE
                                     PIC X(01).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR FILEOUT-RECORD IS 32767
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
#00075     MOVE 1 TO REPORT1-LGRP-CNTRL.                                EASYT007
#00075     MOVE 1 TO REPORT1-L1ST-CNTRL.                                EASYT007
#00075     MOVE 'ALLOC SORTWK01' TO WS-PENGI-ALLOC-REQ                  EASYT007
#00075     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC.             EASYT007
#00075     MOVE 'ALLOC SORTWK02' TO WS-PENGI-ALLOC-REQ                  EASYT007
#00075     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC.             EASYT007
#00075     MOVE 'ALLOC SORTWK03' TO WS-PENGI-ALLOC-REQ                  EASYT007
#00075     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC.             EASYT007
                                                                        EASYT007
#00061***************************************************************** EASYT007
#00061* JOB1 INITIATION ROUTINE                                       * EASYT007
#00061***************************************************************** EASYT007
#00061 A01000-JOB1-ENTRY.                                               EASYT007
#00061                                                                  EASYT007
#00061     PERFORM A01050-JOB1-OPEN                                     EASYT007
#00061     PERFORM A01010-JOB1-READ                                     EASYT007
#00061       UNTIL END-OF-FILEIN                                        EASYT007
#00061             OR JOB1-REQUEST-STOP.                                EASYT007
#00061                                                                  EASYT007
#00061     MOVE ZERO TO WS-JOB1-FLAG.                                   EASYT007
#00061                                                                  EASYT007
#00075     IF WS-JOB1-REPORT1-SW = 'Y'                                  EASYT007
#00075         PERFORM B00130-REPORT1-TERMINATE                         EASYT007
#00075     END-IF.                                                      EASYT007
#00075                                                                  EASYT007
#00075     MOVE 'JOB1'  TO WS-PENGI-EZ-JID                              EASYT007
#00075     MOVE '1' TO WS-PENGI-EZ-JOB                                  EASYT007
#00075     DISPLAY ' '                                                  EASYT007
#00075     DISPLAY WS-PENGI-EZ-STAT1                                    EASYT007
#00075     DISPLAY ' '                                                  EASYT007
#00075     DISPLAY WS-PENGI-EZ-STAT2                                    EASYT007
#00075     MOVE 'INPUT' TO WS-PENGI-EZ-IOTYPE                           EASYT007
#00075     MOVE 'FILEIN' TO WS-PENGI-EZ-DDNAME                          EASYT007
#00075     MOVE FILEIN-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                 EASYT007
#00075     MOVE FILEIN-DCB-LRECL TO WS-PENGI-EZ-LRECL                   EASYT007
#00075     MOVE FILEIN-PHORG TO WS-PENGI-EZ-ORG                         EASYT007
#00075     MOVE FILEIN-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM               EASYT007
#00075     MOVE FILEIN-IOM-NAME      TO WS-PENGI-EZ-IOMOD               EASYT007
#00075     MOVE FILEIN-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE               EASYT007
#00075     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#00075     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#00075                                                                  EASYT007
#00075* FILEIN CLOSE ROUTINE                                            FDYNIOR
#00075     MOVE 'CLOSE'  TO FILEIN-IO-REQUEST                           FDYNIOR
#00075     MOVE ZERO TO FILEIN-STATUS                                   FDYNIOR
#00075     IF FILEIN-OPEN                                               FDYNIOR
#00075        CALL 'FSDYNIO1' USING FILEIN-DYNAM-FIB                    FDYNIOR
#00075        MOVE  FILEIN-IO-ERCODE1 TO FILEIN-STATUS                  FDYNIOR
#00075     END-IF                                                       FDYNIOR
#00075     MOVE 'C'     TO FILEIN-IOSW                                  FDYNIOR
#00075     MOVE SPACE   TO FILEIN-ACCEPT-FLAG                           FDYNIOR
#00075     IF (NOT FILEIN-GOOD-IO)                                      FDYNIOR
#00075        DISPLAY FILEIN-MESSAGE                                    FDYNIOR
#00075        MOVE 3001 TO WS-PENGI-RETURN                              ABRCODE
#00075        MOVE FILEIN-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00075        DISPLAY FILEIN-IOM-NAME ': ' FILEIN-IO-VSMEMSG            FDYNIOR
#00075        PERFORM C00000-ABEND-CALL-FSABEC16                        ABEND00
#00075     END-IF.                                                      FDYNIOR
#00075                                                                  FDYNIOR
#00075     MOVE 'OUTPUT' TO WS-PENGI-EZ-IOTYPE                          EASYT007
#00075     MOVE 'FILEOUT' TO WS-PENGI-EZ-DDNAME                         EASYT007
#00075     MOVE FILEOUT-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                EASYT007
#00075     MOVE FILEOUT-DCB-LRECL TO WS-PENGI-EZ-LRECL                  EASYT007
#00075     MOVE FILEOUT-PHORG TO WS-PENGI-EZ-ORG                        EASYT007
#00075     MOVE FILEOUT-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM              EASYT007
#00075     MOVE FILEOUT-IOM-NAME      TO WS-PENGI-EZ-IOMOD              EASYT007
#00075     MOVE FILEOUT-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE              EASYT007
#00075     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#00075     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#00075                                                                  EASYT007
#00075* FILEOUT CLOSE ROUTINE                                           FDYNIOR
#00075     MOVE 'CLOSE'  TO FILEOUT-IO-REQUEST                          FDYNIOR
#00075     MOVE ZERO TO FILEOUT-STATUS                                  FDYNIOR
#00075     IF FILEOUT-OPEN                                              FDYNIOR
#00075        CALL 'FSDYNIO1' USING FILEOUT-DYNAM-FIB                   FDYNIOR
#00075        MOVE  FILEOUT-IO-ERCODE1 TO FILEOUT-STATUS                FDYNIOR
#00075     END-IF                                                       FDYNIOR
#00075     MOVE 'C'     TO FILEOUT-IOSW                                 FDYNIOR
#00075     MOVE SPACE   TO FILEOUT-ACCEPT-FLAG                          FDYNIOR
#00075     IF (NOT FILEOUT-GOOD-IO)                                     FDYNIOR
#00075        DISPLAY FILEOUT-MESSAGE                                   FDYNIOR
#00075        MOVE 3002 TO WS-PENGI-RETURN                              ABRCODE
#00075        MOVE FILEOUT-MESSAGE TO ABEND-MESSAGE                     FDYNIOR
#00075        DISPLAY FILEOUT-IOM-NAME ': ' FILEOUT-IO-VSMEMSG          FDYNIOR
#00075        PERFORM C00000-ABEND-CALL-FSABEC16                        ABEND00
#00075     END-IF.                                                      FDYNIOR
#00075                                                                  FDYNIOR
#00075     MOVE 'PRINTER' TO WS-PENGI-EZ-ORG                            EASYT007
#00075     MOVE 'OUTPUT'  TO WS-PENGI-EZ-IOTYPE                         EASYT007
      *,FILE DCB INFO. IS FROM THE DEFAULT VALUES.
#00075     MOVE 'SYSPRINT'  TO WS-PENGI-EZ-DDNAME                       EASYT007
#00075     MOVE SYSPRINT-IO-COUNT TO WS-PENGI-EZ-IO-COUNT               EASYT007
#00075     MOVE 'FBA' TO WS-PENGI-EZ-RECFM                              EASYT007
#00075     COMPUTE WS-PENGI-EZ-LRECL = (132 + 1)                        EASYT007
#00075     MOVE 0 TO WS-PENGI-EZ-BLKSIZE                                EASYT007
#00075     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#00075     MOVE SPACES TO WS-PENGI-EZ-IOMOD                             EASYT007
#00075     CLOSE SYSPRINT                                               EASYT007
#00075                                                                  EASYT007
#00075     MOVE ZERO TO SYSPRINT-IO-COUNT                               EASYT007
#00075     MOVE  'C' TO SYSPRINT-IOSW.                                  EASYT007
#00075                                                                  EASYT007
#00075     MOVE WS-PENGI-RETURN TO RETURN-CODE. GOBACK.                 EASYT007
#00075                                                                  EASYT007
#00061***************************************************************** EASYT007
#00061* JOB1 FILE READ ROUTINE                                        * EASYT007
#00061***************************************************************** EASYT007
#00061 A01010-JOB1-READ.                                                EASYT007
      *,EXIT IF STOP/STOP EXECUTE TO PREVENT AN EXTRA READ
#00061     IF (NOT JOB1-REQUEST-STOP)                                   EASYT007
#00061         PERFORM A01020-JOB1-READ-NEXT                            EASYT007
#00061     END-IF.                                                      EASYT007
#00061                                                                  EASYT007
#00061***************************************************************** EASYT007
#00061* JOB1 FILE READ-NEXT ROUTINE                                   * EASYT007
#00061***************************************************************** EASYT007
#00061 A01020-JOB1-READ-NEXT.                                           EASYT007
#00061                                                                  EASYT007
#00061     MOVE 'READ'  TO FILEIN-IO-REQUEST                            FDYNIOR
#00061     CALL 'FSDYNIO2' USING FILEIN-DYNAM-FIB                       FDYNIOR
#00061     IF FILEIN-GOOD-IO                                            FDYNIOR
#00061        SET ADDRESS OF FILEIN-IO-AREA TO FILEIN-IOAREA-PTR        FDYNIOR
#00061     END-IF                                                       FDYNIOR

#00061     MOVE  FILEIN-IO-ERCODE1 TO FILEIN-STATUS                     FDYNIOR
#00061     IF END-OF-FILEIN                                             FDYNIOR
#00061        MOVE '10'    TO FILEIN-STATUS                             FDYNIOR
#00061     ELSE                                                         FDYNIOR
#00061     IF NOT FILEIN-GOOD-IO                                        FDYNIOR
#00061        DISPLAY FILEIN-MESSAGE                                    FDYNIOR
#00061        MOVE 3003 TO WS-PENGI-RETURN                              ABRCODE
#00061        MOVE FILEIN-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00061        DISPLAY FILEIN-IOM-NAME ': ' FILEIN-IO-VSMEMSG            FDYNIOR
#00061        PERFORM C00000-ABEND-CALL-FSABEC16                        ABEND00
#00061     ELSE                                                         FDYNIOR
#00061     ADD 1 TO FILEIN-IO-COUNT.                                    FDYNIOR
#00061                                                                  FDYNIOR
#00061     MOVE FILEIN-STATUS TO PENGI-CODE0                            EASYT007
#00061     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO FILEIN-EZSTATUS        EASYT007
#00061                                                                  EASYT007
#00061     IF NOT (END-OF-FILEIN                                        EASYT007
#00061              OR JOB1-REQUEST-STOP)                               EASYT007
#00061         MOVE FILEIN-IO-AREA TO FILEIN-RECORD                     EASYT007
#00061     GO TO A01030-JOB1-RUN.                                       EASYT007
#00061                                                                  EASYT007
#00061***************************************************************** EASYT007
#00061* JOB1 MAIN PROCESSING ROUTINE                                  * EASYT007
#00061***************************************************************** EASYT007
#00061 A01030-JOB1-RUN.                                                 EASYT007
#00061     MOVE ZERO TO WS-JOB1-REPORT-LEVL.                            EASYT007
#00062     IF WAGE NUMERIC                                              EASYT007
#00062     AND RATE NUMERIC                                             EASYT007
#00063        COMPUTE BONUS =                                           EASYT007
#00063                   1.00000000 * WAGE * (1.00000000 * RATE / 100)  EASYT007
#00063        IF BONUS NOT < ZERO                                       EASYT007
#00063           MOVE BONUS TO BONUS-9U                                 EASYT007
#00063        END-IF                                                    EASYT007
#00064        MOVE FILEIN-RECORD  TO FILEOUT-RECORD                     EASYT007
#00065        MOVE BONUS  TO O-WAGE                                     EASYT007
#00065        IF O-WAGE NOT < ZERO                                      EASYT007
#00065           MOVE O-WAGE TO O-WAGE-9U                               EASYT007
#00065        END-IF                                                    EASYT007
#00066                                                                  EASYT007
#00066        COMPUTE FILEOUT-RECORD-TAIL =                             EASYT007
#00066                FILEOUT-RECORD-SIZE - FILEOUT-RECORD-KEYE         EASYT007
#00066        PERFORM A01060-FILEOUT-1-WRITE                            EASYT007
#00067        PERFORM A01070-GENERATE-REPORT1                           EASYT007
#00067           THRU A01080-GENERATE-REPORT1-EXIT                      EASYT007
#00070     END-IF.                                                      EASYT007
#00070                                                                  EASYT007
#00070 A01040-AUTO-GENERATE-READ.                                       EASYT007
#00070     MOVE 1 TO WS-JOB1-FLAG                                       EASYT007
#00070     GO TO A01010-JOB1-READ.                                      EASYT007
#00061                                                                  EASYT007
#00061***************************************************************** EASYT007
#00061* JOB1 FILE OPEN ROUTINE                                        * EASYT007
#00061***************************************************************** EASYT007
#00061 A01050-JOB1-OPEN.                                                EASYT007
#00070     MOVE 'X' TO SYSPRINT-IOSW                                    EASYT007
#00070     PERFORM B00120-REPORT1-OPEN                                  EASYT007
#00070     MOVE 'C' TO SYSPRINT-IOSW.                                   EASYT007
#00075                                                                  FDYNIOR
#00075* FILEIN OPEN ROUTINE                                             FDYNIOR
#00075     MOVE 'OPEN'  TO FILEIN-IO-REQUEST                            FDYNIOR
#00075     MOVE 'INPUT'  TO FILEIN-IO-REQTYPE                           FDYNIOR
#00075     CALL 'FSDYNIO1' USING FILEIN-DYNAM-FIB                       FDYNIOR
#00075     MOVE  FILEIN-IO-ERCODE1 TO FILEIN-STATUS                     FDYNIOR
#00075     MOVE 'O'     TO FILEIN-IOSW                                  FDYNIOR
#00075     MOVE 'Y'     TO FILEIN-ACCEPT-FLAG                           FDYNIOR
#00075     MOVE ZERO    TO FILEIN-IO-COUNT                              FDYNIOR
#00075     IF (NOT FILEIN-GOOD-IO)                                      FDYNIOR
#00075        DISPLAY FILEIN-MESSAGE                                    FDYNIOR
#00075        MOVE 3004 TO WS-PENGI-RETURN                              ABRCODE
#00075        MOVE FILEIN-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00075        DISPLAY FILEIN-IOM-NAME ': ' FILEIN-IO-VSMEMSG            FDYNIOR
#00075        PERFORM C00000-ABEND-CALL-FSABEC16                        ABEND00
#00075     END-IF.                                                      FDYNIOR
#00075     SET ADDRESS OF FILEIN-IO-AREA TO FILEIN-IOAREA-PTR           FDYNIOR
#00075     CALL 'FSDYNPTR' USING  FILEIN-DYNAM-FIB                      FDYNIOR
#00075     SET ADDRESS OF FILEIN-RECORD  TO FILEIN-RECORD-PTR           FDYNIOR
#00075     MOVE SPACES TO FILEIN-RECORD.                                FDYNIOR
#00075     INITIALIZE FILEIN-GRECORD.                                   FDYNIOR
#00075                                                                  FDYNIOR
#00075* FILEOUT OPEN ROUTINE                                            FDYNIOR
#00075     MOVE 'OPEN'  TO FILEOUT-IO-REQUEST                           FDYNIOR
#00075     MOVE 'OUTPUT'  TO FILEOUT-IO-REQTYPE                         FDYNIOR
#00075     CALL 'FSDYNIO1' USING FILEOUT-DYNAM-FIB                      FDYNIOR
#00075     MOVE  FILEOUT-IO-ERCODE1 TO FILEOUT-STATUS                   FDYNIOR
#00075     MOVE 'O'     TO FILEOUT-IOSW                                 FDYNIOR
#00075     MOVE 'Y'     TO FILEOUT-ACCEPT-FLAG                          FDYNIOR
#00075     MOVE ZERO    TO FILEOUT-IO-COUNT                             FDYNIOR
#00075     IF (NOT FILEOUT-GOOD-IO)                                     FDYNIOR
#00075        DISPLAY FILEOUT-MESSAGE                                   FDYNIOR
#00075        MOVE 3005 TO WS-PENGI-RETURN                              ABRCODE
#00075        MOVE FILEOUT-MESSAGE TO ABEND-MESSAGE                     FDYNIOR
#00075        DISPLAY FILEOUT-IOM-NAME ': ' FILEOUT-IO-VSMEMSG          FDYNIOR
#00075        PERFORM C00000-ABEND-CALL-FSABEC16                        ABEND00
#00075     END-IF.                                                      FDYNIOR
#00075     SET ADDRESS OF FILEOUT-IO-AREA TO FILEOUT-IOAREA-PTR         FDYNIOR
#00075     CALL 'FSDYNPTR' USING  FILEOUT-DYNAM-FIB                     FDYNIOR
#00075     SET ADDRESS OF FILEOUT-RECORD  TO FILEOUT-RECORD-PTR         FDYNIOR
#00075     MOVE SPACES TO FILEOUT-RECORD.                               FDYNIOR
#00075     INITIALIZE FILEOUT-GRECORD.                                  FDYNIOR
#00075                                                                  FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * FILEOUT - WRITE I/O INTERFACE ROUTINE                         * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00066 A01060-FILEOUT-1-WRITE.                                          EASYT007
#00066                                                                  FDYNIOR
#00066     COMPUTE FILEOUT-RECORD-TAIL =                                FDYNIOR
#00066             FILEOUT-RECORD-SIZE  - FILEOUT-RECORD-KEYE           FDYNIOR
#00066     IF FILEOUT-RECORD-SIZE > FILEOUT-RECORD-GSIZ                 FDYNIOR
#00066        COMPUTE FILEOUT-RECORD-VEND =                             FDYNIOR
#00066                FILEOUT-RECORD-SIZE  - FILEOUT-RECORD-GSIZ        FDYNIOR
#00066     ELSE                                                         FDYNIOR
#00066        MOVE 0 TO FILEOUT-RECORD-VEND                             FDYNIOR
#00066     END-IF                                                       FDYNIOR
#00066     MOVE FILEOUT-RECORD TO FILEOUT-IO-AREA                       FDYNIOR
#00066     MOVE 'WRITE'  TO FILEOUT-IO-REQUEST                          FDYNIOR
#00066     CALL 'FSDYNIO2' USING FILEOUT-DYNAM-FIB                      FDYNIOR
#00066     MOVE  FILEOUT-IO-ERCODE1 TO FILEOUT-STATUS                   FDYNIOR
#00066     ADD 1 TO FILEOUT-IO-COUNT                                    FDYNIOR
#00066     IF (NOT FILEOUT-GOOD-IO)                                     FDYNIOR
#00066        DISPLAY FILEOUT-MESSAGE                                   FDYNIOR
#00066        MOVE 3006 TO WS-PENGI-RETURN                              ABRCODE
#00066        MOVE FILEOUT-MESSAGE TO ABEND-MESSAGE                     FDYNIOR
#00066        DISPLAY FILEOUT-IOM-NAME ': ' FILEOUT-IO-VSMEMSG          FDYNIOR
#00066        PERFORM C00000-ABEND-CALL-FSABEC16                        ABEND00
#00066     END-IF.                                                      FDYNIOR
#00066                                                                  FDYNIOR
#00066     MOVE FILEOUT-STATUS TO PENGI-CODE0                           EASYT007
#00066     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO FILEOUT-EZSTATUS.      EASYT007
#00070                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * REPORT1 - INTERFACE ROUTINE AND GENERATE MACRO PARAMETERS     * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070 A01070-GENERATE-REPORT1.                                         EASYT007
#00070     MOVE 'Y' TO WS-JOB1-REPORT1-SW.                              EASYT007
#00070                                                                  GENFILE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI REPORT1 MAIN LINE INTERFACE ROUTINES.                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070     PERFORM B00000-REPORT1-MAINLINE                              GENERATQ
#00070        THRU B00010-REPORT1-MAINLINE-EXIT.                        GENERATQ
#00075                                                                  EASYT007
#00075 A01080-GENERATE-REPORT1-EXIT. EXIT.                              EASYT007
#00070                                                                  GENERATQ
#00070     EJECT                                                        GENERATQ
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 MAIN LINE.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
#00070 B00000-REPORT1-MAINLINE.                                         GENERATQ
#00070     MOVE 'N' TO REPORT1-FINL-CNTRL                               GENERATQ
#00070     MOVE ZERO TO REPORT1-CTL-LEVEL.                              GENERATQ
#00070     IF SYSPRINT-IOSW = 'C'                                       GENERATQ
#00070         PERFORM B00120-REPORT1-OPEN                              GENERATQ
#00070         PERFORM B00030-REPORT1-SAVE                              GENERATQ
#00070     ELSE                                                         GENERATQ
#00070     IF REPORT1-COUNT = 0                                         GENERATQ
#00070         PERFORM B00030-REPORT1-SAVE.                             GENERATQ
#00070                                                                  GENERATQ
#00070     IF R01-SAV-COMPANY NOT = COMPANY                             GENERATQ
#00070         MOVE 1 TO REPORT1-BREAK-LEVL                             GENERATQ
#00070         MOVE 1 TO REPORT1-PFOOT-LEVL                             GENERATQ
#00070         PERFORM B00080-REPORT1-LV2-BREAK                         GENERATQ
#00070         PERFORM B00030-REPORT1-SAVE                              GENERATQ
#00070         MOVE ZERO TO REPORT1-BREAK-LEVL.                         GENERATQ
#00070                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 DETAIL LOGIC.          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070     PERFORM B00060-REPORT1-DTL-FORMULAS.                         GENERATQ
#00070     MOVE RATE TO R01-SAV-RATE.                                   GENERATQ
#00070     MOVE OFFICER TO R01-SAV-OFFICER.                             GENERATQ
#00070     MOVE BRANCH TO R01-SAV-BRANCH.                               GENERATQ
#00070                                                                  GENERATQ
#00070     MOVE BONUS TO F01-LN01-BONUS                                 GENERATQ
#00070     MOVE WAGE TO F01-LN01-WAGE                                   GENERATQ
#00070     MOVE RATE TO F01-LN01-RATE                                   GENERATQ
#00070     MOVE OFFICER TO F01-LN01-OFFICER                             GENERATQ
#00070     MOVE BRANCH TO F01-LN01-BRANCH                               GENERATQ
#00070     MOVE COMPANY TO F01-LN01-COMPANY                             GENERATQ
#00070     MOVE ZERO TO REPORT1-LSEQ-CNTRL                              GENERATQ
#00070     MOVE 1 TO REPORT1-ADV-CNTRL                                  GENERATQ
#00070     ADD 1 TO REPORT1-LSEQ-CNTRL                                  GENERATQ
#00070     PERFORM B00190-REPORT1-TEST-LMAX1                            GENERATQ
#00070                                                                  GENERATQ
#00070     MOVE ZERO TO REPORT1-PSKP-CNTRL                              GENERATQ
#00070     PERFORM B00020-REPORT1-F01-LN01-DCTL                         GENERATQ
#00070     MOVE F01-LN01 TO REPORT1-PENGI-RECORD                        GENERATQ
#00070     PERFORM B00140-REPORT1-DO-IO0                                GENERATQ
#00070                                                                  GENERATQ
#00070     MOVE 'Y' TO REPORT1-FOOTSW                                   GENERATQ
#00070     MOVE 'N' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00070     ADD BONUS TO R01-LV2-BONUS.                                  GENERATQ
#00070     ADD WAGE TO R01-LV2-WAGE.                                    GENERATQ
#00070 B00010-REPORT1-MAINLINE-EXIT. EXIT.                              GENERATQ
#00070                                                                  GENERATQ
#00070 B00020-REPORT1-F01-LN01-DCTL.                                    GENERATQ
#00070     IF REPORT1-FIRST-DETAIL                                      GENERATQ
#00070     OR REPORT1-LINE0 NOT < REPORT1-LMAX1                         GENERATQ
#00070         NEXT SENTENCE                                            GENERATQ
#00070     ELSE                                                         GENERATQ
#00070     MOVE SPACES TO F01-LN01-COMPANY                              GENERATQ
#00070     MOVE 'N' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00070                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR SAVING REPORT1 FIELDS.         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070 B00030-REPORT1-SAVE.                                             GENERATQ
#00070     MOVE COMPANY TO R01-SAV-COMPANY.                             GENERATQ
#00070     MOVE 'COMPANY TOTAL' TO PENGI-CTLID.                         GENERATQ
#00070     MOVE R01-SAV-COMPANY                                         GENERATQ
#00070          TO R01-EDT-COMPANY                                      GENERATQ
#00070     MOVE R01-TXT-COMPANY TO PENGI-CTL.                           GENERATQ
#00070                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR FINAL CONTROL BREAK.                                      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070 B00040-REPORT1-LV1-FORMULAS.                                     GENERATQ
#00070     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00070     MOVE 'FINAL TOTAL' TO PENGI-CTLID                            GENERATQ
#00070     MOVE ALL '*'  TO PENGI-CTL.                                  GENERATQ
#00070                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR COMPANY CONTROL BREAK.                                    * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070 B00050-REPORT1-LV2-FORMULAS.                                     GENERATQ
#00070     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00070     MOVE 'COMPANY TOTAL' TO PENGI-CTLID                          GENERATQ
#00070     MOVE R01-SAV-COMPANY                                         GENERATQ
#00070          TO R01-EDT-COMPANY                                      GENERATQ
#00070     MOVE R01-TXT-COMPANY TO PENGI-CTL.                           GENERATQ
#00070                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR REPORT1 DETAIL FORMULAS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070 B00060-REPORT1-DTL-FORMULAS.                                     GENERATQ
#00070     ADD 1 TO REPORT1-COUNT.                                      GENERATQ
#00070     ADD PENGI-COUNT TO R01-LV2-PENGI-COUNT.                      GENERATQ
#00070     MOVE ZERO TO REPORT1-CTL-LEVEL.                              GENERATQ
#00070                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT1               * GENCTEXT
      * FINAL CONTROL BREAK AMENITIES.                                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070 B00070-REPORT1-LV1-BREAK.                                        GENERATQ
#00070     PERFORM B00080-REPORT1-LV2-BREAK.                            GENERATQ
#00070     PERFORM B00040-REPORT1-LV1-FORMULAS.                         GENERATQ
#00070     MOVE ZERO TO REPORT1-LSEQ-CNTRL                              GENERATQ
#00070     MOVE SPACES TO F01-CF01-RATE-Z                               GENERATQ
#00070     MOVE SPACES TO F01-CF01-OFFICER                              GENERATQ
#00070     MOVE SPACES TO F01-CF01-BRANCH                               GENERATQ
#00070     MOVE SPACES TO F01-CF01-COMPANY                              GENERATQ
#00070     MOVE R01-LV1-BONUS TO F01-CF01-BONUS                         GENERATQ
#00070     MOVE R01-LV1-WAGE TO F01-CF01-WAGE                           GENERATQ
#00070                                                                  CHKOVF0
#00070     IF (R01-LV1-WAGE > 999999.99)                                CHKOVF0
#00070     OR (R01-LV1-WAGE < -999999.99)                               CHKOVF0
#00070        MOVE R01-LV1-WAGE TO WS-PENGI-EDIT-6-2-1                  CHKOVF0
#00070        MOVE WS-PENGI-EDIT-6-2-1 TO F01-CF01-WAGE                 CHKOVF0
#00070        (1:LENGTH OF F01-CF01-WAGE)                               CHKOVF0
#00070        MOVE '*' TO F01-CF01-WAGE                                 CHKOVF0
#00070        (LENGTH OF F01-CF01-WAGE:1)                               CHKOVF0
#00070     END-IF                                                       CHKOVF0
#00070                                                                  CHKOVF0
#00070     IF (R01-LV1-BONUS > 9999999.99)                              CHKOVF0
#00070     OR (R01-LV1-BONUS < -9999999.99)                             CHKOVF0
#00070        MOVE R01-LV1-BONUS TO WS-PENGI-EDIT-7-2-2                 CHKOVF0
#00070        MOVE WS-PENGI-EDIT-7-2-2 TO F01-CF01-BONUS                CHKOVF0
#00070        (1:LENGTH OF F01-CF01-BONUS)                              CHKOVF0
#00070        MOVE '*' TO F01-CF01-BONUS                                CHKOVF0
#00070        (LENGTH OF F01-CF01-BONUS:1)                              CHKOVF0
#00070     END-IF                                                       CHKOVF0
#00070                                                                  CHKOVF0
#00070     MOVE 1 TO REPORT1-ADV-CNTRL                                  GENERATQ
#00070     ADD  1 TO REPORT1-LSEQ-CNTRL                                 GENERATQ
#00070     PERFORM B00190-REPORT1-TEST-LMAX1                            GENERATQ
#00070                                                                  GENERATQ
#00070     MOVE ZERO TO REPORT1-PSKP-CNTRL                              GENERATQ
#00070     MOVE F01-CF01 TO REPORT1-PENGI-RECORD                        GENERATQ
#00070     PERFORM B00140-REPORT1-DO-IO0                                GENERATQ
#00070                                                                  GENERATQ
#00070     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00070     ADD REPORT1-DSKP-CNTRL TO REPORT1-LNXT-CNTRL.                GENERATQ
#00070     ADD REPORT1-CSKP-CNTRL TO REPORT1-LNXT-CNTRL                 GENERATQ
#00070     ADD 1 TO REPORT1-LSEQ-CNTRL                                  GENERATQ
#00070     IF REPORT1-RSKP-CNTRL NOT < REPORT1-PAGE-SIZE                GENERATQ
#00070        MOVE REPORT1-CSKP-CNTRL TO REPORT1-PSKP-CNTRL             GENERATQ
#00070     END-IF.                                                      GENERATQ
#00070     PERFORM B00090-REPORT1-CLEAR-LV1.                            GENERATQ
#00070                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT1               * GENCTEXT
      * COMPANY CONTROL BREAK AMENITIES.                              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070 B00080-REPORT1-LV2-BREAK.                                        GENERATQ
#00070     PERFORM B00050-REPORT1-LV2-FORMULAS.                         GENERATQ
#00070     MOVE ZERO TO REPORT1-LSEQ-CNTRL                              GENERATQ
#00070     MOVE SPACES TO F01-CF01-RATE-Z                               GENERATQ
#00070     MOVE SPACES TO F01-CF01-OFFICER                              GENERATQ
#00070     MOVE SPACES TO F01-CF01-BRANCH                               GENERATQ
#00070     MOVE R01-SAV-COMPANY TO F01-CF01-COMPANY                     GENERATQ
#00070                                                                  GENERATQ
#00070     MOVE R01-LV2-BONUS TO F01-CF01-BONUS                         GENERATQ
#00070     MOVE R01-LV2-WAGE TO F01-CF01-WAGE                           GENERATQ
#00070                                                                  CHKOVF0
#00070     IF (R01-LV2-WAGE > 999999.99)                                CHKOVF0
#00070     OR (R01-LV2-WAGE < -999999.99)                               CHKOVF0
#00070        MOVE R01-LV2-WAGE TO WS-PENGI-EDIT-6-2-1                  CHKOVF0
#00070        MOVE WS-PENGI-EDIT-6-2-1 TO F01-CF01-WAGE                 CHKOVF0
#00070        (1:LENGTH OF F01-CF01-WAGE)                               CHKOVF0
#00070        MOVE '*' TO F01-CF01-WAGE                                 CHKOVF0
#00070        (LENGTH OF F01-CF01-WAGE:1)                               CHKOVF0
#00070     END-IF                                                       CHKOVF0
#00070                                                                  CHKOVF0
#00070     IF (R01-LV2-BONUS > 9999999.99)                              CHKOVF0
#00070     OR (R01-LV2-BONUS < -9999999.99)                             CHKOVF0
#00070        MOVE R01-LV2-BONUS TO WS-PENGI-EDIT-7-2-2                 CHKOVF0
#00070        MOVE WS-PENGI-EDIT-7-2-2 TO F01-CF01-BONUS                CHKOVF0
#00070        (1:LENGTH OF F01-CF01-BONUS)                              CHKOVF0
#00070        MOVE '*' TO F01-CF01-BONUS                                CHKOVF0
#00070        (LENGTH OF F01-CF01-BONUS:1)                              CHKOVF0
#00070     END-IF                                                       CHKOVF0
#00070                                                                  CHKOVF0
#00070     MOVE 1 TO REPORT1-ADV-CNTRL                                  GENERATQ
#00070     ADD  1 TO REPORT1-LSEQ-CNTRL                                 GENERATQ
#00070     PERFORM B00190-REPORT1-TEST-LMAX1                            GENERATQ
#00070                                                                  GENERATQ
#00070     MOVE ZERO TO REPORT1-PSKP-CNTRL                              GENERATQ
#00070     MOVE F01-CF01 TO REPORT1-PENGI-RECORD                        GENERATQ
#00070     PERFORM B00140-REPORT1-DO-IO0                                GENERATQ
#00070                                                                  GENERATQ
#00070     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00070     ADD REPORT1-DSKP-CNTRL TO REPORT1-LNXT-CNTRL.                GENERATQ
#00070     ADD REPORT1-CSKP-CNTRL TO REPORT1-LNXT-CNTRL                 GENERATQ
#00070     ADD 1 TO REPORT1-LSEQ-CNTRL                                  GENERATQ
#00070     IF REPORT1-RSKP-CNTRL NOT < REPORT1-PAGE-SIZE                GENERATQ
#00070        MOVE REPORT1-CSKP-CNTRL TO REPORT1-PSKP-CNTRL             GENERATQ
#00070     END-IF.                                                      GENERATQ
#00070     PERFORM B00100-REPORT1-CLEAR-LV2.                            GENERATQ
#00070                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT1 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070 B00090-REPORT1-CLEAR-LV1.                                        GENERATQ
#00070     INITIALIZE REPORT1-LEVEL1-BUCKETS.                           GENERATQ
#00070                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT1 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070 B00100-REPORT1-CLEAR-LV2.                                        GENERATQ
#00070     ADD  R01-LV2-BONUS TO R01-LV1-BONUS                          GENERATQ
#00070     ADD  R01-LV2-WAGE TO R01-LV1-WAGE                            GENERATQ
#00070     ADD  R01-LV2-PENGI-COUNT TO R01-LV1-PENGI-COUNT              GENERATQ
#00070     INITIALIZE REPORT1-LEVEL2-BUCKETS.                           GENERATQ
#00070                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR PRINTING REPORT1 HEADERS.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070 B00110-REPORT1-HDR.                                              GENERATQ
#00070     ACCEPT PENGI-DATE-2 FROM DATE.                               GENERATQ
#00070     ACCEPT PENGI-TIME-2 FROM TIME.                               GENERATQ
#00070     MOVE 'Y' TO REPORT1-FOOTSW.                                  GENERATQ
#00070     MOVE 0 TO REPORT1-LINE0                                      GENERATQ
#00070                                                                  GENERATQ
#00070     IF REPORT1-PAGE-RENUM                                        GENERATQ
#00070        MOVE ZEROS TO REPORT1-PAGE0                               GENERATQ
#00070        MOVE SPACE TO REPORT1-PAGE-RENUM-SW                       GENERATQ
#00070     END-IF                                                       GENERATQ
#00070     ADD  1 TO REPORT1-PAGE0                                      GENERATQ
#00070     MOVE REPORT1-PAGE0 TO PENGI-PAGE.                            GENERATQ
#00070     MOVE 'PAGE' TO F01-HD01(59:5)                                COBSTAT
#00070     MOVE WS-PENGI-DATE-P TO F01-HD01(1:8)                        COBSTAT
#00070     MOVE REPORT1-PAGE0 TO WS-PENGI-PAGE                          COBSTAT
#00070     MOVE WS-PENGI-PAGE TO F01-HD01(64:7)                         COBSTAT
#00070     ADD 1 TO REPORT1-LINE0                                       GENERATQ
#00070     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#00070     WRITE SYSPRINT-RECORD                                        PRINTSRV
#00070            FROM F01-HD01 AFTER ADVANCING CH1.                    PRINTSRV
#00070     ADD 3 TO REPORT1-LINE0                                       GENERATQ
#00070     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#00070     WRITE SYSPRINT-RECORD                                        PRINTSRV
#00070            FROM F01-HD02 AFTER ADVANCING 3.                      PRINTSRV
#00070     ADD 1 TO REPORT1-LINE0                                       GENERATQ
#00070     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#00070     WRITE SYSPRINT-RECORD                                        PRINTSRV
#00070            FROM HD1-F01-LN01 AFTER ADVANCING 1.                  PRINTSRV
#00070     MOVE 'H' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00070     MOVE REPORT1-LINE0 TO REPORT1-HSKP-CNTRL                     GENERATQ
#00070     PERFORM B00210-REPORT1-ADJUST-PAGE                           GENERATQ
#00070     MOVE REPORT1-LINE0 TO REPORT1-RSKP-CNTRL                     GENERATQ
#00070     MOVE REPORT1-L1ST-CNTRL TO REPORT1-LNXT-CNTRL.               GENERATQ
#00070                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED REPORT1 OPEN ROUTINE.                         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070 B00120-REPORT1-OPEN.                                             GENERATQ
#00070     MOVE 'H' TO REPORT1-PENGI-FIRST-SW                           GENERATQ
#00070     COMPUTE SYSPRINT-RECORD-SIZE =                               GENERATQ
#00070               (SYSPRINT-RECORD-GSIZ)                             GENERATQ
#00070     IF SYSPRINT-IOSW = 'X'                                       GENERATQ
#00070     MOVE 'ALLOC SYSPRINT' TO WS-PENGI-SYSOUT-REQ                 GENERATQ
#00070     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             GENERATQ
#00070     OPEN OUTPUT SYSPRINT.                                        PRINTSRV
#00070     MOVE 'O' TO SYSPRINT-IOSW                                    GENERATQ
#00070     IF NOT SYSPRINT-GOOD-IO                                      GENERATQ
#00070         DISPLAY SYSPRINT-MESSAGE                                 GENERATQ
#00070         MOVE 3007 TO WS-PENGI-RETURN                             ABRCODE
#00070         MOVE SYSPRINT-MESSAGE TO ABEND-MESSAGE                   GENERATQ
#00070         PERFORM C00000-ABEND-CALL-FSABEC16.                      ABEND00
#00070                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED REPORT1 TERMINATION ROUTINES.                 * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070 B00130-REPORT1-TERMINATE.                                        GENERATQ
#00070     IF SYSPRINT-IOSW NOT = 'O'                                   GENERATQ
#00070         PERFORM B00120-REPORT1-OPEN.                             GENERATQ
#00070     MOVE 2 TO REPORT1-BREAK-LEVL                                 GENERATQ
#00070     MOVE 'Y' TO REPORT1-FINL-CNTRL                               GENERATQ
#00070     MOVE REPORT1-BREAK-LEVL TO REPORT1-PFOOT-LEVL                GENERATQ
#00070                                                                  GENERATQ
#00070     PERFORM B00070-REPORT1-LV1-BREAK                             GENERATQ
#00070     MOVE ZERO TO REPORT1-CTL-LEVEL                               GENERATQ
#00070     IF REPORT1-LNXT-CNTRL NOT = ZERO                             GENERATQ
#00070        MOVE SPACES TO REPORT1-PENGI-RECORD                       GENERATQ
#00070        PERFORM B00150-REPORT1-DO-IO1-A                           GENERATQ
#00070        PERFORM B00160-REPORT1-DO-IO2-A                           GENERATQ
#00070        MOVE ZERO TO REPORT1-ADV-CNTRL                            GENERATQ
#00070        MOVE ZERO TO REPORT1-LNXT-CNTRL                           GENERATQ
#00070     END-IF                                                       GENERATQ
#00070     MOVE 0 TO REPORT1-COUNT, REPORT1-PAGE0.                      GENERATQ
#00070     MOVE SPACE TO REPORT1-PAGE-RENUM-SW.                         GENERATQ
#00070     MOVE REPORT1-LMAX0 TO REPORT1-LINE0.                         GENERATQ
#00070     IF SYSPRINT-IO-COUNT < ZERO                                  GENERATQ
#00070        PERFORM B00170-REPORT1-DO-IO-CH1                          GENERATQ
#00070     END-IF.                                                      GENERATQ
#00070                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI COMMON I/O LOGIC FOR HANDLING REPORT1                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070 B00140-REPORT1-DO-IO0.                                           GENERATQ
#00070     IF REPORT1-PENGI-RECORD = SPACES                             GENERATQ
#00070        ADD REPORT1-ADV-CNTRL TO REPORT1-LNXT-CNTRL               GENERATQ
#00070        MOVE ZERO TO REPORT1-ADV-CNTRL                            GENERATQ
#00070     ELSE                                                         GENERATQ
#00070        ADD REPORT1-ADV-CNTRL TO REPORT1-LNXT-CNTRL               GENERATQ
#00070        PERFORM B00150-REPORT1-DO-IO1-A                           GENERATQ
#00070        PERFORM B00160-REPORT1-DO-IO2-A                           GENERATQ
#00070        MOVE ZERO TO REPORT1-LNXT-CNTRL                           GENERATQ
#00070        MOVE ZERO TO REPORT1-ADV-CNTRL                            GENERATQ
#00070     END-IF.                                                      GENERATQ
#00070                                                                  GENERATQ
#00070* THIS ROUTINE ADVANCES PRINTING TO MAKE SURE THAT THERE IS NO    GENERATQ
#00070* MORE THAN 3 OUTSTANDING BLANK LINES TO PRINT.                   GENERATQ
#00070*                                                                 GENERATQ
#00070* INPUT : REPORT1-NXT-CNTRL FOR NUMBER OF LINES TO ADVANCE.       GENERATQ
#00070* OUTPUT: REPORT1-ADV-CNTRL FOR THE REMAINING # OF LINES.         GENERATQ
#00070                                                                  GENERATQ
#00070 B00150-REPORT1-DO-IO1-A.                                         GENERATQ
#00070     PERFORM TEST BEFORE UNTIL REPORT1-LNXT-CNTRL <= 3            GENERATQ
#00070        SUBTRACT 3 FROM REPORT1-LNXT-CNTRL                        GENERATQ
#00070        MOVE SPACES TO SYSPRINT-RECORD                            GENERATQ
#00070        ADD 1 TO SYSPRINT-IO-COUNT                                GENERATQ
#00070        WRITE SYSPRINT-RECORD                                     PRINTSRV
#00070               AFTER ADVANCING 3                                  PRINTSRV
#00070        PERFORM B00200-REPORT1-TEST-IO-ERR                        GENERATQ
#00070        ADD 3 TO REPORT1-LINE0                                    GENERATQ
#00070        ADD 3 TO REPORT1-RSKP-CNTRL                               GENERATQ
#00070     END-PERFORM.                                                 GENERATQ
#00070     MOVE REPORT1-LNXT-CNTRL TO REPORT1-ADV-CNTRL.                GENERATQ
#00070* I/O ROUTINE FOR PRINTING FROM THE REPORT WORK AREA.             GENERATQ
#00070* INPUT : REPORT1-ADV-CNTRL FOR #OF LINES TO ADVANCE              GENERATQ
#00070*         REPORT1-PENGI-RECORD CONTAINS DATA TO PRINT             GENERATQ
#00070                                                                  GENERATQ
#00070 B00160-REPORT1-DO-IO2-A.                                         GENERATQ
#00070     ADD REPORT1-ADV-CNTRL TO REPORT1-LINE0                       GENERATQ
#00070     ADD REPORT1-ADV-CNTRL TO REPORT1-RSKP-CNTRL                  GENERATQ
#00070     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#00070     WRITE SYSPRINT-RECORD                                        PRINTSRV
#00070            FROM REPORT1-PENGI-RECORD AFTER ADVANCING             PRINTSRV
                  REPORT1-ADV-CNTRL.                                    PRINTSRV
#00070     PERFORM B00200-REPORT1-TEST-IO-ERR.                          GENERATQ
#00070                                                                  GENERATQ
#00070* I/O ROUTINE FOR PRINTING TO CH1.                                GENERATQ
#00070* INPUT : REPORT1-ADV-CNTRL FOR #OF LINES TO COUNT                GENERATQ
#00070*         SYSPRINT-RECORD CONTAINS DATA TO PRINT.                 GENERATQ
#00070                                                                  GENERATQ
#00070 B00170-REPORT1-DO-IO-CH1.                                        GENERATQ
#00070     ADD REPORT1-ADV-CNTRL TO REPORT1-LINE0                       GENERATQ
#00070     ADD REPORT1-ADV-CNTRL TO REPORT1-RSKP-CNTRL                  GENERATQ
#00070     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#00070     WRITE SYSPRINT-RECORD                                        PRINTSRV
#00070            AFTER ADVANCING CH1                                   PRINTSRV
#00070                                                                  GENERATQ
#00070     PERFORM B00200-REPORT1-TEST-IO-ERR.                          GENERATQ
#00070                                                                  GENERATQ
#00070* MAIN OVERFLOW ROUTINE FOR DETAIL AND TOTAL PRINTING.            GENERATQ
#00070* INPUT : REPORT1-LNXT-CNTRL CONTAINS #OF OUTSTANDING LINES.      GENERATQ
#00070*         REPORT1-ADV-CNTRL #OF LINES TO ADVANCE FOR THIS I/O.    GENERATQ
#00070                                                                  GENERATQ
#00070 B00190-REPORT1-TEST-LMAX1.                                       GENERATQ
#00070     IF REPORT1-LSEQ-CNTRL < 2                                    GENERATQ
#00070        COMPUTE REPORT1-WSKP-CNTRL = REPORT1-LINE0 +              GENERATQ
#00070                REPORT1-ADV-CNTRL + REPORT1-LNXT-CNTRL            GENERATQ
#00070        IF REPORT1-WSKP-CNTRL > REPORT1-LMAX1                     GENERATQ
#00070           ADD REPORT1-ADV-CNTRL TO REPORT1-LNXT-CNTRL            GENERATQ
#00070           MOVE ZERO TO REPORT1-ADV-CNTRL                         GENERATQ
#00070           PERFORM B00110-REPORT1-HDR                             GENERATQ
#00070           MOVE 1 TO REPORT1-ADV-CNTRL                            GENERATQ
#00070           MOVE ZERO TO REPORT1-LNXT-CNTRL                        GENERATQ
#00070           ADD REPORT1-HOFF-CNTRL TO REPORT1-ADV-CNTRL            GENERATQ
#00070        END-IF                                                    GENERATQ
#00070     ELSE                                                         GENERATQ
#00070        COMPUTE REPORT1-WSKP-CNTRL = REPORT1-LINE0 +              GENERATQ
#00070                REPORT1-ADV-CNTRL + REPORT1-LNXT-CNTRL            GENERATQ
#00070        IF REPORT1-WSKP-CNTRL > REPORT1-LMAX1                     GENERATQ
#00070           COMPUTE REPORT1-ADV-CNTRL =                            GENERATQ
#00070                   REPORT1-WSKP-CNTRL - REPORT1-LMAX1             GENERATQ
#00070           MOVE ZERO TO REPORT1-LNXT-CNTRL                        GENERATQ
#00070           IF REPORT1-LINE0 > REPORT1-LMAX1                       GENERATQ
#00070              MOVE 1 TO REPORT1-ADV-CNTRL                         GENERATQ
#00070           END-IF                                                 GENERATQ
#00070           PERFORM B00110-REPORT1-HDR                             GENERATQ
#00070           ADD REPORT1-LNXT-CNTRL TO REPORT1-ADV-CNTRL            GENERATQ
#00070           MOVE ZERO TO REPORT1-LNXT-CNTRL                        GENERATQ
#00070        END-IF                                                    GENERATQ
#00070     END-IF.                                                      GENERATQ
#00070                                                                  GENERATQ
#00070* PRINTER I/O ERROR HANDLING ROUTINE.                             GENERATQ
#00070                                                                  GENERATQ
#00070 B00200-REPORT1-TEST-IO-ERR.                                      GENERATQ
#00070     IF NOT SYSPRINT-GOOD-IO                                      GENERATQ
#00070         DISPLAY SYSPRINT-MESSAGE                                 GENERATQ
#00070         MOVE 3008 TO WS-PENGI-RETURN                             ABRCODE
#00070         MOVE SYSPRINT-MESSAGE TO ABEND-MESSAGE                   GENERATQ
#00070         PERFORM C00000-ABEND-CALL-FSABEC16.                      ABEND00
#00070                                                                  GENERATQ
#00070* COMPUTE MAXIMUM PAGE LINES THAT CAN FIT IN THE PAGESIZE AREA    GENERATQ
#00070* ROUTINE IS INVOKED FROM THE REPORT HEADER PROCESSING ROUTINE.   GENERATQ
#00070                                                                  GENERATQ
#00070 B00210-REPORT1-ADJUST-PAGE.                                      GENERATQ
#00070     COMPUTE REPORT1-LMAX0 = REPORT1-LMAX1                        GENERATQ
#00070     COMPUTE REPORT1-LMAX2 = REPORT1-LMAX1 - 1                    GENERATQ
#00070     COMPUTE REPORT1-LMAX3 = REPORT1-LMAX1 - 2.                   GENERATQ
#00070                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      *           ++ END OF GENERATED CODE FOR REPORT1 ++             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00075                                                                  ABEND00
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * FSABEC16: PROGRAM ABNORMALLY TERMINATES PROCESSING            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00075 C00000-ABEND-CALL-FSABEC16.                                      ABEND00
#00075     MOVE WS-PENGI-RETURN TO ABEND-REQUEST                        ABEND00
#00075     MOVE 'ALLOC FJSYABE' TO WS-PENGI-SYSOUT-REQ                  ABEND00
#00075     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             ABEND00
#00075     CALL 'FSABEC16' USING PROGRAM-INFO-TABLE.                    ABEND00
#00075* THIS IF BELOW PREVENTS COBOL COMPILER WARNING MESSAGES          ABEND00
#00075     IF (RETURN-CODE > 0 OR RETURN-CODE < 0 OR RETURN-CODE = 0)   ABEND00
#00075        GOBACK                                                    ABEND00
#00075     END-IF.                                                      ABEND00
#00070                                                                  PENGIEND
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * ESTABLISH ESPIE TRAP VIA CALL TO FSYESPI1 PROGRAM.            * GENCTEXT
      * NOTE: !!!! THIS CALL MUST REMAIN AS A STATIC CALL.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00070 D00000-SET-FSYESPI1-TRAP.                                        PENGIEND
#00070     MOVE 'ALLOC FJSYABE' TO WS-PENGI-SYSOUT-REQ                  PENGIEND
#00070     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             PENGIEND
#00070     CALL 'FSYESPI1' USING                                        PENGIEND
#00070           PROGRAM-INFO-TABLE WS-PENGI-ESPI-INFO.                 PENGIEND
#00070                                                                  PENGIEND

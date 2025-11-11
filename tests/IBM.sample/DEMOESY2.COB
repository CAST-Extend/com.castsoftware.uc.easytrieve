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
      * 001. => 02 SEGMENT-LOOP <============ LABEL IS IN IF/DO/CASE  * EASYT007
      * 002. => 02 RK-BUCKET-LOOP <========== LABEL IS IN IF/DO/CASE  * EASYT007
      * 003. => 05 COMMITMENT-AMT <========== "F" SIGN WILL BE FORCED * EASYT007
      * 004. => 05 PRI-BALANCE <============= "F" SIGN WILL BE FORCED * EASYT007
      * 005. => 05 INTEREST-OWING <========== "F" SIGN WILL BE FORCED * EASYT007
      * 006. => 05 FEES-OWING <============== "F" SIGN WILL BE FORCED * EASYT007
      * 007. => 05 W-ORIGINAL <============== "F" SIGN WILL BE FORCED * EASYT007
      * 008. => 05 W-PRINCIPAL <============= "F" SIGN WILL BE FORCED * EASYT007
      * 009. => 05 W-INTEREST <============== "F" SIGN WILL BE FORCED * EASYT007
      * 010. => 05 W-INTEREST-FEE <========== "F" SIGN WILL BE FORCED * EASYT007
      * 011. => 05 W-INTEREST-RATE <========= "F" SIGN WILL BE FORCED * EASYT007
      * 012. => 05 W-AMOUNT <================ "F" SIGN WILL BE FORCED * EASYT007
      * 013. => 05 W-LOAN-LOSS <============= "F" SIGN WILL BE FORCED * EASYT007
      * 014. => 05 BILLED-AMOUNT <=========== "F" SIGN WILL BE FORCED * EASYT007
      * 015. => 05 PAST-DUE-AMOUNT <========= "F" SIGN WILL BE FORCED * EASYT007
      * 016. => 05 REPORT-PAST-DUE <========= "F" SIGN WILL BE FORCED * EASYT007
      * 017. => 05 TEST-AMOUNT <============= "F" SIGN WILL BE FORCED * EASYT007
      * 018. => 05 LEAPS <=================== "F" SIGN WILL BE FORCED * EASYT007
      * 019. => 05 DIFF <==================== "F" SIGN WILL BE FORCED * EASYT007
      * 020. => 05 END-JULIAN <============== "F" SIGN WILL BE FORCED * EASYT007
      **                                                             ** EASYT007
      ***************************************************************** EASYT007
                                                                        EASYT007
      ***************************************************************** COBOLBAS
      * FS/PENGI GENERATED FILES IN THIS PROGRAM ARE:                 * COBOLBAS
      *                                                               * COBOLBAS
      *  DDNAME   SYSNAME   ORGANIZATION    ACCESS    FILEIO          * COBOLBAS
      *  ------   -------   ------------    ------    ------          * COBOLBAS
      * SMYFIL2             SEQ                        INPUT          * FDYNIOR
      * SMYFIL              SEQ                        INPUT          * FDYNIOR
      * M8104D              INDEXED        DYNAMIC     INPUT          * FDYNIOR
      * M8124D              INDEXED        DYNAMIC     INPUT          * FDYNIOR
      * M8134D              INDEXED                    INPUT          * FDYNIOR
      * M8234D              INDEXED                    INPUT          * FDYNIOR
      * ACH                 SEQ                        INPUT          * FDYNIOR
      * TEMPWK1             SEQ            SEQUENTIAL  GEN/SORT       * GENFILE
      * SORTFL1             SEQ            SEQUENTIAL  GEN/SORT       * GENFILE
      * SYSPRINT            PRINTER        SEQUENTIAL  GEN/PRINT      * GENFILE
      * ME7232              SEQ                        OUTPUT         * FDYNIOR
      * TEMPWK2             SEQ            SEQUENTIAL  GEN/SORT       * GENFILE
      * SORTFL2             SEQ            SEQUENTIAL  GEN/SORT       * GENFILE
      * ME7231              SEQ                        OUTPUT         * FDYNIOR
      *                                                               * COBOLBAS
      ****************** PENGI GENERATED MATCH1 *********************** EXTRACT
      * THIS MATCH INCLUDES THE FOLLOWING OPTIONS AND RESOURCES:      * EXTRACT
      *                                                               * EXTRACT
      *       PENGI MATCH: FILE-SCAN  ( 2 FILES)                      * EXTRACT
      *           PREFIX: M01 = INTERNAL FIELDS                       * EXTRACT
      *                   Y01 = INTERNAL PARAGRAPHS                   * EXTRACT
      *                                                               * EXTRACT
      *      OUTPUT FILE: SYNCF3 (EXIT A03000-JOB3-READ)              * EXTRACT
      *                                                               * EXTRACT
      *      MERGE FILE1: SMYFIL2                                     * EXTRACT
      *               BY: ASCENDING SMY2-CRITERIA                     * EXTRACT
      *                   ASCENDING SMY2-BANK                         * EXTRACT
      *                   ASCENDING SMY2-BRANCH                       * EXTRACT
      *                   ASCENDING SMY2-TYPE                         * EXTRACT
      *                   ASCENDING SMY2-DATE                         * EXTRACT
      *                                                               * EXTRACT
      *      MERGE FILE2: SMYFIL                                      * EXTRACT
      *               BY: ASCENDING SMY-CRITERIA                      * EXTRACT
      *                   ASCENDING SMY-BANK                          * EXTRACT
      *                   ASCENDING SMY-BRANCH                        * EXTRACT
      *                   ASCENDING SMY-TYPE                          * EXTRACT
      *                   ASCENDING SMY-DATE                          * EXTRACT
      *                                                               * EXTRACT
      ***************************************************************** EXTRACT
       EJECT                                                            EXTRACT
      ******************* FS/PENGI GENERATED REPORT1 ****************** GENERATQ
      *                                                               * GENERATQ
      *  DDNAME   SYSNAME    REPORT TYPE   CTL BREAKS   SORT  READ    * GENERATQ
      *  ------   -------    -----------   ----------   ----  ----    * GENERATQ
      * SYSPRINT             1-UP FRAME        6         YES   NO     * GENERATQ
      *                                                               * GENERATQ
      *    INTERNAL SORT FILE(S): SORTFL1 TEMPWK1                     * GENERATQ
      *                                                               * GENERATQ
      *    CONTROL BREAK(S): LV1  =  FINAL                            * GENERATQ
      *                      LV2  =  CRITERIA                         * GENERATQ
      *                      LV3  =  T-BANK                           * GENERATQ
      *                      LV4  =  W-ASSIGNMENT                     * GENERATQ
      *                      LV5  =  WORK-TYPE                        * GENERATQ
      *                      LV6  =  ACCR-DATE                        * GENERATQ
      *                                                               * GENERATQ
      ******************* FS/PENGI GENERATED REPORT2 ****************** GENERATQ
      *                                                               * GENERATQ
      *  DDNAME   SYSNAME    REPORT TYPE   CTL BREAKS   SORT  READ    * GENERATQ
      *  ------   -------    -----------   ----------   ----  ----    * GENERATQ
      * SYSPRINT             1-UP FRAME        6         YES   NO     * GENERATQ
      *                                                               * GENERATQ
      *    INTERNAL SORT FILE(S): SORTFL2 TEMPWK2                     * GENERATQ
      *                                                               * GENERATQ
      *    CONTROL BREAK(S): LV1  =  FINAL                            * GENERATQ
      *                      LV2  =  CRITERIA                         * GENERATQ
      *                      LV3  =  W-BANK                           * GENERATQ
      *                      LV4  =  W-ASSIGNMENT                     * GENERATQ
      *                      LV5  =  WORK-TYPE                        * GENERATQ
      *                      LV6  =  ACCR-DATE                        * GENERATQ
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
      * PENGI EXPANDED SEQUENTIAL TEMPWK1 FILE ENTRY.                 * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
           SELECT TEMPWK1 ASSIGN TO S-TEMPWK1                           GENFILE
                  ORGANIZATION IS SEQUENTIAL                            GENFILE
                  FILE STATUS IS TEMPWK1-STATUS                         GENFILE
                  ACCESS MODE IS SEQUENTIAL.                            GENFILE
                                                                        GENFILE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI EXPANDED SEQUENTIAL SORTFL1 FILE ENTRY.                 * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
      *,SORT FILE ASSUMED. FILE STATUS NOT GENERATED.
           SELECT SORTFL1 ASSIGN TO S-SORTFL1.                          GENFILE
                                                                        GENFILE
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
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI EXPANDED SEQUENTIAL TEMPWK2 FILE ENTRY.                 * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
           SELECT TEMPWK2 ASSIGN TO S-TEMPWK2                           GENFILE
                  ORGANIZATION IS SEQUENTIAL                            GENFILE
                  FILE STATUS IS TEMPWK2-STATUS                         GENFILE
                  ACCESS MODE IS SEQUENTIAL.                            GENFILE
                                                                        GENFILE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI EXPANDED SEQUENTIAL SORTFL2 FILE ENTRY.                 * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
      *,SORT FILE ASSUMED. FILE STATUS NOT GENERATED.
           SELECT SORTFL2 ASSIGN TO S-SORTFL2.                          GENFILE
                                                                        GENFILE
       DATA DIVISION.                                                   COBOLBAS
       FILE SECTION.                                                    COBOLBAS
                                                                        CCGSORT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED FD FOR TEMPWK1 EXTRACT FILE.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       FD  TEMPWK1                                                      CCGSORT
           RECORDING MODE IS F                                          CCGSORT
           LABEL RECORDS ARE STANDARD                                   CCGSORT
           BLOCK CONTAINS 0 RECORDS                                     CCGSORT
           DATA RECORD IS TEMPWK1-RECORD.                               CCGSORT
       01  TEMPWK1-RECORD.                                              CCGSORT
           02 T1-CRITERIA             COMP-3 PIC  S9(5).                GENERATQ
           02 T1-T-BANK               COMP-3 PIC  S9(2).                GENERATQ
           02 T1-W-ASSIGNMENT         COMP-3 PIC  S9(5).                GENERATQ
           02 T1-WORK-TYPE             PIC  X(5).                       GENERATQ
           02 T1-ACCR-DATE            COMP-3 PIC  S9(6).                GENERATQ
           02 T1-W-AMOUNT             COMP-3 PIC  S9(13)V9(2).          GENERATQ
                                                                        CCGSORT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED FD FOR SORTFL1 SORT FILE.               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       SD  SORTFL1                                                      CCGSORT
           DATA RECORD IS SORTFL1-RECORD.                               CCGSORT
       01  SORTFL1-RECORD.                                              CCGSORT
           02 S1-CRITERIA             COMP-3 PIC  S9(5).                GENERATQ
           02 S1-T-BANK               COMP-3 PIC  S9(2).                GENERATQ
           02 S1-W-ASSIGNMENT         COMP-3 PIC  S9(5).                GENERATQ
           02 S1-WORK-TYPE             PIC  X(5).                       GENERATQ
           02 S1-ACCR-DATE            COMP-3 PIC  S9(6).                GENERATQ
           02 S1-W-AMOUNT             COMP-3 PIC  S9(13)V9(2).          GENERATQ
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
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED FD FOR TEMPWK2 EXTRACT FILE.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       FD  TEMPWK2                                                      CCGSORT
           RECORDING MODE IS F                                          CCGSORT
           LABEL RECORDS ARE STANDARD                                   CCGSORT
           BLOCK CONTAINS 0 RECORDS                                     CCGSORT
           DATA RECORD IS TEMPWK2-RECORD.                               CCGSORT
       01  TEMPWK2-RECORD.                                              CCGSORT
           02 T2-CRITERIA             COMP-3 PIC  S9(5).                GENERATQ
           02 T2-W-BANK               COMP-3 PIC  S9(2).                GENERATQ
           02 T2-W-ASSIGNMENT         COMP-3 PIC  S9(5).                GENERATQ
           02 T2-WORK-TYPE             PIC  X(5).                       GENERATQ
           02 T2-ACCR-DATE            COMP-3 PIC  S9(6).                GENERATQ
           02 T2-W-AMOUNT             COMP-3 PIC  S9(13)V9(2).          GENERATQ
                                                                        CCGSORT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED FD FOR SORTFL2 SORT FILE.               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       SD  SORTFL2                                                      CCGSORT
           DATA RECORD IS SORTFL2-RECORD.                               CCGSORT
       01  SORTFL2-RECORD.                                              CCGSORT
           02 S2-CRITERIA             COMP-3 PIC  S9(5).                GENERATQ
           02 S2-W-BANK               COMP-3 PIC  S9(2).                GENERATQ
           02 S2-W-ASSIGNMENT         COMP-3 PIC  S9(5).                GENERATQ
           02 S2-WORK-TYPE             PIC  X(5).                       GENERATQ
           02 S2-ACCR-DATE            COMP-3 PIC  S9(6).                GENERATQ
           02 S2-W-AMOUNT             COMP-3 PIC  S9(13)V9(2).          GENERATQ
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
       01  WS-PENGI-INDECIES.                                           EASYT007
           02 SEG-NDX                PIC S9(09) COMP VALUE ZEROS.       EASYT007
           02 VI-SEG-NDX             PIC S9(09) COMP VALUE ZEROS.       EASYT007
           02 RKBKT-NDX              PIC S9(09) COMP VALUE ZEROS.       EASYT007
           02 ITR-SEG-NDX            PIC S9(09) COMP VALUE ZEROS.       EASYT007
           02 TVI-SEG-NDX            PIC S9(09) COMP VALUE ZEROS.       EASYT007
                                                                        EASYT007
       01  SMYFIL-QAREA1.                                               EASYT007
           02 G01-SAV-CRITERIA       PIC 9(5).                          EASYT007
           02 G01-SAV-T-BANK         PIC 9(2).                          EASYT007
           02 G01-SAV-W-ASSIGNMENT   PIC 9(5).                          EASYT007
           02 G01-SAV-WORK-TYPE      PIC X(5).                          EASYT007
           02 G01-SAV-ACCR-DATE      PIC 9(6).                          EASYT007
           02 G01-LV6-PENGI-COUNT COMP-3 PIC S9(18).                    EASYT007
           02 G01-LV6-W-AMOUNT           PIC S9(17)V9(2) COMP-3.        EASYT007
                                                                        EASYT007
       01  SMYFIL2-QAREA2.                                              EASYT007
           02 G02-SAV-CRITERIA       PIC 9(5).                          EASYT007
           02 G02-SAV-W-BANK         PIC 9(2).                          EASYT007
           02 G02-SAV-W-ASSIGNMENT   PIC 9(5).                          EASYT007
           02 G02-SAV-WORK-TYPE      PIC X(5).                          EASYT007
           02 G02-SAV-ACCR-DATE      PIC 9(6).                          EASYT007
           02 G02-LV6-PENGI-COUNT COMP-3 PIC S9(18).                    EASYT007
           02 G02-LV6-W-AMOUNT           PIC S9(17)V9(2) COMP-3.        EASYT007
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
           02 M8104D-EZSTATUS       COMP PIC S9(09).                    DEFINE
           02 M8124D-EZSTATUS       COMP PIC S9(09).                    DEFINE
           02 M8134D-EZSTATUS       COMP PIC S9(09).                    DEFINE
           02 M8234D-EZSTATUS       COMP PIC S9(09).                    DEFINE
           02 ACH-EZSTATUS          COMP PIC S9(09).                    DEFINE
           02 ME7231-EZSTATUS       COMP PIC S9(09).                    DEFINE
           02 ME7232-EZSTATUS       COMP PIC S9(09).                    DEFINE
           02 SMYFIL-EZSTATUS       COMP PIC S9(09).                    DEFINE
           02 SMYFIL2-EZSTATUS      COMP PIC S9(09).                    DEFINE
           02 GLCODES-EZSTATUS      COMP PIC S9(09).                    DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR PENGI-STATUS-TAB IS 246
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
           02 WS-JOB2-REPORT-SKIP   COMP PIC S9(4) VALUE 0.             DEFINE
           02 WS-JOB2-REPORT-LEVL   COMP PIC S9(4) VALUE 0.             DEFINE
           02 WS-JOB2-ABEND          PIC X(1) VALUE 'N'.                DEFINE
           02 WS-JOB2-FLAG           PIC 9(1) VALUE 0.                  DEFINE
              88 JOB2-PENDING         VALUE 0.                          DEFINE
              88 JOB2-REQUEST-STOP    VALUE 2 3.                        DEFINE
              88 JOB2-STOP-JOB        VALUE 2.                          DEFINE
              88 JOB2-STOP-RUN        VALUE 3.                          DEFINE
              88 JOB2-SPECIAL-PROC    VALUE 4 5.                        DEFINE
              88 JOB2-START-PROC      VALUE 4.                          DEFINE
              88 JOB2-FINISH-PROC     VALUE 5.                          DEFINE
           02 WS-JOB2-SORTED         PIC X(1) VALUE 'N'.                DEFINE
           02 WS-ALF-VALUE-5-3-0     PIC X(5).                          DEFINE
           02 WS-GRP-VALUE-5-3-0 REDEFINES WS-ALF-VALUE-5-3-0.          DEFINE
              03 FILLER                 PIC X(2).                       DEFINE
              03 WS-NUM-VALUE-5-3-0     PIC 9(3).                       DEFINE
           02 WS-GPROG-LNSDATE-1     PIC X(08) VALUE 'LNSDATE'.         DEFINE
           02 WS-JOB2-REPORT2-SW     PIC X VALUE SPACE.                 DEFINE
           02 WS-JOB3-REPORT-SKIP   COMP PIC S9(4) VALUE 0.             DEFINE
           02 WS-JOB3-REPORT-LEVL   COMP PIC S9(4) VALUE 0.             DEFINE
           02 WS-JOB3-ABEND          PIC X(1) VALUE 'N'.                DEFINE
           02 WS-JOB3-FLAG           PIC 9(1) VALUE 0.                  DEFINE
              88 JOB3-PENDING         VALUE 0.                          DEFINE
              88 JOB3-REQUEST-STOP    VALUE 2 3.                        DEFINE
              88 JOB3-STOP-JOB        VALUE 2.                          DEFINE
              88 JOB3-STOP-RUN        VALUE 3.                          DEFINE
              88 JOB3-SPECIAL-PROC    VALUE 4 5.                        DEFINE
              88 JOB3-START-PROC      VALUE 4.                          DEFINE
              88 JOB3-FINISH-PROC     VALUE 5.                          DEFINE
           02 WS-JOB3-SORTED         PIC X(1) VALUE 'N'.                DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR WORK-AREA1 IS 607
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR WORK-AREA2.               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  WORK-AREA2.                                                  DEFINE
           02 G00-SPACES             PIC X(01).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR WORK-AREA2 IS 1
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR WORK-GAREA0.              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  WORK-GAREA0.                                                 DEFINE
           02 NS-OCCRS               PIC 9(3) VALUE 0.                  DEFINE
           02 RK-OCCRS               PIC 9(3) VALUE 0.                  DEFINE
           02 VI-OCCRS               PIC 9(3) VALUE 0.                  DEFINE
           02 TVI-OCCRS              PIC 9(3) VALUE 0.                  DEFINE
           02 ITR-OCCRS              PIC 9(3) VALUE 0.                  DEFINE
           02 SEGMENT-RECORD.                                           DEFINE
              03 SEGMENT-FOR-CODE      COMP-3 PIC S9(3) VALUE +0.       DEFINE
              03 ACTIVE-ENTRIES        COMP-3 PIC S9(3) VALUE +0.       DEFINE
              03 FILLER                 PIC X(600) VALUE SPACES.        DEFINE
           02 KEY-CS-KEY.                                               DEFINE
              03 KEY-CS-006-CODE        PIC 9(3).                       DEFINE
              03 KEY-CSH-BAN-NUM        PIC 9(2).                       DEFINE
              03 KEY-CSH-APP-CODE       PIC 9(1).                       DEFINE
              03 KEY-CSW-REP-NUM        PIC X(8).                       DEFINE
              03 FILLER                 PIC X(16).                      DEFINE
           02 FILLER REDEFINES KEY-CS-KEY.                              DEFINE
              03 FILLER                 PIC X(12).                      DEFINE
              03 KEY-CSH-SEQ-NUM        PIC 9(2).                       DEFINE
              03 FILLER                 PIC X(16).                      DEFINE
           02 KEY-M-KEY.                                                DEFINE
              03 KEY-M-005-NUMBER       PIC 9(2).                       DEFINE
              03 KEY-M-010-NUMBER       PIC 9(10).                      DEFINE
              03 KEY-M-012-CODE         PIC 9(1).                       DEFINE
              03 KEY-M-015-NUMBER      COMP-3 PIC S9(11).               DEFINE
              03 KEY-M-025-CODE         PIC 9(3).                       DEFINE
              03 FILLER REDEFINES KEY-M-025-CODE.                       DEFINE
                 04 KEY-M-025-1            PIC 9(1).                    DEFINE
                 04 FILLER                 PIC X(2).                    DEFINE
           02 KEY-V-KEY.                                                DEFINE
              03 KEY-V-005-NUMBER       PIC 9(2).                       DEFINE
              03 KEY-V-010-NUMBER       PIC 9(10).                      DEFINE
              03 KEY-V-013-NUMBER       PIC 9(10).                      DEFINE
              03 KEY-V-025-CODE         PIC 9(5).                       DEFINE
           02 KEY-V-INV-NUM.                                            DEFINE
              03 KEY-V-YEAR             PIC 9(2).                       DEFINE
              03 KEY-V-APP-CODE         PIC 9(1).                       DEFINE
              03 KEY-V-SEQ-NUM          PIC 9(7).                       DEFINE
           02 START-OBL-NUMBER      COMP-3 PIC S9(11) VALUE +0.         DEFINE
           02 UNPACK-OBL-NUM         PIC 9(10) VALUE 0.                 DEFINE
           02 PACK-OBL-NUMBER       COMP-3 PIC S9(11) VALUE +0.         DEFINE
           02 HOLD-RECORD-CODE       PIC 9(3) VALUE 0.                  DEFINE
           02 HOLD-DIS-CODE          PIC 9(1) VALUE 0.                  DEFINE
           02 HOLD-M-KEY             PIC X(22) VALUE ' '.               DEFINE
           02 HOLD-INT-RATE          PIC S9(2)V9(2) VALUE +0.           DEFINE
           02 HOLD-NS-OCCRS          PIC 9(3) VALUE 0.                  DEFINE
           02 HOLD-PRO-TYPE-X.                                          DEFINE
              03 HOLD-PRO-TYPE          PIC 9(4) VALUE 0.               DEFINE
              03 FILLER REDEFINES HOLD-PRO-TYPE.                        DEFINE
                 04 PROCESS-TYP-LEV        PIC 9(2).                    DEFINE
                 04 PROCESS-TYPE-LOW       PIC 9(2).                    DEFINE
                 04 FILLER REDEFINES PROCESS-TYPE-LOW.                  DEFINE
                    05 PROCESS-TYPE-3         PIC 9(1).                 DEFINE
                    05 FILLER                 PIC X(1).                 DEFINE
           02 COMMITMENT-AMT         PIC S9(13)V9(2) VALUE +0.          DEFINE
           02 COMMITMENT-AMT-9U REDEFINES COMMITMENT-AMT                DEFINE
                                     PIC 9(13)V9(2).                    DEFINE
           02 PRI-BALANCE            PIC S9(13)V9(2) VALUE +0.          DEFINE
           02 PRI-BALANCE-9U REDEFINES PRI-BALANCE                      DEFINE
                                     PIC 9(13)V9(2).                    DEFINE
           02 INTEREST-OWING         PIC S9(11)V9(2) VALUE +0.          DEFINE
           02 INTEREST-OWING-9U REDEFINES INTEREST-OWING                DEFINE
                                     PIC 9(11)V9(2).                    DEFINE
           02 FEES-OWING             PIC S9(11)V9(2) VALUE +0.          DEFINE
           02 FEES-OWING-9U REDEFINES FEES-OWING                        DEFINE
                                     PIC 9(11)V9(2).                    DEFINE
           02 OBLIGAT-HST-TOT        PIC S9(11)V9(2) VALUE +0.          DEFINE
           02 W-ORIGINAL             PIC S9(13)V9(2) VALUE +0.          DEFINE
           02 W-ORIGINAL-9U REDEFINES W-ORIGINAL                        DEFINE
                                     PIC 9(13)V9(2).                    DEFINE
           02 W-PRINCIPAL            PIC S9(13)V9(2) VALUE +0.          DEFINE
           02 W-PRINCIPAL-9U REDEFINES W-PRINCIPAL                      DEFINE
                                     PIC 9(13)V9(2).                    DEFINE
           02 W-INTEREST             PIC S9(13)V9(2) VALUE +0.          DEFINE
           02 W-INTEREST-9U REDEFINES W-INTEREST                        DEFINE
                                     PIC 9(13)V9(2).                    DEFINE
           02 W-INTEREST-FEE         PIC S9(13)V9(2) VALUE +0.          DEFINE
           02 W-INTEREST-FEE-9U REDEFINES W-INTEREST-FEE                DEFINE
                                     PIC 9(13)V9(2).                    DEFINE
           02 W-SHORT-NAME           PIC X(15) VALUE SPACES.            DEFINE
           02 W-BANK                 PIC 9(2) VALUE 00.                 DEFINE
           02 W-OBLIGOR              PIC 9(10) VALUE 0.                 DEFINE
           02 W-OBLIGAT              PIC 9(10) VALUE 0.                 DEFINE
           02 W-SERVICE              PIC 9(5) VALUE 0.                  DEFINE
           02 W-ASSIGNMENT           PIC 9(5) VALUE 0.                  DEFINE
           02 W-CONTACT              PIC X(5) VALUE SPACES.             DEFINE
           02 W-REGION               PIC 9(3) VALUE 0.                  DEFINE
           02 W-DIVISION             PIC 9(3) VALUE 0.                  DEFINE
           02 W-INTEREST-RATE        PIC S9(2)V9(2) VALUE +0.           DEFINE
           02 W-INTEREST-RATE-9U REDEFINES W-INTEREST-RATE              DEFINE
                                     PIC 9(2)V9(2).                     DEFINE
           02 W-SECURED-CODE         PIC 9(1) VALUE 0.                  DEFINE
           02 W-BANK-NAME            PIC X(50) VALUE ' '.               DEFINE
           02 W-REPORT-DATA.                                            DEFINE
              03 DELQ-CATEGORY1         PIC 9(3) VALUE 0.               DEFINE
              03 DELQ-CATEGORY2         PIC 9(3) VALUE 0.               DEFINE
              03 DELQ-CATEGORY3         PIC 9(3) VALUE 0.               DEFINE
              03 DELQ-CATEGORY4         PIC 9(3) VALUE 0.               DEFINE
              03 FILLER                 PIC X(288) VALUE SPACES.        DEFINE
           02 W-ACCRUAL-DATE-X.                                         DEFINE
              03 W-ACCRUAL-DATE         PIC 9(6) VALUE 0.               DEFINE
              03 FILLER REDEFINES W-ACCRUAL-DATE.                       DEFINE
                 04 ACCRUAL-YEAR           PIC 9(2).                    DEFINE
                 04 ACCRUAL-MONTH          PIC 9(2).                    DEFINE
                 04 DAYS-IN-MONTH          PIC 9(2).                    DEFINE
           02 W-LAS-DAILY-TRAN-X.                                       DEFINE
              03 W-LAS-DAILY-TRAN       PIC 9(6) VALUE 0.               DEFINE
              03 FILLER REDEFINES W-LAS-DAILY-TRAN.                     DEFINE
                 04 W-LAST-TRAN-YY         PIC 9(2).                    DEFINE
                 04 W-LAST-TRAN-DD         PIC 9(2).                    DEFINE
                 04 FILLER                 PIC X(2).                    DEFINE
           02 W-ZER-BAL-PROC-D-X.                                       DEFINE
              03 W-ZER-BAL-PROC-D       PIC 9(6) VALUE 0.               DEFINE
              03 FILLER REDEFINES W-ZER-BAL-PROC-D.                     DEFINE
                 04 W-ZERO-BAL-YY          PIC 9(2).                    DEFINE
                 04 W-ZERO-BAL-MM          PIC 9(2).                    DEFINE
                 04 W-ZERO-BAL-DD          PIC 9(2).                    DEFINE
           02 W-TIE-TYPE             PIC X(9) VALUE ' '.                DEFINE
           02 W-STATUS-CODE          PIC X(1) VALUE ' '.                DEFINE
           02 W-AMOUNT               PIC S9(13)V9(2) VALUE +0.          DEFINE
           02 W-AMOUNT-9U REDEFINES W-AMOUNT                            DEFINE
                                     PIC 9(13)V9(2).                    DEFINE
           02 W-LOAN-LOSS            PIC S9(13)V9(2) VALUE +0.          DEFINE
           02 W-LOAN-LOSS-9U REDEFINES W-LOAN-LOSS                      DEFINE
                                     PIC 9(13)V9(2).                    DEFINE
           02 W-GL-CODE              PIC 9(7) VALUE 0.                  DEFINE
           02 W-GL-ACCOUNT           PIC 9(5) VALUE 0.                  DEFINE
           02 CRITERIA               PIC 9(5) VALUE 00000.              DEFINE
           02 REFERENCE-TYPE         PIC X(37) VALUE ' '.               DEFINE
           02 PRIMARY-REF-OBL        PIC 9(10) VALUE 0.                 DEFINE
           02 REF-OBLIGOR            PIC 9(10) VALUE 0.                 DEFINE
           02 REF-OBLIGAT            PIC 9(10) VALUE 0.                 DEFINE
           02 REFERENCE-ITEM         PIC 9(5) VALUE 0.                  DEFINE
           02 W-SW                   PIC 9(1) VALUE 0.                  DEFINE
           02 PROC-DATE              PIC 9(6) VALUE 0.                  DEFINE
           02 ACCR-DATE              PIC 9(6) VALUE 0.                  DEFINE
           02 ACCRUAL-DATE           PIC 9(6) VALUE 0.                  DEFINE
           02 W-MAT-DATE             PIC 9(6) VALUE 0.                  DEFINE
           02 W-ORIG-DATE            PIC 9(6) VALUE 0.                  DEFINE
           02 EXTRACT-SW             PIC X(1) VALUE 'N'.                DEFINE
           02 DELQ-LEVEL             PIC 9(1) VALUE 0.                  DEFINE
           02 DELINQ-SW              PIC X(1) VALUE ' '.                DEFINE
           02 TABLE-SW               PIC X(1) VALUE ' '.                DEFINE
           02 NRF-OBLIGATION         PIC X(1) VALUE ' '.                DEFINE
           02 ZERO-SW                PIC X(1) VALUE 'Y'.                DEFINE
           02 CURRENT-MAX-OCCR       PIC 9(3) VALUE 0.                  DEFINE
           02 W-COUNT                PIC S9(8) VALUE +0.                DEFINE
           02 CHARGE-CODE            PIC 9(3) VALUE 0.                  DEFINE
           02 BILLED-AMOUNT          PIC S9(13)V9(2) VALUE +0.          DEFINE
           02 BILLED-AMOUNT-9U REDEFINES BILLED-AMOUNT                  DEFINE
                                     PIC 9(13)V9(2).                    DEFINE
           02 PAST-DUE-AMOUNT        PIC S9(13)V9(2) VALUE +0.          DEFINE
           02 PAST-DUE-AMOUNT-9U REDEFINES PAST-DUE-AMOUNT              DEFINE
                                     PIC 9(13)V9(2).                    DEFINE
           02 REPORT-PAST-DUE        PIC S9(13)V9(2) VALUE +0.          DEFINE
           02 REPORT-PAST-DUE-9U REDEFINES REPORT-PAST-DUE              DEFINE
                                     PIC 9(13)V9(2).                    DEFINE
           02 TEST-AMOUNT            PIC S9(13)V9(2) VALUE +0.          DEFINE
           02 TEST-AMOUNT-9U REDEFINES TEST-AMOUNT                      DEFINE
                                     PIC 9(13)V9(2).                    DEFINE
           02 LEAPS                  PIC S9(2) VALUE +0.                DEFINE
           02 LEAPS-9U REDEFINES LEAPS                                  DEFINE
                                     PIC 9(2).                          DEFINE
           02 DIFF                   PIC S9(3) VALUE +0.                DEFINE
           02 DIFF-9U REDEFINES DIFF                                    DEFINE
                                     PIC 9(3).                          DEFINE
           02 START-JULIAN-X.                                           DEFINE
              03 START-JULIAN           PIC S9(5) VALUE +0.             DEFINE
              03 FILLER REDEFINES START-JULIAN.                         DEFINE
                 04 START-YY               PIC 9(2).                    DEFINE
                 04 START-JJJ              PIC 9(3).                    DEFINE
           02 END-JULIAN-X.                                             DEFINE
              03 END-JULIAN             PIC S9(5) VALUE +0.             DEFINE
              03 END-JULIAN-9U REDEFINES END-JULIAN                     DEFINE
                                        PIC 9(5).                       DEFINE
              03 FILLER REDEFINES END-JULIAN.                           DEFINE
                 04 END-YY                 PIC 9(2).                    DEFINE
                 04 END-JJJ                PIC 9(3).                    DEFINE
           02 DATE-IN-X.                                                DEFINE
              03 DATE-IN                PIC 9(6) VALUE 0.               DEFINE
              03 FILLER REDEFINES DATE-IN.                              DEFINE
                 04 YY-IN                  PIC 9(2).                    DEFINE
                 04 MM-IN                  PIC 9(2).                    DEFINE
                 04 DD-IN                  PIC 9(2).                    DEFINE
           02 DATE-INA-X.                                               DEFINE
              03 DATE-INA               PIC 9(6) VALUE 0.               DEFINE
              03 FILLER REDEFINES DATE-INA.                             DEFINE
                 04 YY-INA                 PIC 9(2).                    DEFINE
                 04 MM-INA                 PIC 9(2).                    DEFINE
                 04 DD-INA                 PIC 9(2).                    DEFINE
           02 DATE-INB-X.                                               DEFINE
              03 DATE-INB               PIC 9(6) VALUE 0.               DEFINE
              03 FILLER REDEFINES DATE-INB.                             DEFINE
                 04 YY-INB                 PIC 9(2).                    DEFINE
                 04 MM-INB                 PIC 9(2).                    DEFINE
                 04 DD-INB                 PIC 9(2).                    DEFINE
           02 DATE-INC-X.                                               DEFINE
              03 DATE-INC               PIC 9(6) VALUE 0.               DEFINE
              03 FILLER REDEFINES DATE-INC.                             DEFINE
                 04 YY-INC                 PIC 9(2).                    DEFINE
                 04 MM-INC                 PIC 9(2).                    DEFINE
                 04 DD-INC                 PIC 9(2).                    DEFINE
           02 WORK-DATEA             PIC 9(6) VALUE 0.                  DEFINE
           02 WORK-DATEB             PIC 9(6) VALUE 0.                  DEFINE
           02 DATE-IN2-X.                                               DEFINE
              03 DATE-IN2               PIC 9(6) VALUE 0.               DEFINE
              03 FILLER REDEFINES DATE-IN2.                             DEFINE
                 04 YY-IN2                 PIC 9(2).                    DEFINE
                 04 MM-IN2                 PIC 9(2).                    DEFINE
                 04 DD-IN2                 PIC 9(2).                    DEFINE
           02 DATE-OUT-X.                                               DEFINE
              03 DATE-OUT               PIC 9(6) VALUE 0.               DEFINE
              03 FILLER REDEFINES DATE-OUT.                             DEFINE
                 04 MM-OUT                 PIC 9(2).                    DEFINE
                 04 DD-OUT                 PIC 9(2).                    DEFINE
                 04 YY-OUT                 PIC 9(2).                    DEFINE
           02 DATE-RPT.                                                 DEFINE
              03 MM-RPT                 PIC 9(2) VALUE 0.               DEFINE
              03 ES1-RPT                PIC X(1) VALUE '/'.             DEFINE
              03 DD-RPT                 PIC 9(2) VALUE 0.               DEFINE
              03 ES2-RPT                PIC X(1) VALUE '/'.             DEFINE
              03 YY-RPT                 PIC 9(2) VALUE 0.               DEFINE
           02 SYS-DATE-IN.                                              DEFINE
              03 MM-SYS-IN              PIC 9(2) VALUE 0.               DEFINE
              03 FILLER REDEFINES MM-SYS-IN.                            DEFINE
                 04 MM-SYS-IN-A            PIC X(1).                    DEFINE
                 04 MM-SYS-IN-N REDEFINES MM-SYS-IN-A                   DEFINE
                                           PIC 9(1).                    DEFINE
                 04 FILLER                 PIC X(1).                    DEFINE
              03 ES1-SYS-IN             PIC X(1) VALUE '/'.             DEFINE
              03 DD-SYS-IN              PIC 9(2) VALUE 0.               DEFINE
              03 ES2-SYS-IN             PIC X(1) VALUE '/'.             DEFINE
              03 YY-SYS-IN              PIC 9(2) VALUE 0.               DEFINE
           02 BUS-DATE.                                                 DEFINE
              03 BUS-CC                 PIC 9(2) VALUE 0.               DEFINE
              03 BUS-YY                 PIC 9(2) VALUE 0.               DEFINE
              03 BUS-MM                 PIC 9(2) VALUE 0.               DEFINE
           02 WORK-TYPE.                                                DEFINE
              03 RATE-CODE              PIC X(1) VALUE SPACES.          DEFINE
              03 OBLIGATION-TYPE        PIC 9(3) VALUE 0.               DEFINE
              03 WORK-FILLER            PIC X(1) VALUE SPACES.          DEFINE
           02 DESCRIPTION.                                              DEFINE
              03 REAL-GL-CODE           PIC 9(5) VALUE 0.               DEFINE
           02 JULIAN                 PIC 9(5) VALUE 0.                  DEFINE
           02 GREGORIAN              PIC 9(6) VALUE 0.                  DEFINE
           02 REQUEST-SW             PIC 9(1) VALUE 0.                  DEFINE
           02 ERROR-SW               PIC 9(1) VALUE 0.                  DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR WORK-GAREA0 IS 1675
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR WORK-GAREA1.              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  WORK-GAREA1.                                                 DEFINE
           02 PE-INT-HEADER.                                            DEFINE
              03 PE002-INT-C           COMP-3 PIC S9(3) VALUE +0.       DEFINE
              03 FILLER                 PIC X(2) VALUE SPACES.          DEFINE
              03 PE010-INT-CD           PIC 9(3) VALUE 0.               DEFINE
              03 FILLER                 PIC X(4) VALUE SPACES.          DEFINE
              03 PE045-INT-ITEM         PIC 9(1) VALUE 0.               DEFINE
              03 FILLER                 PIC X(152) VALUE SPACES.        DEFINE
              03 PE600-INT-ITD         COMP-3 PIC S9(13)V9(2) VALUE +0. DEFINE
              03 FILLER                 PIC X(8) VALUE SPACES.          DEFINE
              03 PE604-INT-MTD         COMP-3 PIC S9(13)V9(2) VALUE +0. DEFINE
              03 PE606-INT-BTD         COMP-3 PIC S9(13)V9(2) VALUE +0. DEFINE
              03 FILLER                 PIC X(40) VALUE SPACES.         DEFINE
              03 PE630-INT-ITD         COMP-3 PIC S9(13)V9(2) VALUE +0. DEFINE
              03 FILLER                 PIC X(128) VALUE SPACES.        DEFINE
              03 PE730-INT-RECVD       COMP-3 PIC S9(13)V9(2) VALUE +0. DEFINE
              03 FILLER                 PIC X(224) VALUE SPACES.        DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR WORK-GAREA1 IS 604
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR WORK-GAREA2.              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  WORK-GAREA2.                                                 DEFINE
           02 RK-PRI-SCHEDULES.                                         DEFINE
              03 RK002-PRI-C           COMP-3 PIC S9(3) VALUE +0.       DEFINE
              03 RK004-PRI-ENTRIE      COMP-3 PIC S9(3) VALUE +0.       DEFINE
              03 FILLER OCCURS 10 TIMES INDEXED BY RKBKT-NDX-003.       DEFINE
                 04 RK-BUCKET.                                          DEFINE
                    05 CURRENT-PRI-SCH.                                 DEFINE
                       06 RK010-PRI-CODE         PIC 9(3) VALUE 0.      DEFINE
                       06 RK020-PRI-DATE        COMP-3 PIC S9(7) VALUE  DEFINE
                       +0.                                              DEFINE
                       06 RK030-PRI-DATE        COMP-3 PIC S9(7) VALUE  DEFINE
                       +0.                                              DEFINE
                       06 RK040-PRI-NUMBER      COMP-3 PIC S9(5) VALUE  DEFINE
                       +0.                                              DEFINE
                       06 FILLER                 PIC X(46) VALUE SPACES.DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR WORK-GAREA2 IS 604
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR WORK-GAREA3.              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  WORK-GAREA3.                                                 DEFINE
           02 TRAN-WORK.                                                DEFINE
              03 T-BANK                 PIC 9(2) VALUE 0.               DEFINE
              03 T-APPLICATION          PIC 9(1) VALUE 1.               DEFINE
              03 T-BATCH                PIC X(3) VALUE SPACES.          DEFINE
              03 T-SEQ                  PIC 9(4) VALUE 0.               DEFINE
              03 T-OBLIGOR              PIC 9(10) VALUE 0.              DEFINE
              03 T-OBLIGATION           PIC 9(10) VALUE 0.              DEFINE
              03 FILLER                 PIC X(50) VALUE SPACES.         DEFINE
           02 FILLER REDEFINES TRAN-WORK.                               DEFINE
              03 FILLER                 PIC X(25).                      DEFINE
              03 T-ITEM                 PIC X(5).                       DEFINE
              03 T-TRAN-CODE            PIC 9(4).                       DEFINE
              03 T-RECORD-CODE          PIC X(3).                       DEFINE
              03 T-DBID.                                                DEFINE
                 04 T-DBID-1               PIC X(1).                    DEFINE
                 04 FILLER                 PIC X(4).                    DEFINE
              03 T-SEGMENT              PIC 9(1).                       DEFINE
              03 T-BUCKET               PIC 9(2).                       DEFINE
              03 T-SIGN                 PIC X(1).                       DEFINE
              03 T-VALUE.                                               DEFINE
                 04 FILLER                 PIC X(14).                   DEFINE
                 04 T-INVOICE              PIC 9(10).                   DEFINE
                 04 FILLER                 PIC X(2).                    DEFINE
              03 T-SECURITY             PIC 9(2).                       DEFINE
              03 T-AUTH-DBID            PIC 9(1).                       DEFINE
              03 T-AUTH-VALUE           PIC 9(5).                       DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR WORK-GAREA3 IS 80
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR WORK-GAREA4.              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  WORK-GAREA4.                                                 DEFINE
           02 LNE-HEADER.                                               DEFINE
              03 LNE-BANK-LIT           PIC X(7) VALUE 'BANK'.          DEFINE
              03 LNE-BANK-NUMBER        PIC 9(2) VALUE 0.               DEFINE
              03 LNE-SPACE              PIC X(3) VALUE ' '.             DEFINE
              03 LNE-DATE               PIC X(11) VALUE SPACES.         DEFINE
              03 LNE-REPORT-LIT         PIC X(12) VALUE 'REPORT ID - '. DEFINE
              03 LNE-REP-NUMBER         PIC X(9) VALUE 'LNE999   '.     DEFINE
              03 LNE-REPORT-NAME        PIC X(75) VALUE                 DEFINE
              '             WYZ FINANCIAL CORP'.                        DEFINE
              03 LNE-PAGE-LIT           PIC X(13) VALUE 'PAGE'.         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR WORK-GAREA4 IS 132
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR WORK-GAREA5.              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  WORK-GAREA5.                                                 DEFINE
           02 INVOICE-TABLE.                                            DEFINE
              03 FILLER OCCURS 100 TIMES INDEXED BY ITR-SEG-NDX-004.    DEFINE
                 04 INVOICE-TAB-REC.                                    DEFINE
                    05 TVI070-INV-DATE       COMP-3 PIC S9(7) VALUE +0. DEFINE
                    05 TVI072-INV-DATE       COMP-3 PIC S9(7) VALUE +0. DEFINE
                    05 TVI-INVOICE-DATA.                                DEFINE
                       06 FILLER OCCURS 3 TIMES INDEXED BY              DEFINE
                       TVI-SEG-NDX-005.                                 DEFINE
                          07 TVI-SEGMENT.                               DEFINE
                             08 CURRENT-TVI-SEG.                        DEFINE
                                09 TVI200-CHA-CODE        PIC 9(3)      DEFINE
                                VALUE 0.                                DEFINE
                                09 TVI210-INV-C          COMP-3 PIC     DEFINE
                                S9(13)V9(2) VALUE +0.                   DEFINE
                                09 TVI220-INV-PERIO      COMP-3 PIC     DEFINE
                                S9(13)V9(2) VALUE +0.                   DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR WORK-GAREA5 IS 6500
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR GLCODES-QAREA.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  GLCODES-QAREA.                                               DEFINE
           02 ARG                    PIC 9(7).                          DEFINE
           02 DESC                   PIC X(5).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR GLCODES-QAREA IS 12
                                                                        DEFTABLE
       01  GLCODES-QAREA-DATA.                                          DEFTABLE
      *, GLCODES-QAREA DATA LEVEL 1 FOLLOWS.
           02 FILLER        PIC 9(7)      VALUE 0011200.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11200'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0016110.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '16110'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0017661.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '17661'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0028237.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '28237'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0110005.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0110006.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0110203.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0110303.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0110403.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0110404.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0110503.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0110603.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0110703.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0110704.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0110802.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0110803.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0112204.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0112205.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0112207.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0112303.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0112332.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0112402.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0112403.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0112501.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0112601.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0210005.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0210006.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0210203.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0210303.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0210403.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0210503.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0210603.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0210703.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0210704.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0210802.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0210803.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0212204.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0212205.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0212304.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0212332.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0212364.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0212402.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0212403.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0212501.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0212502.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0212601.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0212703.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12821'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0310005.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0310006.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0310203.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0310303.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0310403.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0310404.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0310503.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0310603.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0310703.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0310704.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0310802.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0310803.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0312204.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0312205.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0312332.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0312364.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0312402.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0312403.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0312501.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0312601.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '12831'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410005.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11091'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410006.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11093'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410203.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11095'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410303.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11097'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410403.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11091'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410404.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11093'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410503.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11095'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410603.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11097'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410734.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11091'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410735.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11093'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410736.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11095'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410737.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11097'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410739.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '20261'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410803.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11091'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410835.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11093'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410836.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11095'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0410837.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11097'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0412204.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11341'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0412205.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11341'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0412239.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '20261'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0412304.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11341'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0412332.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11341'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0412338.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '20260'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0412364.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11341'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0412402.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11341'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0412403.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11341'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0412501.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11341'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0412601.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '11341'.                DEFTABLE
                                                                        DEFTABLE
           02 FILLER        PIC 9(7)      VALUE 0412703.                DEFTABLE
           02 FILLER        PIC X(5)      VALUE '20260'.                DEFTABLE
                                                                        DEFTABLE
       01  GLCODES-QAREA-TABLE REDEFINES GLCODES-QAREA-DATA.            DEFTABLE
           03 GLCODES-QAREA-GPFIELDS OCCURS 96 TIMES                    DEFTABLE
                     ASCENDING KEY IS                                   DEFTABLE
                             WT1-ARG                                    DEFTABLE
                     INDEXED BY GLCODES-INDEX0.                         DEFTABLE
              04 GLCODES-QAREA-TBFIELDS.                                DEFTABLE
                 05 WT1-ARG                         PIC 9(7).           DEFTABLE
                 05 WT1-DESC                        PIC X(5).           DEFTABLE
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0001.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0001.                                                    DEFINE
           02 DLN-0001-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(44) VALUE                   DEFINE
              ' UNSUCCESSFUL POINT FOR THIS CONTROL RECORD '.           DEFINE
              03 DLN-0001-KEY-CS-KEY PIC X(30).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0001 IS 74
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0002.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0002.                                                    DEFINE
           02 DLN-0002-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(08) VALUE ' TRAN = '.       DEFINE
              03 DLN-0002-TRAN-WORK PIC X(80).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0002 IS 88
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0003.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0003.                                                    DEFINE
           02 DLN-0003-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(47) VALUE                   DEFINE
              ' UNSUCCESSFUL POINT FOR THIS INVOICE    RECORD '.        DEFINE
              03 FILLER               PIC X(08) VALUE '  KEY = '.       DEFINE
              03 DLN-0003-KEY-V-KEY PIC X(27).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0003 IS 82
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0004.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0004.                                                    DEFINE
           02 DLN-0004-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(16) VALUE '      T-WORK    'DEFINE
              .                                                         DEFINE
              03 DLN-0004-TRAN-WORK PIC X(80).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0004 IS 96
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0005.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0005.                                                    DEFINE
           02 DLN-0005-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(47) VALUE                   DEFINE
              ' UNSUCCESSFUL READ  FOR THIS INVOICE    RECORD '.        DEFINE
              03 FILLER               PIC X(10) VALUE '    KEY = '.     DEFINE
              03 DLN-0005-KEY-V-KEY PIC X(27).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0005 IS 84
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0006.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0006.                                                    DEFINE
           02 DLN-0006-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(16) VALUE '      T-WORK    'DEFINE
              .                                                         DEFINE
              03 DLN-0006-TRAN-WORK PIC X(80).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0006 IS 96
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0007.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0007.                                                    DEFINE
           02 DLN-0007-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(27) VALUE                   DEFINE
              'INVOICE NUMBER NOT NUMERIC '.                            DEFINE
              03 DLN-0007-TRAN-WORK PIC X(80).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0007 IS 107
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0008.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0008.                                                    DEFINE
           02 DLN-0008-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(25) VALUE                   DEFINE
              '  INVOICE NOT FOUND      '.                              DEFINE
              03 DLN-0008-TRAN-WORK PIC X(80).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0008 IS 105
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0009.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0009.                                                    DEFINE
           02 DLN-0009-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(24) VALUE                   DEFINE
              ' T-OBLIGOR NOT NUMERIC  '.                               DEFINE
              03 DLN-0009-TRAN-WORK PIC X(80).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0009 IS 104
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0010.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0010.                                                    DEFINE
           02 DLN-0010-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(39) VALUE                   DEFINE
              ' END OF FILE OBLIGATION        OBLIGOR '.                DEFINE
              03 DLN-0010-T-OBLIGOR PIC 9(10).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0010 IS 49
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0011.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0011.                                                    DEFINE
           02 DLN-0011-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(10) VALUE '    KEY = '.     DEFINE
              03 DLN-0011-KEY-M-KEY PIC X(22).                          DEFINE
              03 FILLER               PIC X(11) VALUE '  STATUS = '.    DEFINE
              03 DLN-0011-M8124D-EZSTATUS PIC Z,ZZZ,ZZZ,ZZZ-.           DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0011 IS 57
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0012.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0012.                                                    DEFINE
           02 DLN-0012-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(22) VALUE                   DEFINE
              '               TRAN = '.                                 DEFINE
              03 DLN-0012-TRAN-WORK PIC X(80).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0012 IS 102
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0013.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0013.                                                    DEFINE
           02 DLN-0013-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(09) VALUE 'NO MATCH '.      DEFINE
              03 DLN-0013-W-BANK    PIC 9(2).                           DEFINE
              03 FILLER               PIC X(01) VALUE ' '.              DEFINE
              03 DLN-0013-W-OBLIGOR PIC 999B999B999B9.                  DEFINE
              03 DLN-0013-W-OBLIGOR-S                                   DEFINE
                       REDEFINES DLN-0013-W-OBLIGOR                     DEFINE
                       PIC X(13).                                       DEFINE
              03 FILLER               PIC X(01) VALUE ' '.              DEFINE
              03 DLN-0013-W-OBLIGAT PIC 99999B9999B9.                   DEFINE
              03 DLN-0013-W-OBLIGAT-S                                   DEFINE
                       REDEFINES DLN-0013-W-OBLIGAT                     DEFINE
                       PIC X(12).                                       DEFINE
              03 FILLER               PIC X(15) VALUE '   RECORD CODE '.DEFINE
              03 DLN-0013-HOLD-RECORD-CODE PIC 9(3).                    DEFINE
              03 FILLER               PIC X(10) VALUE '  GL CODE '.     DEFINE
              03 DLN-0013-W-GL-CODE PIC 9(7).                           DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0013 IS 73
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0014.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0014.                                                    DEFINE
           02 DLN-0014-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(40) VALUE                   DEFINE
              ' UNSUCCESSFUL START FOR OBLIGATION FILE '.               DEFINE
              03 DLN-0014-KEY-M-KEY PIC X(22).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0014 IS 62
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB1 DISPLAY LINE STORAGE DEFINITION FOR DLN-0015.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0015.                                                    DEFINE
           02 DLN-0015-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(47) VALUE                   DEFINE
              ' UNSUCCESSFUL READ FOR OBLIGATION INTEGRITY REC'.        DEFINE
              03 FILLER               PIC X(04) VALUE 'ORD '.           DEFINE
              03 DLN-0015-KEY-M-KEY PIC X(22).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0015 IS 73
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB2 DISPLAY LINE STORAGE DEFINITION FOR DLN-0016.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0016.                                                    DEFINE
           02 DLN-0016-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(44) VALUE                   DEFINE
              ' UNSUCCESSFUL POINT FOR THIS CONTROL RECORD '.           DEFINE
              03 DLN-0016-KEY-CS-KEY PIC X(30).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0016 IS 74
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB2 DISPLAY LINE STORAGE DEFINITION FOR DLN-0017.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0017.                                                    DEFINE
           02 DLN-0017-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(43) VALUE                   DEFINE
              ' MASTER FILE AND CONTROL FILE DO NOT MATCH '.            DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0017 IS 43
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB2 DISPLAY LINE STORAGE DEFINITION FOR DLN-0018.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0018.                                                    DEFINE
           02 DLN-0018-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(17) VALUE                   DEFINE
              ' OBLIGATION FILE '.                                      DEFINE
              03 DLN-0018-DATE-RPT  PIC X(8).                           DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0018 IS 25
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB2 DISPLAY LINE STORAGE DEFINITION FOR DLN-0019.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0019.                                                    DEFINE
           02 DLN-0019-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(14) VALUE ' CONTROL FILE '. DEFINE
              03 DLN-0019-CSH030-CUR-DATE PIC 9(6).                     DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0019 IS 20
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB2 DISPLAY LINE STORAGE DEFINITION FOR DLN-0020.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0020.                                                    DEFINE
           02 DLN-0020-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(47) VALUE                   DEFINE
              ' INVALID YEAR TO SUBTRACT FOR INVOICE DELINQUEN'.        DEFINE
              03 FILLER               PIC X(03) VALUE 'CY '.            DEFINE
              03 DLN-0020-DATE-IN   PIC 9(6).                           DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0020 IS 56
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB2 DISPLAY LINE STORAGE DEFINITION FOR DLN-0021.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0021.                                                    DEFINE
           02 DLN-0021-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(43) VALUE                   DEFINE
              ' UNSUCCESSFUL POINT FOR 150 CONTROL RECORD '.            DEFINE
              03 DLN-0021-KEY-CS-KEY PIC X(30).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0021 IS 73
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB2 DISPLAY LINE STORAGE DEFINITION FOR DLN-0022.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0022.                                                    DEFINE
           02 DLN-0022-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(47) VALUE                   DEFINE
              ' UNSUCCESSFUL POINT FOR THIS OBLIGATION RECORD '.        DEFINE
              03 DLN-0022-KEY-M-KEY PIC X(22).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0022 IS 69
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB2 DISPLAY LINE STORAGE DEFINITION FOR DLN-0023.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0023.                                                    DEFINE
           02 DLN-0023-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(09) VALUE 'NO MATCH '.      DEFINE
              03 DLN-0023-W-BANK    PIC 9(2).                           DEFINE
              03 FILLER               PIC X(01) VALUE ' '.              DEFINE
              03 DLN-0023-W-OBLIGOR PIC 999B999B999B9.                  DEFINE
              03 DLN-0023-W-OBLIGOR-S                                   DEFINE
                       REDEFINES DLN-0023-W-OBLIGOR                     DEFINE
                       PIC X(13).                                       DEFINE
              03 FILLER               PIC X(01) VALUE ' '.              DEFINE
              03 DLN-0023-W-OBLIGAT PIC 99999B9999B9.                   DEFINE
              03 DLN-0023-W-OBLIGAT-S                                   DEFINE
                       REDEFINES DLN-0023-W-OBLIGAT                     DEFINE
                       PIC X(12).                                       DEFINE
              03 FILLER               PIC X(15) VALUE '   RECORD CODE '.DEFINE
              03 DLN-0023-HOLD-RECORD-CODE PIC 9(3).                    DEFINE
              03 FILLER               PIC X(10) VALUE '  GL CODE '.     DEFINE
              03 DLN-0023-W-GL-CODE PIC 9(7).                           DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0023 IS 73
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB2 DISPLAY LINE STORAGE DEFINITION FOR DLN-0024.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0024.                                                    DEFINE
           02 DLN-0024-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(47) VALUE                   DEFINE
              ' UNSUCCESSFUL POINT FOR THIS INVOICE    RECORD '.        DEFINE
              03 FILLER               PIC X(08) VALUE '  KEY = '.       DEFINE
              03 DLN-0024-KEY-V-KEY PIC X(27).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0024 IS 82
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB2 DISPLAY LINE STORAGE DEFINITION FOR DLN-0025.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0025.                                                    DEFINE
           02 DLN-0025-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(47) VALUE                   DEFINE
              ' UNSUCCESSFUL READ  FOR THIS INVOICE    RECORD '.        DEFINE
              03 FILLER               PIC X(10) VALUE '    KEY = '.     DEFINE
              03 DLN-0025-KEY-V-KEY PIC X(27).                          DEFINE
              03 FILLER               PIC X(16) VALUE '    FILE STATUS 'DEFINE
              .                                                         DEFINE
              03 DLN-0025-M8134D-EZSTATUS PIC Z,ZZZ,ZZZ,ZZZ-.           DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0025 IS 114
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB2 DISPLAY LINE STORAGE DEFINITION FOR DLN-0026.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0026.                                                    DEFINE
           02 DLN-0026-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(37) VALUE                   DEFINE
              ' INVOICES DO NOT TOTAL BILLED AMOUNT '.                  DEFINE
              03 DLN-0026-W-BANK    PIC 9(2).                           DEFINE
              03 FILLER               PIC X(01) VALUE ' '.              DEFINE
              03 DLN-0026-W-OBLIGOR PIC 999B999B999B9.                  DEFINE
              03 DLN-0026-W-OBLIGOR-S                                   DEFINE
                       REDEFINES DLN-0026-W-OBLIGOR                     DEFINE
                       PIC X(13).                                       DEFINE
              03 FILLER               PIC X(01) VALUE ' '.              DEFINE
              03 DLN-0026-W-OBLIGAT PIC 99999B9999B9.                   DEFINE
              03 DLN-0026-W-OBLIGAT-S                                   DEFINE
                       REDEFINES DLN-0026-W-OBLIGAT                     DEFINE
                       PIC X(12).                                       DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0026 IS 66
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB2 DISPLAY LINE STORAGE DEFINITION FOR DLN-0027.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0027.                                                    DEFINE
           02 DLN-0027-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(39) VALUE                   DEFINE
              '                       BILLED AMOUNT = '.                DEFINE
              03 DLN-0027-BILLED-AMOUNT PIC Z,ZZZ,ZZZ,ZZZ,ZZZ.9(02)-.   DEFINE
              03 FILLER               PIC X(18) VALUE                   DEFINE
              '   INVOICES TOTAL '.                                     DEFINE
              03 DLN-0027-TEST-AMOUNT PIC Z,ZZZ,ZZZ,ZZZ,ZZZ.9(02)-.     DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0027 IS 99
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB2 DISPLAY LINE STORAGE DEFINITION FOR DLN-0028.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0028.                                                    DEFINE
           02 DLN-0028-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(15) VALUE ' LNSDATE ERROR '.DEFINE
              03 DLN-0028-JULIAN    PIC 9(5).                           DEFINE
              03 FILLER               PIC X(01) VALUE ' '.              DEFINE
              03 DLN-0028-GREGORIAN PIC 99B99B99.                       DEFINE
              03 DLN-0028-GREGORIAN-S                                   DEFINE
                       REDEFINES DLN-0028-GREGORIAN                     DEFINE
                       PIC X(8).                                        DEFINE
              03 FILLER               PIC X(01) VALUE ' '.              DEFINE
              03 DLN-0028-REQUEST-SW PIC 9(1).                          DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0028 IS 31
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB3 DISPLAY LINE STORAGE DEFINITION FOR DLN-0029.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0029.                                                    DEFINE
           02 DLN-0029-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(17) VALUE                   DEFINE
              ' ERROR ON MATCH  '.                                      DEFINE
              03 DLN-0029-SMY-CRITERIA PIC 9(5).                        DEFINE
              03 FILLER               PIC X(01) VALUE ' '.              DEFINE
              03 DLN-0029-SMY-BRANCH PIC 9(5).                          DEFINE
              03 DLN-0029-SMY-TYPE  PIC X(5).                           DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0029 IS 33
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI JOB3 DISPLAY LINE STORAGE DEFINITION FOR DLN-0030.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  DLN-0030.                                                    DEFINE
           02 DLN-0030-GROUP-0.                                         DEFINE
              03 FILLER               PIC X(25) VALUE                   DEFINE
              ' WHAT AM I DOING HERE????'.                              DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR DLN-0030 IS 25
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI TRAN-RPT LINE STORAGE DEFINITION FOR F01-CF01.          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  F01-CF01.                                                    DEFINE
           02 F01-CF01-GROUP-0.                                         DEFINE
              03 FILLER             PIC X(21) VALUE SPACES.             DEFINE
              03 F01-CF01-CRITERIA  PIC 9(5).                           DEFINE
              03 F01-CF01-CRITERIA-Z                                    DEFINE
                       REDEFINES F01-CF01-CRITERIA  PIC X(5).           DEFINE
              03 FILLER             PIC X(07) VALUE SPACES.             DEFINE
              03 F01-CF01-T-BANK    PIC 9(2).                           DEFINE
              03 F01-CF01-T-BANK-Z                                      DEFINE
                       REDEFINES F01-CF01-T-BANK    PIC X(2).           DEFINE
              03 FILLER             PIC X(10) VALUE SPACES.             DEFINE
              03 F01-CF01-W-ASSIGNMENT PIC 9(5).                        DEFINE
              03 F01-CF01-W-ASSIGNMENT-Z                                DEFINE
                       REDEFINES F01-CF01-W-ASSIGNMENT PIC X(5).        DEFINE
              03 FILLER             PIC X(08) VALUE SPACES.             DEFINE
              03 F01-CF01-WORK-TYPE PIC X(5).                           DEFINE
              03 FILLER             PIC X(04) VALUE SPACES.             DEFINE
              03 F01-CF01-ACCR-DATE PIC 9(6).                           DEFINE
              03 F01-CF01-ACCR-DATE-Z                                   DEFINE
                       REDEFINES F01-CF01-ACCR-DATE PIC X(6).           DEFINE
              03 FILLER             PIC X(05) VALUE SPACES.             DEFINE
              03 F01-CF01-W-AMOUNT  PIC ZZZZ,ZZZ,ZZZ,ZZZ,ZZZ.9(02)-.    DEFINE
              03 F01-CF01-W-AMOUNT-Z                                    DEFINE
                       REDEFINES F01-CF01-W-AMOUNT  PIC X(24).          DEFINE
              03 FILLER             PIC X(03) VALUE SPACES.             DEFINE
              03 F01-CF01-PENGI-COUNT PIC ZZZZZ-.                       DEFINE
              03 F01-CF01-PENGI-COUNT-Z                                 DEFINE
                       REDEFINES F01-CF01-PENGI-COUNT PIC X(6).         DEFINE
              03 FILLER             PIC X(21) VALUE SPACES.             DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR F01-CF01 IS 132
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI BAL-RPT LINE STORAGE DEFINITION FOR F02-CF01.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  F02-CF01.                                                    DEFINE
           02 F02-CF01-GROUP-0.                                         DEFINE
              03 FILLER             PIC X(22) VALUE SPACES.             DEFINE
              03 F02-CF01-CRITERIA  PIC 9(5).                           DEFINE
              03 F02-CF01-CRITERIA-Z                                    DEFINE
                       REDEFINES F02-CF01-CRITERIA  PIC X(5).           DEFINE
              03 FILLER             PIC X(06) VALUE SPACES.             DEFINE
              03 F02-CF01-W-BANK    PIC 9(2).                           DEFINE
              03 F02-CF01-W-BANK-Z                                      DEFINE
                       REDEFINES F02-CF01-W-BANK    PIC X(2).           DEFINE
              03 FILLER             PIC X(09) VALUE SPACES.             DEFINE
              03 F02-CF01-W-ASSIGNMENT PIC 9(5).                        DEFINE
              03 F02-CF01-W-ASSIGNMENT-Z                                DEFINE
                       REDEFINES F02-CF01-W-ASSIGNMENT PIC X(5).        DEFINE
              03 FILLER             PIC X(08) VALUE SPACES.             DEFINE
              03 F02-CF01-WORK-TYPE PIC X(5).                           DEFINE
              03 FILLER             PIC X(04) VALUE SPACES.             DEFINE
              03 F02-CF01-ACCR-DATE PIC 9(6).                           DEFINE
              03 F02-CF01-ACCR-DATE-Z                                   DEFINE
                       REDEFINES F02-CF01-ACCR-DATE PIC X(6).           DEFINE
              03 FILLER             PIC X(05) VALUE SPACES.             DEFINE
              03 F02-CF01-W-AMOUNT  PIC ZZZZ,ZZZ,ZZZ,ZZZ,ZZZ.9(02)-.    DEFINE
              03 F02-CF01-W-AMOUNT-Z                                    DEFINE
                       REDEFINES F02-CF01-W-AMOUNT  PIC X(24).          DEFINE
              03 FILLER             PIC X(03) VALUE SPACES.             DEFINE
              03 F02-CF01-PENGI-COUNT PIC ZZZZZ-.                       DEFINE
              03 F02-CF01-PENGI-COUNT-Z                                 DEFINE
                       REDEFINES F02-CF01-PENGI-COUNT PIC X(6).         DEFINE
              03 FILLER             PIC X(22) VALUE SPACES.             DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR F02-CF01 IS 132
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
           02 RC-CON-DLN-0013-CHR          PIC 9(09) COMP.              FUNCTION
           02 RC-CON-DLN-0023-CHR          PIC 9(09) COMP.              FUNCTION
           02 RC-CON-DLN-0026-CHR          PIC 9(09) COMP.              FUNCTION
           02 RC-CON-DLN-0028-CHR          PIC 9(09) COMP.              FUNCTION
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
      * PENGI FILE STATUS CODE AND MESSAGE FOR M8104D FILE            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  M8104D-IO-COUNT     PIC 9(09) COMP VALUE ZEROES.             FDYNIOR
       01  M8104D-EOF-DELAY-FLAG PIC X(02) VALUE SPACES.                FDYNIOR
           88 M8104D-EOF-DELAYED VALUE 'DE'.                            FDYNIOR
       01  M8104D-IOSW         PIC X(01) VALUE 'C'.                     FDYNIOR
           88 M8104D-OPEN      VALUE 'O'.                               FDYNIOR
           88 M8104D-CLOSED    VALUE 'C'.                               FDYNIOR
       01  M8104D-ACCEPT-FLAG  PIC X(01) VALUE 'Y'.                     FDYNIOR
           88 ACCEPT-M8104D-RECORD VALUE 'Y'.                           FDYNIOR
           88 BYPASS-M8104D-RECORD VALUE 'B'.                           FDYNIOR
       01  M8104D-MESSAGE.                                              FDYNIOR
           02 FILLER         PIC X(28)                                  FDYNIOR
                             VALUE 'FILE I/O ERROR, RETURN CODE='.      FDYNIOR
           02 M8104D-STATUS  PIC X(02) VALUE SPACES.                    FDYNIOR
              88 M8104D-GOOD-OPEN VALUE '00' '97'.                      FDYNIOR
              88 M8104D-GOOD-IO   VALUE '00' '04'.                      FDYNIOR
              88 END-OF-M8104D    VALUE '10'.                           FDYNIOR
           02 FILLER         PIC X(26) VALUE ' M8104D'.                 FDYNIOR
                                                                        FDYNIOR
       01  IM8104D-KSD-KEY.                                             FDYNIOR
           02 FILLER          PIC X(256) VALUE LOW-VALUES.              FDYNIOR
                                                                        FDYNIOR
       01  M8104D-DYNAM-FIB.                                            FDYNIOR
           02 M8104D-OPSYS        PIC X(03) VALUE 'MVS'.                FDYNIOR
           02 M8104D-RECFM        PIC X(01) VALUE 'F'.                  FDYNIOR
           02 M8104D-PHORG        PIC X(08) VALUE 'INDEXED'.            FDYNIOR
           02 M8104D-DDNAME       PIC X(08) VALUE 'M8104D'.             FDYNIOR
           02 M8104D-IOM-NAME     PIC X(08) VALUE SPACES.               FDYNIOR
           02 M8104D-IOM-ADCON    POINTER VALUE NULL.                   FDYNIOR
           02 M8104D-IOM-ADCON2   POINTER VALUE NULL.                   FDYNIOR
           02 M8104D-KEY-PTR      POINTER VALUE NULL.                   FDYNIOR
           02 M8104D-KEY-REL      PIC X(08) VALUE SPACES.               FDYNIOR
      * THE REAL LRECL IS ACQUIRED BY I/O MODULE AT OPEN TIME           FDYNIOR
           02 M8104D-DCB-LRECL    PIC S9(09) COMP VALUE 0.              FDYNIOR
      * INITIAL SIZE IS ACQUIRED BY I/O MODULE AT OPEN TIME             FDYNIOR
           02 M8104D-RECORD-SIZE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8104D-RECORD-GSIZ  PIC S9(09) COMP VALUE 300.            FDYNIOR
           02 M8104D-RECORD-TAIL  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8104D-RECORD-KEYE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8104D-RECORD-VEND  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8104D-IO-REQUEST   PIC X(08) VALUE SPACES.               FDYNIOR
           02 M8104D-IO-REQTYPE   PIC X(08) VALUE SPACES.               FDYNIOR
           02 M8104D-IO-ERCODE1   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 M8104D-IO-ERCODE2   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 M8104D-IO-VSMEMSG   PIC X(80) VALUE SPACES.               FDYNIOR
           02 M8104D-IO-BITS0     PIC X(01) VALUE X'08'.                FDYNIOR
           02 M8104D-IO-BITS1     PIC X(01) VALUE X'00'.                FDYNIOR
           02 M8104D-IO-BUFNO     PIC S9(04) COMP VALUE 4.              FDYNIOR
           02 M8104D-RECORD-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 M8104D-IOAREA-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 FILLER              PIC X(04) VALUE HIGH-VALUES.          FDYNIOR
           02 M8104D-VSERMOD-PTR  POINTER VALUE NULL.                   FDYNIOR
           02 M8104D-IOAREA1-ADC  POINTER VALUE NULL.                   FDYNIOR
           02 M8104D-IOM-ADCON0   POINTER VALUE NULL.                   FDYNIOR
           02 M8104D-DCB-BLKSIZE  PIC S9(9) COMP VALUE 0.               FDYNIOR
           02 M8104D-RECFM2       PIC X(1)  VALUE 'B'.                  FDYNIOR
           02 FILLER              PIC X(11) VALUE HIGH-VALUES.          FDYNIOR
                                                                        FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS CODE AND MESSAGE FOR M8124D FILE            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  M8124D-IO-COUNT     PIC 9(09) COMP VALUE ZEROES.             FDYNIOR
       01  M8124D-EOF-DELAY-FLAG PIC X(02) VALUE SPACES.                FDYNIOR
           88 M8124D-EOF-DELAYED VALUE 'DE'.                            FDYNIOR
       01  M8124D-IOSW         PIC X(01) VALUE 'C'.                     FDYNIOR
           88 M8124D-OPEN      VALUE 'O'.                               FDYNIOR
           88 M8124D-CLOSED    VALUE 'C'.                               FDYNIOR
       01  M8124D-ACCEPT-FLAG  PIC X(01) VALUE 'Y'.                     FDYNIOR
           88 ACCEPT-M8124D-RECORD VALUE 'Y'.                           FDYNIOR
           88 BYPASS-M8124D-RECORD VALUE 'B'.                           FDYNIOR
       01  M8124D-MESSAGE.                                              FDYNIOR
           02 FILLER         PIC X(28)                                  FDYNIOR
                             VALUE 'FILE I/O ERROR, RETURN CODE='.      FDYNIOR
           02 M8124D-STATUS  PIC X(02) VALUE SPACES.                    FDYNIOR
              88 M8124D-GOOD-OPEN VALUE '00' '97'.                      FDYNIOR
              88 M8124D-GOOD-IO   VALUE '00' '04'.                      FDYNIOR
              88 END-OF-M8124D    VALUE '10'.                           FDYNIOR
           02 FILLER         PIC X(26) VALUE ' M8124D'.                 FDYNIOR
                                                                        FDYNIOR
       01  IM8124D-KSD-KEY.                                             FDYNIOR
           02 FILLER          PIC X(256) VALUE LOW-VALUES.              FDYNIOR
                                                                        FDYNIOR
       01  M8124D-DYNAM-FIB.                                            FDYNIOR
           02 M8124D-OPSYS        PIC X(03) VALUE 'MVS'.                FDYNIOR
           02 M8124D-RECFM        PIC X(01) VALUE 'F'.                  FDYNIOR
           02 M8124D-PHORG        PIC X(08) VALUE 'INDEXED'.            FDYNIOR
           02 M8124D-DDNAME       PIC X(08) VALUE 'M8124D'.             FDYNIOR
           02 M8124D-IOM-NAME     PIC X(08) VALUE SPACES.               FDYNIOR
           02 M8124D-IOM-ADCON    POINTER VALUE NULL.                   FDYNIOR
           02 M8124D-IOM-ADCON2   POINTER VALUE NULL.                   FDYNIOR
           02 M8124D-KEY-PTR      POINTER VALUE NULL.                   FDYNIOR
           02 M8124D-KEY-REL      PIC X(08) VALUE SPACES.               FDYNIOR
      * THE REAL LRECL IS ACQUIRED BY I/O MODULE AT OPEN TIME           FDYNIOR
           02 M8124D-DCB-LRECL    PIC S9(09) COMP VALUE 0.              FDYNIOR
      * INITIAL SIZE IS ACQUIRED BY I/O MODULE AT OPEN TIME             FDYNIOR
           02 M8124D-RECORD-SIZE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8124D-RECORD-GSIZ  PIC S9(09) COMP VALUE 2446.           FDYNIOR
           02 M8124D-RECORD-TAIL  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8124D-RECORD-KEYE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8124D-RECORD-VEND  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8124D-IO-REQUEST   PIC X(08) VALUE SPACES.               FDYNIOR
           02 M8124D-IO-REQTYPE   PIC X(08) VALUE SPACES.               FDYNIOR
           02 M8124D-IO-ERCODE1   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 M8124D-IO-ERCODE2   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 M8124D-IO-VSMEMSG   PIC X(80) VALUE SPACES.               FDYNIOR
           02 M8124D-IO-BITS0     PIC X(01) VALUE X'08'.                FDYNIOR
           02 M8124D-IO-BITS1     PIC X(01) VALUE X'00'.                FDYNIOR
           02 M8124D-IO-BUFNO     PIC S9(04) COMP VALUE 4.              FDYNIOR
           02 M8124D-RECORD-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 M8124D-IOAREA-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 FILLER              PIC X(04) VALUE HIGH-VALUES.          FDYNIOR
           02 M8124D-VSERMOD-PTR  POINTER VALUE NULL.                   FDYNIOR
           02 M8124D-IOAREA1-ADC  POINTER VALUE NULL.                   FDYNIOR
           02 M8124D-IOM-ADCON0   POINTER VALUE NULL.                   FDYNIOR
           02 M8124D-DCB-BLKSIZE  PIC S9(9) COMP VALUE 0.               FDYNIOR
           02 M8124D-RECFM2       PIC X(1)  VALUE 'B'.                  FDYNIOR
           02 FILLER              PIC X(11) VALUE HIGH-VALUES.          FDYNIOR
                                                                        FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS CODE AND MESSAGE FOR M8134D FILE            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  M8134D-IO-COUNT     PIC 9(09) COMP VALUE ZEROES.             FDYNIOR
       01  M8134D-EOF-DELAY-FLAG PIC X(02) VALUE SPACES.                FDYNIOR
           88 M8134D-EOF-DELAYED VALUE 'DE'.                            FDYNIOR
       01  M8134D-IOSW         PIC X(01) VALUE 'C'.                     FDYNIOR
           88 M8134D-OPEN      VALUE 'O'.                               FDYNIOR
           88 M8134D-CLOSED    VALUE 'C'.                               FDYNIOR
       01  M8134D-ACCEPT-FLAG  PIC X(01) VALUE 'Y'.                     FDYNIOR
           88 ACCEPT-M8134D-RECORD VALUE 'Y'.                           FDYNIOR
           88 BYPASS-M8134D-RECORD VALUE 'B'.                           FDYNIOR
       01  M8134D-MESSAGE.                                              FDYNIOR
           02 FILLER         PIC X(28)                                  FDYNIOR
                             VALUE 'FILE I/O ERROR, RETURN CODE='.      FDYNIOR
           02 M8134D-STATUS  PIC X(02) VALUE SPACES.                    FDYNIOR
              88 M8134D-GOOD-OPEN VALUE '00' '97'.                      FDYNIOR
              88 M8134D-GOOD-IO   VALUE '00' '04'.                      FDYNIOR
              88 END-OF-M8134D    VALUE '10'.                           FDYNIOR
           02 FILLER         PIC X(26) VALUE ' M8134D'.                 FDYNIOR
                                                                        FDYNIOR
       01  IM8134D-KSD-KEY.                                             FDYNIOR
           02 FILLER          PIC X(256) VALUE LOW-VALUES.              FDYNIOR
                                                                        FDYNIOR
       01  M8134D-DYNAM-FIB.                                            FDYNIOR
           02 M8134D-OPSYS        PIC X(03) VALUE 'MVS'.                FDYNIOR
           02 M8134D-RECFM        PIC X(01) VALUE 'F'.                  FDYNIOR
           02 M8134D-PHORG        PIC X(08) VALUE 'INDEXED'.            FDYNIOR
           02 M8134D-DDNAME       PIC X(08) VALUE 'M8134D'.             FDYNIOR
           02 M8134D-IOM-NAME     PIC X(08) VALUE SPACES.               FDYNIOR
           02 M8134D-IOM-ADCON    POINTER VALUE NULL.                   FDYNIOR
           02 M8134D-IOM-ADCON2   POINTER VALUE NULL.                   FDYNIOR
           02 M8134D-KEY-PTR      POINTER VALUE NULL.                   FDYNIOR
           02 M8134D-KEY-REL      PIC X(08) VALUE SPACES.               FDYNIOR
      * THE REAL LRECL IS ACQUIRED BY I/O MODULE AT OPEN TIME           FDYNIOR
           02 M8134D-DCB-LRECL    PIC S9(09) COMP VALUE 0.              FDYNIOR
      * INITIAL SIZE IS ACQUIRED BY I/O MODULE AT OPEN TIME             FDYNIOR
           02 M8134D-RECORD-SIZE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8134D-RECORD-GSIZ  PIC S9(09) COMP VALUE 150.            FDYNIOR
           02 M8134D-RECORD-TAIL  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8134D-RECORD-KEYE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8134D-RECORD-VEND  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8134D-IO-REQUEST   PIC X(08) VALUE SPACES.               FDYNIOR
           02 M8134D-IO-REQTYPE   PIC X(08) VALUE SPACES.               FDYNIOR
           02 M8134D-IO-ERCODE1   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 M8134D-IO-ERCODE2   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 M8134D-IO-VSMEMSG   PIC X(80) VALUE SPACES.               FDYNIOR
           02 M8134D-IO-BITS0     PIC X(01) VALUE X'08'.                FDYNIOR
           02 M8134D-IO-BITS1     PIC X(01) VALUE X'00'.                FDYNIOR
           02 M8134D-IO-BUFNO     PIC S9(04) COMP VALUE 4.              FDYNIOR
           02 M8134D-RECORD-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 M8134D-IOAREA-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 FILLER              PIC X(04) VALUE HIGH-VALUES.          FDYNIOR
           02 M8134D-VSERMOD-PTR  POINTER VALUE NULL.                   FDYNIOR
           02 M8134D-IOAREA1-ADC  POINTER VALUE NULL.                   FDYNIOR
           02 M8134D-IOM-ADCON0   POINTER VALUE NULL.                   FDYNIOR
           02 M8134D-DCB-BLKSIZE  PIC S9(9) COMP VALUE 0.               FDYNIOR
           02 M8134D-RECFM2       PIC X(1)  VALUE 'B'.                  FDYNIOR
           02 FILLER              PIC X(11) VALUE HIGH-VALUES.          FDYNIOR
                                                                        FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS CODE AND MESSAGE FOR M8234D FILE            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  M8234D-IO-COUNT     PIC 9(09) COMP VALUE ZEROES.             FDYNIOR
       01  M8234D-EOF-DELAY-FLAG PIC X(02) VALUE SPACES.                FDYNIOR
           88 M8234D-EOF-DELAYED VALUE 'DE'.                            FDYNIOR
       01  M8234D-IOSW         PIC X(01) VALUE 'C'.                     FDYNIOR
           88 M8234D-OPEN      VALUE 'O'.                               FDYNIOR
           88 M8234D-CLOSED    VALUE 'C'.                               FDYNIOR
       01  M8234D-ACCEPT-FLAG  PIC X(01) VALUE 'Y'.                     FDYNIOR
           88 ACCEPT-M8234D-RECORD VALUE 'Y'.                           FDYNIOR
           88 BYPASS-M8234D-RECORD VALUE 'B'.                           FDYNIOR
       01  M8234D-MESSAGE.                                              FDYNIOR
           02 FILLER         PIC X(28)                                  FDYNIOR
                             VALUE 'FILE I/O ERROR, RETURN CODE='.      FDYNIOR
           02 M8234D-STATUS  PIC X(02) VALUE SPACES.                    FDYNIOR
              88 M8234D-GOOD-OPEN VALUE '00' '97'.                      FDYNIOR
              88 M8234D-GOOD-IO   VALUE '00' '04'.                      FDYNIOR
              88 END-OF-M8234D    VALUE '10'.                           FDYNIOR
           02 FILLER         PIC X(26) VALUE ' M8234D'.                 FDYNIOR
                                                                        FDYNIOR
       01  IM8234D-KSD-KEY.                                             FDYNIOR
           02 FILLER          PIC X(256) VALUE LOW-VALUES.              FDYNIOR
                                                                        FDYNIOR
       01  M8234D-DYNAM-FIB.                                            FDYNIOR
           02 M8234D-OPSYS        PIC X(03) VALUE 'MVS'.                FDYNIOR
           02 M8234D-RECFM        PIC X(01) VALUE 'F'.                  FDYNIOR
           02 M8234D-PHORG        PIC X(08) VALUE 'INDEXED'.            FDYNIOR
           02 M8234D-DDNAME       PIC X(08) VALUE 'M8234D'.             FDYNIOR
           02 M8234D-IOM-NAME     PIC X(08) VALUE SPACES.               FDYNIOR
           02 M8234D-IOM-ADCON    POINTER VALUE NULL.                   FDYNIOR
           02 M8234D-IOM-ADCON2   POINTER VALUE NULL.                   FDYNIOR
           02 M8234D-KEY-PTR      POINTER VALUE NULL.                   FDYNIOR
           02 M8234D-KEY-REL      PIC X(08) VALUE SPACES.               FDYNIOR
      * THE REAL LRECL IS ACQUIRED BY I/O MODULE AT OPEN TIME           FDYNIOR
           02 M8234D-DCB-LRECL    PIC S9(09) COMP VALUE 0.              FDYNIOR
      * INITIAL SIZE IS ACQUIRED BY I/O MODULE AT OPEN TIME             FDYNIOR
           02 M8234D-RECORD-SIZE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8234D-RECORD-GSIZ  PIC S9(09) COMP VALUE 450.            FDYNIOR
           02 M8234D-RECORD-TAIL  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8234D-RECORD-KEYE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8234D-RECORD-VEND  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 M8234D-IO-REQUEST   PIC X(08) VALUE SPACES.               FDYNIOR
           02 M8234D-IO-REQTYPE   PIC X(08) VALUE SPACES.               FDYNIOR
           02 M8234D-IO-ERCODE1   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 M8234D-IO-ERCODE2   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 M8234D-IO-VSMEMSG   PIC X(80) VALUE SPACES.               FDYNIOR
           02 M8234D-IO-BITS0     PIC X(01) VALUE X'08'.                FDYNIOR
           02 M8234D-IO-BITS1     PIC X(01) VALUE X'00'.                FDYNIOR
           02 M8234D-IO-BUFNO     PIC S9(04) COMP VALUE 4.              FDYNIOR
           02 M8234D-RECORD-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 M8234D-IOAREA-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 FILLER              PIC X(04) VALUE HIGH-VALUES.          FDYNIOR
           02 M8234D-VSERMOD-PTR  POINTER VALUE NULL.                   FDYNIOR
           02 M8234D-IOAREA1-ADC  POINTER VALUE NULL.                   FDYNIOR
           02 M8234D-IOM-ADCON0   POINTER VALUE NULL.                   FDYNIOR
           02 M8234D-DCB-BLKSIZE  PIC S9(9) COMP VALUE 0.               FDYNIOR
           02 M8234D-RECFM2       PIC X(1)  VALUE 'B'.                  FDYNIOR
           02 FILLER              PIC X(11) VALUE HIGH-VALUES.          FDYNIOR
                                                                        FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS CODE AND MESSAGE FOR ACH FILE               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  ACH-IO-COUNT     PIC 9(09) COMP VALUE ZEROES.                FDYNIOR
       01  ACH-EOF-DELAY-FLAG PIC X(02) VALUE SPACES.                   FDYNIOR
           88 ACH-EOF-DELAYED VALUE 'DE'.                               FDYNIOR
       01  ACH-IOSW         PIC X(01) VALUE 'C'.                        FDYNIOR
           88 ACH-OPEN      VALUE 'O'.                                  FDYNIOR
           88 ACH-CLOSED    VALUE 'C'.                                  FDYNIOR
       01  ACH-ACCEPT-FLAG  PIC X(01) VALUE 'Y'.                        FDYNIOR
           88 ACCEPT-ACH-RECORD VALUE 'Y'.                              FDYNIOR
           88 BYPASS-ACH-RECORD VALUE 'B'.                              FDYNIOR
       01  ACH-MESSAGE.                                                 FDYNIOR
           02 FILLER         PIC X(28)                                  FDYNIOR
                             VALUE 'FILE I/O ERROR, RETURN CODE='.      FDYNIOR
           02 ACH-STATUS  PIC X(02) VALUE SPACES.                       FDYNIOR
              88 ACH-GOOD-OPEN VALUE '00' '97'.                         FDYNIOR
              88 ACH-GOOD-IO   VALUE '00' '04'.                         FDYNIOR
              88 END-OF-ACH    VALUE '10'.                              FDYNIOR
           02 FILLER         PIC X(26) VALUE ' ACH'.                    FDYNIOR
                                                                        FDYNIOR
       01  ACH-DYNAM-FIB.                                               FDYNIOR
           02 ACH-OPSYS        PIC X(03) VALUE 'MVS'.                   FDYNIOR
           02 ACH-RECFM        PIC X(01) VALUE '?'.                     FDYNIOR
           02 ACH-PHORG        PIC X(08) VALUE 'SEQ'.                   FDYNIOR
           02 ACH-DDNAME       PIC X(08) VALUE 'ACH'.                   FDYNIOR
           02 ACH-IOM-NAME     PIC X(08) VALUE SPACES.                  FDYNIOR
           02 ACH-IOM-ADCON    POINTER VALUE NULL.                      FDYNIOR
           02 ACH-IOM-ADCON2   POINTER VALUE NULL.                      FDYNIOR
           02 ACH-KEY-PTR      POINTER VALUE NULL.                      FDYNIOR
           02 ACH-KEY-REL      PIC X(08) VALUE SPACES.                  FDYNIOR
      * THE REAL LRECL IS ACQUIRED BY I/O MODULE AT OPEN TIME           FDYNIOR
           02 ACH-DCB-LRECL    PIC S9(09) COMP VALUE 0.                 FDYNIOR
      * INITIAL SIZE IS ACQUIRED BY I/O MODULE AT OPEN TIME             FDYNIOR
           02 ACH-RECORD-SIZE  PIC S9(09) COMP VALUE ZERO.              FDYNIOR
           02 ACH-RECORD-GSIZ  PIC S9(09) COMP VALUE 80.                FDYNIOR
           02 ACH-RECORD-TAIL  PIC S9(09) COMP VALUE ZERO.              FDYNIOR
           02 ACH-RECORD-KEYE  PIC S9(09) COMP VALUE ZERO.              FDYNIOR
           02 ACH-RECORD-VEND  PIC S9(09) COMP VALUE ZERO.              FDYNIOR
           02 ACH-IO-REQUEST   PIC X(08) VALUE SPACES.                  FDYNIOR
           02 ACH-IO-REQTYPE   PIC X(08) VALUE SPACES.                  FDYNIOR
           02 ACH-IO-ERCODE1   PIC X(02) VALUE ZEROS.                   FDYNIOR
           02 ACH-IO-ERCODE2   PIC X(02) VALUE ZEROS.                   FDYNIOR
           02 ACH-IO-VSMEMSG   PIC X(80) VALUE SPACES.                  FDYNIOR
           02 ACH-IO-BITS0     PIC X(01) VALUE X'08'.                   FDYNIOR
           02 ACH-IO-BITS1     PIC X(01) VALUE X'00'.                   FDYNIOR
           02 ACH-IO-BUFNO     PIC S9(04) COMP VALUE 4.                 FDYNIOR
           02 ACH-RECORD-PTR   POINTER VALUE NULL.                      FDYNIOR
           02 ACH-IOAREA-PTR   POINTER VALUE NULL.                      FDYNIOR
           02 FILLER              PIC X(04) VALUE HIGH-VALUES.          FDYNIOR
           02 ACH-VSERMOD-PTR  POINTER VALUE NULL.                      FDYNIOR
           02 ACH-IOAREA1-ADC  POINTER VALUE NULL.                      FDYNIOR
           02 ACH-IOM-ADCON0   POINTER VALUE NULL.                      FDYNIOR
           02 ACH-DCB-BLKSIZE  PIC S9(9) COMP VALUE 0.                  FDYNIOR
           02 ACH-RECFM2       PIC X(1)  VALUE 'B'.                     FDYNIOR
           02 FILLER              PIC X(11) VALUE HIGH-VALUES.          FDYNIOR
                                                                        FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS CODE AND MESSAGE FOR ME7231 FILE            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  ME7231-IO-COUNT     PIC 9(09) COMP VALUE ZEROES.             FDYNIOR
       01  ME7231-EOF-DELAY-FLAG PIC X(02) VALUE SPACES.                FDYNIOR
           88 ME7231-EOF-DELAYED VALUE 'DE'.                            FDYNIOR
       01  ME7231-IOSW         PIC X(01) VALUE 'C'.                     FDYNIOR
           88 ME7231-OPEN      VALUE 'O'.                               FDYNIOR
           88 ME7231-CLOSED    VALUE 'C'.                               FDYNIOR
       01  ME7231-ACCEPT-FLAG  PIC X(01) VALUE 'Y'.                     FDYNIOR
           88 ACCEPT-ME7231-RECORD VALUE 'Y'.                           FDYNIOR
           88 BYPASS-ME7231-RECORD VALUE 'B'.                           FDYNIOR
       01  ME7231-MESSAGE.                                              FDYNIOR
           02 FILLER         PIC X(28)                                  FDYNIOR
                             VALUE 'FILE I/O ERROR, RETURN CODE='.      FDYNIOR
           02 ME7231-STATUS  PIC X(02) VALUE SPACES.                    FDYNIOR
              88 ME7231-GOOD-OPEN VALUE '00' '97'.                      FDYNIOR
              88 ME7231-GOOD-IO   VALUE '00' '04'.                      FDYNIOR
              88 END-OF-ME7231    VALUE '10'.                           FDYNIOR
           02 FILLER         PIC X(26) VALUE ' ME7231'.                 FDYNIOR
                                                                        FDYNIOR
       01  ME7231-DYNAM-FIB.                                            FDYNIOR
           02 ME7231-OPSYS        PIC X(03) VALUE 'MVS'.                FDYNIOR
           02 ME7231-RECFM        PIC X(01) VALUE '?'.                  FDYNIOR
           02 ME7231-PHORG        PIC X(08) VALUE 'SEQ'.                FDYNIOR
           02 ME7231-DDNAME       PIC X(08) VALUE 'ME7231'.             FDYNIOR
           02 ME7231-IOM-NAME     PIC X(08) VALUE SPACES.               FDYNIOR
           02 ME7231-IOM-ADCON    POINTER VALUE NULL.                   FDYNIOR
           02 ME7231-IOM-ADCON2   POINTER VALUE NULL.                   FDYNIOR
           02 ME7231-KEY-PTR      POINTER VALUE NULL.                   FDYNIOR
           02 ME7231-KEY-REL      PIC X(08) VALUE SPACES.               FDYNIOR
      * THE REAL LRECL IS ACQUIRED BY I/O MODULE AT OPEN TIME           FDYNIOR
           02 ME7231-DCB-LRECL    PIC S9(09) COMP VALUE 0.              FDYNIOR
      * INITIAL SIZE IS ACQUIRED BY I/O MODULE AT OPEN TIME             FDYNIOR
           02 ME7231-RECORD-SIZE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 ME7231-RECORD-GSIZ  PIC S9(09) COMP VALUE 33.             FDYNIOR
           02 ME7231-RECORD-TAIL  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 ME7231-RECORD-KEYE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 ME7231-RECORD-VEND  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 ME7231-IO-REQUEST   PIC X(08) VALUE SPACES.               FDYNIOR
           02 ME7231-IO-REQTYPE   PIC X(08) VALUE SPACES.               FDYNIOR
           02 ME7231-IO-ERCODE1   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 ME7231-IO-ERCODE2   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 ME7231-IO-VSMEMSG   PIC X(80) VALUE SPACES.               FDYNIOR
           02 ME7231-IO-BITS0     PIC X(01) VALUE X'08'.                FDYNIOR
           02 ME7231-IO-BITS1     PIC X(01) VALUE X'00'.                FDYNIOR
           02 ME7231-IO-BUFNO     PIC S9(04) COMP VALUE 4.              FDYNIOR
           02 ME7231-RECORD-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 ME7231-IOAREA-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 FILLER              PIC X(04) VALUE HIGH-VALUES.          FDYNIOR
           02 ME7231-VSERMOD-PTR  POINTER VALUE NULL.                   FDYNIOR
           02 ME7231-IOAREA1-ADC  POINTER VALUE NULL.                   FDYNIOR
           02 ME7231-IOM-ADCON0   POINTER VALUE NULL.                   FDYNIOR
           02 ME7231-DCB-BLKSIZE  PIC S9(9) COMP VALUE 0.               FDYNIOR
           02 ME7231-RECFM2       PIC X(1)  VALUE 'B'.                  FDYNIOR
           02 FILLER              PIC X(11) VALUE HIGH-VALUES.          FDYNIOR
                                                                        FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS CODE AND MESSAGE FOR ME7232 FILE            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  ME7232-IO-COUNT     PIC 9(09) COMP VALUE ZEROES.             FDYNIOR
       01  ME7232-EOF-DELAY-FLAG PIC X(02) VALUE SPACES.                FDYNIOR
           88 ME7232-EOF-DELAYED VALUE 'DE'.                            FDYNIOR
       01  ME7232-IOSW         PIC X(01) VALUE 'C'.                     FDYNIOR
           88 ME7232-OPEN      VALUE 'O'.                               FDYNIOR
           88 ME7232-CLOSED    VALUE 'C'.                               FDYNIOR
       01  ME7232-ACCEPT-FLAG  PIC X(01) VALUE 'Y'.                     FDYNIOR
           88 ACCEPT-ME7232-RECORD VALUE 'Y'.                           FDYNIOR
           88 BYPASS-ME7232-RECORD VALUE 'B'.                           FDYNIOR
       01  ME7232-MESSAGE.                                              FDYNIOR
           02 FILLER         PIC X(28)                                  FDYNIOR
                             VALUE 'FILE I/O ERROR, RETURN CODE='.      FDYNIOR
           02 ME7232-STATUS  PIC X(02) VALUE SPACES.                    FDYNIOR
              88 ME7232-GOOD-OPEN VALUE '00' '97'.                      FDYNIOR
              88 ME7232-GOOD-IO   VALUE '00' '04'.                      FDYNIOR
              88 END-OF-ME7232    VALUE '10'.                           FDYNIOR
           02 FILLER         PIC X(26) VALUE ' ME7232'.                 FDYNIOR
                                                                        FDYNIOR
       01  ME7232-DYNAM-FIB.                                            FDYNIOR
           02 ME7232-OPSYS        PIC X(03) VALUE 'MVS'.                FDYNIOR
           02 ME7232-RECFM        PIC X(01) VALUE '?'.                  FDYNIOR
           02 ME7232-PHORG        PIC X(08) VALUE 'SEQ'.                FDYNIOR
           02 ME7232-DDNAME       PIC X(08) VALUE 'ME7232'.             FDYNIOR
           02 ME7232-IOM-NAME     PIC X(08) VALUE SPACES.               FDYNIOR
           02 ME7232-IOM-ADCON    POINTER VALUE NULL.                   FDYNIOR
           02 ME7232-IOM-ADCON2   POINTER VALUE NULL.                   FDYNIOR
           02 ME7232-KEY-PTR      POINTER VALUE NULL.                   FDYNIOR
           02 ME7232-KEY-REL      PIC X(08) VALUE SPACES.               FDYNIOR
      * THE REAL LRECL IS ACQUIRED BY I/O MODULE AT OPEN TIME           FDYNIOR
           02 ME7232-DCB-LRECL    PIC S9(09) COMP VALUE 0.              FDYNIOR
      * INITIAL SIZE IS ACQUIRED BY I/O MODULE AT OPEN TIME             FDYNIOR
           02 ME7232-RECORD-SIZE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 ME7232-RECORD-GSIZ  PIC S9(09) COMP VALUE 65.             FDYNIOR
           02 ME7232-RECORD-TAIL  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 ME7232-RECORD-KEYE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 ME7232-RECORD-VEND  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 ME7232-IO-REQUEST   PIC X(08) VALUE SPACES.               FDYNIOR
           02 ME7232-IO-REQTYPE   PIC X(08) VALUE SPACES.               FDYNIOR
           02 ME7232-IO-ERCODE1   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 ME7232-IO-ERCODE2   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 ME7232-IO-VSMEMSG   PIC X(80) VALUE SPACES.               FDYNIOR
           02 ME7232-IO-BITS0     PIC X(01) VALUE X'08'.                FDYNIOR
           02 ME7232-IO-BITS1     PIC X(01) VALUE X'00'.                FDYNIOR
           02 ME7232-IO-BUFNO     PIC S9(04) COMP VALUE 4.              FDYNIOR
           02 ME7232-RECORD-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 ME7232-IOAREA-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 FILLER              PIC X(04) VALUE HIGH-VALUES.          FDYNIOR
           02 ME7232-VSERMOD-PTR  POINTER VALUE NULL.                   FDYNIOR
           02 ME7232-IOAREA1-ADC  POINTER VALUE NULL.                   FDYNIOR
           02 ME7232-IOM-ADCON0   POINTER VALUE NULL.                   FDYNIOR
           02 ME7232-DCB-BLKSIZE  PIC S9(9) COMP VALUE 0.               FDYNIOR
           02 ME7232-RECFM2       PIC X(1)  VALUE 'B'.                  FDYNIOR
           02 FILLER              PIC X(11) VALUE HIGH-VALUES.          FDYNIOR
                                                                        FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS CODE AND MESSAGE FOR SMYFIL FILE            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  SMYFIL-IO-COUNT     PIC 9(09) COMP VALUE ZEROES.             FDYNIOR
       01  SMYFIL-EOF-DELAY-FLAG PIC X(02) VALUE SPACES.                FDYNIOR
           88 SMYFIL-EOF-DELAYED VALUE 'DE'.                            FDYNIOR
       01  SMYFIL-IOSW         PIC X(01) VALUE 'C'.                     FDYNIOR
           88 SMYFIL-OPEN      VALUE 'O'.                               FDYNIOR
           88 SMYFIL-CLOSED    VALUE 'C'.                               FDYNIOR
       01  SMYFIL-ACCEPT-FLAG  PIC X(01) VALUE 'Y'.                     FDYNIOR
           88 ACCEPT-SMYFIL-RECORD VALUE 'Y'.                           FDYNIOR
           88 BYPASS-SMYFIL-RECORD VALUE 'B'.                           FDYNIOR
       01  SMYFIL-MESSAGE.                                              FDYNIOR
           02 FILLER         PIC X(28)                                  FDYNIOR
                             VALUE 'FILE I/O ERROR, RETURN CODE='.      FDYNIOR
           02 SMYFIL-STATUS  PIC X(02) VALUE SPACES.                    FDYNIOR
              88 SMYFIL-GOOD-OPEN VALUE '00' '97'.                      FDYNIOR
              88 SMYFIL-GOOD-IO   VALUE '00' '04'.                      FDYNIOR
              88 END-OF-SMYFIL    VALUE '10'.                           FDYNIOR
           02 FILLER         PIC X(26) VALUE ' SMYFIL'.                 FDYNIOR
                                                                        FDYNIOR
       01  SMYFIL-DYNAM-FIB.                                            FDYNIOR
           02 SMYFIL-OPSYS        PIC X(03) VALUE 'MVS'.                FDYNIOR
           02 SMYFIL-RECFM        PIC X(01) VALUE 'F'.                  FDYNIOR
           02 SMYFIL-PHORG        PIC X(08) VALUE 'SEQ'.                FDYNIOR
           02 SMYFIL-DDNAME       PIC X(08) VALUE 'SMYFIL'.             FDYNIOR
           02 SMYFIL-IOM-NAME     PIC X(08) VALUE SPACES.               FDYNIOR
           02 SMYFIL-IOM-ADCON    POINTER VALUE NULL.                   FDYNIOR
           02 SMYFIL-IOM-ADCON2   POINTER VALUE NULL.                   FDYNIOR
           02 SMYFIL-KEY-PTR      POINTER VALUE NULL.                   FDYNIOR
           02 SMYFIL-KEY-REL      PIC X(08) VALUE SPACES.               FDYNIOR
      * THE REAL LRECL IS ACQUIRED BY I/O MODULE AT OPEN TIME           FDYNIOR
           02 SMYFIL-DCB-LRECL    PIC S9(09) COMP VALUE 43.             FDYNIOR
      * INITIAL SIZE IS ACQUIRED BY I/O MODULE AT OPEN TIME             FDYNIOR
           02 SMYFIL-RECORD-SIZE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 SMYFIL-RECORD-GSIZ  PIC S9(09) COMP VALUE 43.             FDYNIOR
           02 SMYFIL-RECORD-TAIL  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 SMYFIL-RECORD-KEYE  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 SMYFIL-RECORD-VEND  PIC S9(09) COMP VALUE ZERO.           FDYNIOR
           02 SMYFIL-IO-REQUEST   PIC X(08) VALUE SPACES.               FDYNIOR
           02 SMYFIL-IO-REQTYPE   PIC X(08) VALUE SPACES.               FDYNIOR
           02 SMYFIL-IO-ERCODE1   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 SMYFIL-IO-ERCODE2   PIC X(02) VALUE ZEROS.                FDYNIOR
           02 SMYFIL-IO-VSMEMSG   PIC X(80) VALUE SPACES.               FDYNIOR
           02 SMYFIL-IO-BITS0     PIC X(01) VALUE X'08'.                FDYNIOR
           02 SMYFIL-IO-BITS1     PIC X(01) VALUE X'00'.                FDYNIOR
           02 SMYFIL-IO-BUFNO     PIC S9(04) COMP VALUE 4.              FDYNIOR
           02 SMYFIL-RECORD-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 SMYFIL-IOAREA-PTR   POINTER VALUE NULL.                   FDYNIOR
           02 SMYFIL-IOAREA2-PTR  POINTER VALUE NULL.                   FDYNIOR
           02 SMYFIL-VSERMOD-PTR  POINTER VALUE NULL.                   FDYNIOR
           02 SMYFIL-IOAREA1-ADC  POINTER VALUE NULL.                   FDYNIOR
           02 SMYFIL-IOM-ADCON0   POINTER VALUE NULL.                   FDYNIOR
           02 SMYFIL-DCB-BLKSIZE  PIC S9(9) COMP VALUE ZERO.            FDYNIOR
           02 SMYFIL-RECFM2       PIC X(1)  VALUE 'U'.                  FDYNIOR
           02 FILLER              PIC X(11) VALUE HIGH-VALUES.          FDYNIOR
                                                                        FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS CODE AND MESSAGE FOR SMYFIL2 FILE           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  SMYFIL2-IO-COUNT     PIC 9(09) COMP VALUE ZEROES.            FDYNIOR
       01  SMYFIL2-EOF-DELAY-FLAG PIC X(02) VALUE SPACES.               FDYNIOR
           88 SMYFIL2-EOF-DELAYED VALUE 'DE'.                           FDYNIOR
       01  SMYFIL2-IOSW         PIC X(01) VALUE 'C'.                    FDYNIOR
           88 SMYFIL2-OPEN      VALUE 'O'.                              FDYNIOR
           88 SMYFIL2-CLOSED    VALUE 'C'.                              FDYNIOR
       01  SMYFIL2-ACCEPT-FLAG  PIC X(01) VALUE 'Y'.                    FDYNIOR
           88 ACCEPT-SMYFIL2-RECORD VALUE 'Y'.                          FDYNIOR
           88 BYPASS-SMYFIL2-RECORD VALUE 'B'.                          FDYNIOR
       01  SMYFIL2-MESSAGE.                                             FDYNIOR
           02 FILLER         PIC X(28)                                  FDYNIOR
                             VALUE 'FILE I/O ERROR, RETURN CODE='.      FDYNIOR
           02 SMYFIL2-STATUS  PIC X(02) VALUE SPACES.                   FDYNIOR
              88 SMYFIL2-GOOD-OPEN VALUE '00' '97'.                     FDYNIOR
              88 SMYFIL2-GOOD-IO   VALUE '00' '04'.                     FDYNIOR
              88 END-OF-SMYFIL2    VALUE '10'.                          FDYNIOR
           02 FILLER         PIC X(26) VALUE ' SMYFIL2'.                FDYNIOR
                                                                        FDYNIOR
       01  SMYFIL2-DYNAM-FIB.                                           FDYNIOR
           02 SMYFIL2-OPSYS        PIC X(03) VALUE 'MVS'.               FDYNIOR
           02 SMYFIL2-RECFM        PIC X(01) VALUE 'F'.                 FDYNIOR
           02 SMYFIL2-PHORG        PIC X(08) VALUE 'SEQ'.               FDYNIOR
           02 SMYFIL2-DDNAME       PIC X(08) VALUE 'SMYFIL2'.           FDYNIOR
           02 SMYFIL2-IOM-NAME     PIC X(08) VALUE SPACES.              FDYNIOR
           02 SMYFIL2-IOM-ADCON    POINTER VALUE NULL.                  FDYNIOR
           02 SMYFIL2-IOM-ADCON2   POINTER VALUE NULL.                  FDYNIOR
           02 SMYFIL2-KEY-PTR      POINTER VALUE NULL.                  FDYNIOR
           02 SMYFIL2-KEY-REL      PIC X(08) VALUE SPACES.              FDYNIOR
      * THE REAL LRECL IS ACQUIRED BY I/O MODULE AT OPEN TIME           FDYNIOR
           02 SMYFIL2-DCB-LRECL    PIC S9(09) COMP VALUE 43.            FDYNIOR
      * INITIAL SIZE IS ACQUIRED BY I/O MODULE AT OPEN TIME             FDYNIOR
           02 SMYFIL2-RECORD-SIZE  PIC S9(09) COMP VALUE ZERO.          FDYNIOR
           02 SMYFIL2-RECORD-GSIZ  PIC S9(09) COMP VALUE 43.            FDYNIOR
           02 SMYFIL2-RECORD-TAIL  PIC S9(09) COMP VALUE ZERO.          FDYNIOR
           02 SMYFIL2-RECORD-KEYE  PIC S9(09) COMP VALUE ZERO.          FDYNIOR
           02 SMYFIL2-RECORD-VEND  PIC S9(09) COMP VALUE ZERO.          FDYNIOR
           02 SMYFIL2-IO-REQUEST   PIC X(08) VALUE SPACES.              FDYNIOR
           02 SMYFIL2-IO-REQTYPE   PIC X(08) VALUE SPACES.              FDYNIOR
           02 SMYFIL2-IO-ERCODE1   PIC X(02) VALUE ZEROS.               FDYNIOR
           02 SMYFIL2-IO-ERCODE2   PIC X(02) VALUE ZEROS.               FDYNIOR
           02 SMYFIL2-IO-VSMEMSG   PIC X(80) VALUE SPACES.              FDYNIOR
           02 SMYFIL2-IO-BITS0     PIC X(01) VALUE X'08'.               FDYNIOR
           02 SMYFIL2-IO-BITS1     PIC X(01) VALUE X'00'.               FDYNIOR
           02 SMYFIL2-IO-BUFNO     PIC S9(04) COMP VALUE 4.             FDYNIOR
           02 SMYFIL2-RECORD-PTR   POINTER VALUE NULL.                  FDYNIOR
           02 SMYFIL2-IOAREA-PTR   POINTER VALUE NULL.                  FDYNIOR
           02 SMYFIL2-IOAREA2-PTR  POINTER VALUE NULL.                  FDYNIOR
           02 SMYFIL2-VSERMOD-PTR  POINTER VALUE NULL.                  FDYNIOR
           02 SMYFIL2-IOAREA1-ADC  POINTER VALUE NULL.                  FDYNIOR
           02 SMYFIL2-IOM-ADCON0   POINTER VALUE NULL.                  FDYNIOR
           02 SMYFIL2-DCB-BLKSIZE  PIC S9(9) COMP VALUE ZERO.           FDYNIOR
           02 SMYFIL2-RECFM2       PIC X(1)  VALUE 'U'.                 FDYNIOR
           02 FILLER              PIC X(11) VALUE HIGH-VALUES.          FDYNIOR
                                                                        TBSERV
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI STATUS CODE AND MESSAGE FOR GLCODES-GLCODES-QAREA TABLE * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  GLCODES-ROWS               PIC S9(09) COMP VALUE +96.        TBSERV
       01  GLCODES-CROW               PIC S9(09) COMP VALUE ZEROS.      TBSERV
       01  GLCODES-LVLS               PIC S9(09) COMP VALUE +1.         TBSERV
       01  GLCODES-CLVL               PIC S9(09) COMP VALUE +1.         TBSERV
       01  GLCODES-WLVL               PIC S9(09) COMP VALUE ZEROS.      TBSERV
       01  GLCODES-FROW               PIC S9(09) COMP VALUE +96.        TBSERV
       01  GLCODES-FUNCTION           PIC X(08)         VALUE SPACES.   TBSERV
       01  GLCODES-IO-COUNT           PIC 9(09) COMP VALUE ZEROES.      TBSERV
       01  GLCODES-OPEN-TYPE          PIC X(01) VALUE 'I'.              TBSERV
           88 GLCODES-I-OPEN   VALUE 'I'.                               TBSERV
           88 GLCODES-O-OPEN   VALUE 'O'.                               TBSERV
       01  GLCODES-NULLS-FLAG         PIC X(01) VALUE '0'.              TBSERV
           88 GLCODES-NULLSOFF VALUE '1'.                               TBSERV
           88 GLCODES-NULLSON  VALUE '0'.                               TBSERV
       01  GLCODES-IOSW               PIC X(01) VALUE 'C'.              TBSERV
           88 GLCODES-OPEN     VALUE 'O'.                               TBSERV
           88 GLCODES-CLOSED   VALUE 'C'.                               TBSERV
       01  GLCODES-ACCEPT-FLAG        PIC X(01) VALUE 'Y'.              TBSERV
           88 ACCEPT-GLCODES-RECORD VALUE 'Y'.                          TBSERV
           88 BYPASS-GLCODES-RECORD VALUE 'B'.                          TBSERV
       01  GLCODES-MESSAGE.                                             TBSERV
           02 FILLER           PIC X(29)                                TBSERV
                               VALUE 'TABLE I/O ERROR, RETURN CODE='.   TBSERV
           02 GLCODES-STATUS   PIC X(02) VALUE ZEROS.                   TBSERV
              88 GLCODES-GOOD-OPEN VALUE '00'.                          TBSERV
              88 GLCODES-GOOD-IO   VALUE '00'.                          TBSERV
              88 END-OF-GLCODES    VALUE '10'.                          TBSERV
              88 GLCODES-NOT-FOUND VALUE '23'.                          TBSERV
              88 GLCODES-IO-ERROR  VALUE '20'.                          TBSERV
           02 FILLER           PIC X(16) VALUE ', TABLE=GLCODES'.       TBSERV
                                                                        TBSERV
       01  GLCODES-RECORD-SIZE-G.                                       TBSERV
           02 GLCODES-OPSYS         PIC X(03) VALUE 'MVS'.              TBSERV
           02 GLCODES-RECFM         PIC X(01) VALUE 'F'.                TBSERV
           02 GLCODES-DDNAME        PIC X(08) VALUE 'GLCODES'.          TBSERV
           02 GLCODES-FCB-ADCON     PIC 9(09) COMP.                     TBSERV
           02 GLCODES-RECORD-SIZE   PIC S9(09) COMP VALUE 12.           TBSERV
           02 GLCODES-RECORD-GSIZ   PIC S9(09) COMP VALUE 12.           TBSERV
           02 GLCODES-RECORD-TAIL   PIC S9(09) COMP VALUE 12.           TBSERV
           02 GLCODES-RECORD-KEYE   PIC S9(09) COMP VALUE ZERO.         TBSERV
                                                                        TBSERV
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS RETURN CODE AND MESSAGE FOR SYNCF3 FILE     * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  SYNCF3-IO-COUNT             PIC 9(09) COMP VALUE ZEROES.     NULLIOR
       01  SYNCF3-IOSW                 PIC X(01) VALUE 'C'.             NULLIOR
           88 SYNCF3-OPEN       VALUE 'O'.                              NULLIOR
           88 SYNCF3-CLOSED     VALUE 'C'.                              NULLIOR
       01  SYNCF3-ACCEPT-FLAG          PIC X(01) VALUE 'Y'.             NULLIOR
           88 ACCEPT-SYNCF3-RECORD VALUE 'Y'.                           NULLIOR
           88 BYPASS-SYNCF3-RECORD VALUE 'B'.                           NULLIOR
       01  SYNCF3-MESSAGE.                                              NULLIOR
           02 FILLER           PIC X(29)                                NULLIOR
                               VALUE 'FILE I/O ERROR, RETURN CODE='.    NULLIOR
           02 SYNCF3-STATUS     PIC X(02) VALUE SPACES.                 NULLIOR
              88 SYNCF3-GOOD-OPEN   VALUE '00' '97'.                    NULLIOR
              88 SYNCF3-GOOD-IO     VALUE '00' '04'.                    NULLIOR
              88 END-OF-SYNCF3      VALUE '10'.                         NULLIOR
              88 SYNCF3-NOT-FOUND   VALUE '23'.                         NULLIOR
              88 SYNCF3-IO-ERROR    VALUE '20'.                         NULLIOR
           02 FILLER            PIC X(16) VALUE ', FILE=SYNCF3'.        NULLIOR
                                                                        NULLIOR
       01  SYNCF3-RECORD-SIZE-G.                                        NULLIOR
           02 SYNCF3-DDNAME         PIC X(08) VALUE 'SYNCF3'.           NULLIOR
           02 SYNCF3-FCB-ADCON      PIC 9(09) COMP VALUE ZERO.          NULLIOR
           02 SYNCF3-RECORD-SIZE    PIC 9(05) COMP VALUE ZERO.          NULLIOR
           02 SYNCF3-RECORD-GSIZ    PIC 9(05) COMP VALUE ZERO.          NULLIOR
           02 SYNCF3-RECORD-TAIL    PIC 9(05) COMP VALUE ZERO.          NULLIOR
           02 SYNCF3-RECORD-KEYE    PIC 9(05) COMP VALUE ZERO.          NULLIOR
                                                                        NULLIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS RETURN CODE AND MESSAGE FOR TEMPWK1 FILE.   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  TEMPWK1-IO-COUNT      PIC 9(09) VALUE ZERO COMP.             GENFILE
       01  TEMPWK1-IOSW          PIC X(01) VALUE 'C'.                   GENFILE
           88 TEMPWK1-OPEN       VALUE 'O'.                             GENFILE
           88 TEMPWK1-CLOSED     VALUE 'C'.                             GENFILE
       01  TEMPWK1-ACCEPT-FLAG   PIC X(01) VALUE 'Y'.                   GENFILE
           88 ACCEPT-TEMPWK1-RECORD VALUE 'Y'.                          GENFILE
           88 BYPASS-TEMPWK1-RECORD VALUE 'B'.                          GENFILE
       01  TEMPWK1-MESSAGE.                                             GENFILE
           02 FILLER            PIC X(28)                               GENFILE
                                VALUE 'FILE I/O ERROR, RETURN CODE='.   GENFILE
           02 TEMPWK1-STATUS     PIC X(02) VALUE SPACES.                GENFILE
              88 TEMPWK1-GOOD-OPEN VALUE '00' '97'.                     GENFILE
              88 TEMPWK1-GOOD-IO   VALUE '00' '04'.                     GENFILE
              88 END-OF-TEMPWK1    VALUE '10'.                          GENFILE
           02 FILLER            PIC X(16) VALUE ', FILE=TEMPWK1'.       GENFILE
                                                                        GENFILE
       01  TEMPWK1-RECORD-SIZE-G.                                       GENFILE
           02 TEMPWK1-OPSYS         PIC X(03) VALUE 'MVS'.              GENFILE
           02 TEMPWK1-RECFM         PIC X(01) VALUE 'F'.                GENFILE
           02 TEMPWK1-DDNAME        PIC X(08) VALUE 'TEMPWK1'.          GENFILE
           02 TEMPWK1-FCB-ADCON     PIC 9(09) COMP VALUE ZERO.          GENFILE
           02 TEMPWK1-RECORD-SIZE   PIC  9(09) COMP VALUE ZERO.         GENFILE
           02 TEMPWK1-RECORD-GSIZ   PIC S9(09) COMP VALUE ZEROS.        CCGSORT
           02 TEMPWK1-RECORD-KEYE   PIC S9(09) COMP VALUE ZEROS.        CCGSORT
                                                                        CCGSORT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS RETURN CODE AND MESSAGE FOR SORTFL1 FILE.   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  SORTFL1-IO-COUNT      PIC 9(09) VALUE ZERO COMP.             GENFILE
       01  SORTFL1-IOSW          PIC X(01) VALUE 'C'.                   GENFILE
           88 SORTFL1-OPEN       VALUE 'O'.                             GENFILE
           88 SORTFL1-CLOSED     VALUE 'C'.                             GENFILE
       01  SORTFL1-ACCEPT-FLAG   PIC X(01) VALUE 'Y'.                   GENFILE
           88 ACCEPT-SORTFL1-RECORD VALUE 'Y'.                          GENFILE
           88 BYPASS-SORTFL1-RECORD VALUE 'B'.                          GENFILE
       01  SORTFL1-MESSAGE.                                             GENFILE
           02 FILLER            PIC X(28)                               GENFILE
                                VALUE 'FILE I/O ERROR, RETURN CODE='.   GENFILE
           02 SORTFL1-STATUS     PIC X(02) VALUE SPACES.                GENFILE
              88 SORTFL1-GOOD-OPEN VALUE '00' '97'.                     GENFILE
              88 SORTFL1-GOOD-IO   VALUE '00' '04'.                     GENFILE
              88 END-OF-SORTFL1    VALUE '10'.                          GENFILE
           02 FILLER            PIC X(16) VALUE ', FILE=SORTFL1'.       GENFILE
                                                                        GENFILE
       01  SORTFL1-RECORD-SIZE-G.                                       GENFILE
           02 SORTFL1-OPSYS         PIC X(03) VALUE 'MVS'.              GENFILE
           02 SORTFL1-RECFM         PIC X(01) VALUE 'F'.                GENFILE
           02 SORTFL1-DDNAME        PIC X(08) VALUE 'SORTFL1'.          GENFILE
           02 SORTFL1-FCB-ADCON     PIC 9(09) COMP VALUE ZERO.          GENFILE
           02 SORTFL1-RECORD-SIZE   PIC  9(09) COMP VALUE ZERO.         GENFILE
           02 SORTFL1-RECORD-GSIZ   PIC S9(09) COMP VALUE ZEROS.        CCGSORT
           02 SORTFL1-RECORD-KEYE   PIC S9(09) COMP VALUE ZEROS.        CCGSORT
                                                                        CCGSORT
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
                                                                        GENFILE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS RETURN CODE AND MESSAGE FOR TEMPWK2 FILE.   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  TEMPWK2-IO-COUNT      PIC 9(09) VALUE ZERO COMP.             GENFILE
       01  TEMPWK2-IOSW          PIC X(01) VALUE 'C'.                   GENFILE
           88 TEMPWK2-OPEN       VALUE 'O'.                             GENFILE
           88 TEMPWK2-CLOSED     VALUE 'C'.                             GENFILE
       01  TEMPWK2-ACCEPT-FLAG   PIC X(01) VALUE 'Y'.                   GENFILE
           88 ACCEPT-TEMPWK2-RECORD VALUE 'Y'.                          GENFILE
           88 BYPASS-TEMPWK2-RECORD VALUE 'B'.                          GENFILE
       01  TEMPWK2-MESSAGE.                                             GENFILE
           02 FILLER            PIC X(28)                               GENFILE
                                VALUE 'FILE I/O ERROR, RETURN CODE='.   GENFILE
           02 TEMPWK2-STATUS     PIC X(02) VALUE SPACES.                GENFILE
              88 TEMPWK2-GOOD-OPEN VALUE '00' '97'.                     GENFILE
              88 TEMPWK2-GOOD-IO   VALUE '00' '04'.                     GENFILE
              88 END-OF-TEMPWK2    VALUE '10'.                          GENFILE
           02 FILLER            PIC X(16) VALUE ', FILE=TEMPWK2'.       GENFILE
                                                                        GENFILE
       01  TEMPWK2-RECORD-SIZE-G.                                       GENFILE
           02 TEMPWK2-OPSYS         PIC X(03) VALUE 'MVS'.              GENFILE
           02 TEMPWK2-RECFM         PIC X(01) VALUE 'F'.                GENFILE
           02 TEMPWK2-DDNAME        PIC X(08) VALUE 'TEMPWK2'.          GENFILE
           02 TEMPWK2-FCB-ADCON     PIC 9(09) COMP VALUE ZERO.          GENFILE
           02 TEMPWK2-RECORD-SIZE   PIC  9(09) COMP VALUE ZERO.         GENFILE
           02 TEMPWK2-RECORD-GSIZ   PIC S9(09) COMP VALUE ZEROS.        CCGSORT
           02 TEMPWK2-RECORD-KEYE   PIC S9(09) COMP VALUE ZEROS.        CCGSORT
                                                                        CCGSORT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI FILE STATUS RETURN CODE AND MESSAGE FOR SORTFL2 FILE.   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  SORTFL2-IO-COUNT      PIC 9(09) VALUE ZERO COMP.             GENFILE
       01  SORTFL2-IOSW          PIC X(01) VALUE 'C'.                   GENFILE
           88 SORTFL2-OPEN       VALUE 'O'.                             GENFILE
           88 SORTFL2-CLOSED     VALUE 'C'.                             GENFILE
       01  SORTFL2-ACCEPT-FLAG   PIC X(01) VALUE 'Y'.                   GENFILE
           88 ACCEPT-SORTFL2-RECORD VALUE 'Y'.                          GENFILE
           88 BYPASS-SORTFL2-RECORD VALUE 'B'.                          GENFILE
       01  SORTFL2-MESSAGE.                                             GENFILE
           02 FILLER            PIC X(28)                               GENFILE
                                VALUE 'FILE I/O ERROR, RETURN CODE='.   GENFILE
           02 SORTFL2-STATUS     PIC X(02) VALUE SPACES.                GENFILE
              88 SORTFL2-GOOD-OPEN VALUE '00' '97'.                     GENFILE
              88 SORTFL2-GOOD-IO   VALUE '00' '04'.                     GENFILE
              88 END-OF-SORTFL2    VALUE '10'.                          GENFILE
           02 FILLER            PIC X(16) VALUE ', FILE=SORTFL2'.       GENFILE
                                                                        GENFILE
       01  SORTFL2-RECORD-SIZE-G.                                       GENFILE
           02 SORTFL2-OPSYS         PIC X(03) VALUE 'MVS'.              GENFILE
           02 SORTFL2-RECFM         PIC X(01) VALUE 'F'.                GENFILE
           02 SORTFL2-DDNAME        PIC X(08) VALUE 'SORTFL2'.          GENFILE
           02 SORTFL2-FCB-ADCON     PIC 9(09) COMP VALUE ZERO.          GENFILE
           02 SORTFL2-RECORD-SIZE   PIC  9(09) COMP VALUE ZERO.         GENFILE
           02 SORTFL2-RECORD-GSIZ   PIC S9(09) COMP VALUE ZEROS.        CCGSORT
           02 SORTFL2-RECORD-KEYE   PIC S9(09) COMP VALUE ZEROS.        CCGSORT
                                                                        CCGSORT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 INTERNAL WORK REGISTERS.                         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  MATCH1-COMPARE-FLAG        PIC X VALUE SPACES.               EXTRACT
           88 MATCH1-OLD-LOW          VALUE 'L'.                        EXTRACT
           88 MATCH1-OLD-HIGH         VALUE 'H'.                        EXTRACT
           88 MATCH1-OLD-EQ-NEW       VALUE 'E'.                        EXTRACT
           88 MATCH1-TERMINATED       VALUE 'T'.                        EXTRACT
                                                                        EXTRACT
       01  MATCH1-OLD-GROUP.                                            EXTRACT
           02 M01-OLD-SMY2-CRITERIA            PIC 9(5).                EXTRACT
           02 M01-OLD-SMY2-BANK                PIC 9(2).                EXTRACT
           02 M01-OLD-SMY2-BRANCH              PIC 9(5).                EXTRACT
           02 M01-OLD-SMY2-TYPE                PIC X(5).                EXTRACT
           02 M01-OLD-SMY2-DATE                PIC 9(6).                EXTRACT
                                                                        EXTRACT
       01  MATCH1-NEW-GROUP.                                            EXTRACT
           02 M01-NEW-SMY2-CRITERIA            PIC 9(5).                EXTRACT
           02 M01-NEW-SMY2-BANK                PIC 9(2).                EXTRACT
           02 M01-NEW-SMY2-BRANCH              PIC 9(5).                EXTRACT
           02 M01-NEW-SMY2-TYPE                PIC X(5).                EXTRACT
           02 M01-NEW-SMY2-DATE                PIC 9(6).                EXTRACT
                                                                        EXTRACT
       01  MATCH1-IO-ADJUSTERS.                                         EXTRACT
           02 MATCH1-SMYFIL2-IO-COUNT  PIC S9(04) COMP VALUE +0.        EXTRACT
           02 MATCH1-SMYFIL2-IO-SAVE1.                                  EXTRACT
              05 MATCH1-SMYFIL2-IO-LRECL1 PIC S9(09) COMP VALUE +0.     EXTRACT
              05 MATCH1-SMYFIL2-IO-VEND1  PIC S9(09) COMP VALUE +0.     EXTRACT
              05 MATCH1-SMYFIL2-IO-TAIL1  PIC S9(09) COMP VALUE +0.     EXTRACT
           02 MATCH1-SMYFIL2-IO-SAVE2.                                  EXTRACT
              05 MATCH1-SMYFIL2-IO-LRECL2 PIC S9(09) COMP VALUE +0.     EXTRACT
              05 MATCH1-SMYFIL2-IO-VEND2  PIC S9(09) COMP VALUE +0.     EXTRACT
              05 MATCH1-SMYFIL2-IO-TAIL2  PIC S9(09) COMP VALUE +0.     EXTRACT
           02 MATCH1-SMYFIL-IO-COUNT  PIC S9(04) COMP VALUE +0.         EXTRACT
           02 MATCH1-SMYFIL-IO-SAVE1.                                   EXTRACT
              05 MATCH1-SMYFIL-IO-LRECL1 PIC S9(09) COMP VALUE +0.      EXTRACT
              05 MATCH1-SMYFIL-IO-VEND1  PIC S9(09) COMP VALUE +0.      EXTRACT
              05 MATCH1-SMYFIL-IO-TAIL1  PIC S9(09) COMP VALUE +0.      EXTRACT
           02 MATCH1-SMYFIL-IO-SAVE2.                                   EXTRACT
              05 MATCH1-SMYFIL-IO-LRECL2 PIC S9(09) COMP VALUE +0.      EXTRACT
              05 MATCH1-SMYFIL-IO-VEND2  PIC S9(09) COMP VALUE +0.      EXTRACT
              05 MATCH1-SMYFIL-IO-TAIL2  PIC S9(09) COMP VALUE +0.      EXTRACT
                                                                        EXTRACT
       01  MATCH1-SELECT-FLAGS.                                         EXTRACT
           02 MATCH1-SMYFIL2-SELECT-FLAG PIC X VALUE SPACES.            EXTRACT
              88 MATCH1-SMYFIL2-SELECTED VALUE 'Y'.                     EXTRACT
              88 MATCH1-SMYFIL2-QUEUED   VALUE 'Q'.                     EXTRACT
           02 MATCH1-SMYFIL-SELECT-FLAG PIC X VALUE SPACES.             EXTRACT
              88 MATCH1-SMYFIL-SELECTED VALUE 'Y'.                      EXTRACT
              88 MATCH1-SMYFIL-QUEUED   VALUE 'Q'.                      EXTRACT
                                                                        EXTRACT
       01  MATCH1-FLAG-AREAS.                                           EXTRACT
           88 END-OF-MATCH1-INPUT VALUE LOW-VALUES.                     EXTRACT
           02 MATCH1-SMYFIL2-ACCEPT-FLAG PIC X VALUE SPACES.            EXTRACT
              88 MATCH1-SMYFIL2-ACCEPTED VALUE 'A'.                     EXTRACT
              88 MATCH1-SMYFIL2-READ-ON  VALUE 'R'.                     EXTRACT
           02 MATCH1-SMYFIL-ACCEPT-FLAG PIC X VALUE SPACES.             EXTRACT
              88 MATCH1-SMYFIL-ACCEPTED VALUE 'A'.                      EXTRACT
              88 MATCH1-SMYFIL-READ-ON  VALUE 'R'.                      EXTRACT
                                                                        EXTRACT
       01  MATCH1-SAVE-AREAS.                                           EXTRACT
           02 M01-SAV-SMY2-CRITERIA            PIC 9(5)                 EXTRACT
                                              VALUE ZEROES.             EXTRACT
           02 M01-SAV-SMY2-BANK                PIC 9(2)                 EXTRACT
                                              VALUE ZEROES.             EXTRACT
           02 M01-SAV-SMY2-BRANCH              PIC 9(5)                 EXTRACT
                                              VALUE ZEROES.             EXTRACT
           02 M01-SAV-SMY2-TYPE                PIC X(5)                 EXTRACT
                                              VALUE LOW-VALUES.         EXTRACT
           02 M01-SAV-SMY2-DATE                PIC 9(6)                 EXTRACT
                                              VALUE ZEROES.             EXTRACT
           02 M01-SAV-SMY-CRITERIA             PIC 9(5)                 EXTRACT
                                              VALUE ZEROES.             EXTRACT
           02 M01-SAV-SMY-BANK                 PIC 9(2)                 EXTRACT
                                              VALUE ZEROES.             EXTRACT
           02 M01-SAV-SMY-BRANCH               PIC 9(5)                 EXTRACT
                                              VALUE ZEROES.             EXTRACT
           02 M01-SAV-SMY-TYPE                 PIC X(5)                 EXTRACT
                                              VALUE LOW-VALUES.         EXTRACT
           02 M01-SAV-SMY-DATE                 PIC 9(6)                 EXTRACT
                                              VALUE ZEROES.             EXTRACT
       01  MATCH1-ALL-MATCH-SAVE        PIC X VALUE SPACES.             EXTRACT
       01  MATCH1-ALL-MATCH-FLAG        PIC X VALUE SPACES.             EXTRACT
           88 MATCH1-ALL-MATCHED          VALUE 'Y'.                    EXTRACT
       01  MATCH1-PROCESSED-FLAGS.                                      EXTRACT
           02 MATCH1-SMYFIL2-STATUS     PIC XX VALUE SPACES.            EXTRACT
           02 MATCH1-SMYFIL-STATUS     PIC XX VALUE SPACES.             EXTRACT
                                                                        EXTRACT
       01  MATCH1-SMYFIL2-SYNCH.                                        EXTRACT
           02 MATCH1-SMYFIL2-DUP-FLAG     PIC X VALUE SPACES.           EXTRACT
              88 MATCH1-SMYFIL2-DUP         VALUE 'Y'.                  EXTRACT
           02 MATCH1-SMYFIL2-1ST-FLAG     PIC X VALUE SPACES.           EXTRACT
              88 MATCH1-SMYFIL2-1ST         VALUE 'Y'.                  EXTRACT
           02 MATCH1-SMYFIL2-LAST-FLAG    PIC X VALUE SPACES.           EXTRACT
              88 MATCH1-SMYFIL2-LAST        VALUE 'Y'.                  EXTRACT
                                                                        EXTRACT
       01  MATCH1-SMYFIL2-SYNCH2.                                       EXTRACT
           02 MATCH1-SMYFIL2-DUP-FLAG2    PIC X VALUE SPACES.           EXTRACT
              88 MATCH1-SMYFIL2-DUP-W       VALUE 'Y'.                  EXTRACT
           02 MATCH1-SMYFIL2-1ST-FLAG2    PIC X VALUE SPACES.           EXTRACT
              88 MATCH1-SMYFIL2-1ST-W       VALUE 'Y'.                  EXTRACT
           02 MATCH1-SMYFIL2-LAST-FLAG2   PIC X VALUE SPACES.           EXTRACT
              88 MATCH1-SMYFIL2-LAST-W      VALUE 'Y'.                  EXTRACT
                                                                        EXTRACT
       01  MATCH1-SMYFIL-SYNCH.                                         EXTRACT
           02 MATCH1-SMYFIL-DUP-FLAG     PIC X VALUE SPACES.            EXTRACT
              88 MATCH1-SMYFIL-DUP         VALUE 'Y'.                   EXTRACT
           02 MATCH1-SMYFIL-1ST-FLAG     PIC X VALUE SPACES.            EXTRACT
              88 MATCH1-SMYFIL-1ST         VALUE 'Y'.                   EXTRACT
           02 MATCH1-SMYFIL-LAST-FLAG    PIC X VALUE SPACES.            EXTRACT
              88 MATCH1-SMYFIL-LAST        VALUE 'Y'.                   EXTRACT
                                                                        EXTRACT
       01  MATCH1-SMYFIL-SYNCH2.                                        EXTRACT
           02 MATCH1-SMYFIL-DUP-FLAG2    PIC X VALUE SPACES.            EXTRACT
              88 MATCH1-SMYFIL-DUP-W       VALUE 'Y'.                   EXTRACT
           02 MATCH1-SMYFIL-1ST-FLAG2    PIC X VALUE SPACES.            EXTRACT
              88 MATCH1-SMYFIL-1ST-W       VALUE 'Y'.                   EXTRACT
           02 MATCH1-SMYFIL-LAST-FLAG2   PIC X VALUE SPACES.            EXTRACT
              88 MATCH1-SMYFIL-LAST-W      VALUE 'Y'.                   EXTRACT
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
           02 REPORT1-PENGI-CTLIDL  PIC S9(09) COMP VALUE 18.           GENERATQ
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
           02 REPORT1-HEADER-LINES PIC S9(09) COMP VALUE 2.             GENERATQ
                                                                        GENERATQ
           02 REPORT1-CTL-LEVEL PIC 9(03) COMP-3 VALUE ZERO.            GENERATQ
              88 R01-BRK-FINAL VALUE 1.                                 GENERATQ
              88 R01-BRK-CRITERIA VALUE 2.                              GENERATQ
              88 R01-BRK-T-BANK VALUE 3.                                GENERATQ
              88 R01-BRK-W-ASSIGNMENT VALUE 4.                          GENERATQ
              88 R01-BRK-WORK-TYPE VALUE 5.                             GENERATQ
              88 R01-BRK-ACCR-DATE VALUE 6.                             GENERATQ
           02 REPORT1-BREAK-LEVL  PIC S9(04) COMP VALUE ZERO.           GENERATQ
              88 R01-HBR-FINAL VALUE 6.                                 GENERATQ
              88 R01-HBR-CRITERIA VALUE 5.                              GENERATQ
              88 R01-HBR-T-BANK VALUE 4.                                GENERATQ
              88 R01-HBR-W-ASSIGNMENT VALUE 3.                          GENERATQ
              88 R01-HBR-WORK-TYPE VALUE 2.                             GENERATQ
              88 R01-HBR-ACCR-DATE VALUE 1.                             GENERATQ
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI INTERNALLY GENERATED REPORT1 SAVE AREAS.                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  REPORT1-SAVE-AREAS.                                          GENERATQ
           02 R01-SAV-CRITERIA                  PIC S9(5)               GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R01-TXT-CRITERIA.                                         GENERATQ
              03 R01-EDT-CRITERIA               PIC 9(5)                GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R01-SAV-T-BANK                    PIC S9(2)               GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R01-TXT-T-BANK.                                           GENERATQ
              03 R01-EDT-T-BANK                 PIC 9(2)                GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R01-SAV-W-ASSIGNMENT              PIC S9(5)               GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R01-TXT-W-ASSIGNMENT.                                     GENERATQ
              03 R01-EDT-W-ASSIGNMENT           PIC 9(5)                GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R01-SAV-WORK-TYPE                 PIC X(5)                GENERATQ
                                     VALUE LOW-VALUES.                  GENERATQ
           02 R01-TXT-WORK-TYPE.                                        GENERATQ
              03 R01-EDT-WORK-TYPE              PIC X(5)                GENERATQ
                                     VALUE LOW-VALUES.                  GENERATQ
           02 R01-SAV-ACCR-DATE                 PIC S9(6)               GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R01-TXT-ACCR-DATE.                                        GENERATQ
              03 R01-EDT-ACCR-DATE              PIC 9(6)                GENERATQ
                                     VALUE ZEROES.                      GENERATQ
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI INTERNALLY GENERATED REPORT1 CTL BREAK BUCKETS          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
                                                                        GENERATQ
       01  REPORT1-LEVEL0-BUCKETS COMP-3.                               GENERATQ
           02 R01-LV0-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
           02 R01-LV0-W-AMOUNT               PIC S9(17)V9(2)  VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT1-LEVEL1-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R01-LV1-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R01-LV1-W-AMOUNT               PIC S9(17)V9(2)  VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT1-LEVEL2-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R01-LV2-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R01-LV2-W-AMOUNT               PIC S9(17)V9(2)  VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT1-LEVEL3-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R01-LV3-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R01-LV3-W-AMOUNT               PIC S9(17)V9(2)  VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT1-LEVEL4-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R01-LV4-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R01-LV4-W-AMOUNT               PIC S9(17)V9(2)  VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT1-LEVEL5-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R01-LV5-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R01-LV5-W-AMOUNT               PIC S9(17)V9(2)  VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT1-LEVEL6-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R01-LV6-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R01-LV6-W-AMOUNT               PIC S9(17)V9(2)  VALUE +0. GENERATQ
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI INTERNALLY GENERATED HD2-F01-CF01 HEADER LAYOUT.        * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  HD2-F01-CF01.                                                GENERATQ
           02 FILLER            PIC X(58) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(04) VALUE 'TYPE'.                 GENERATQ
      *,PENGI - THE COMPUTED LENGTH FOR HD2-F01-CF01 IS 62
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI INTERNALLY GENERATED HD1-F01-CF01 HEADER LAYOUT.        * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  HD1-F01-CF01.                                                GENERATQ
           02 FILLER            PIC X(20) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(08) VALUE 'CRITERIA'.             GENERATQ
           02 FILLER            PIC X(03) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(06) VALUE 'T-BANK'.               GENERATQ
           02 FILLER            PIC X(03) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(15) VALUE 'ASSIGNMENT UNIT'.      GENERATQ
           02 FILLER            PIC X(03) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(04) VALUE 'CODE'.                 GENERATQ
           02 FILLER            PIC X(04) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(09) VALUE 'ACCR-DATE'.            GENERATQ
           02 FILLER            PIC X(11) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(08) VALUE 'W-AMOUNT'.             GENERATQ
           02 FILLER            PIC X(11) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(05) VALUE 'TALLY'.                GENERATQ
      *,PENGI - THE COMPUTED LENGTH FOR HD1-F01-CF01 IS 110
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED REPORT2 REPORT STORAGE AREAS.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
       01  PENGI-REPORT2-GROUP.                                         GENERATQ
           02 REPORT2-DEBUGID   PIC X(02) VALUE ' '.                    GENERATQ
           02 REPORT2-DEBUGID-N REDEFINES                               GENERATQ
              REPORT2-DEBUGID   PIC 9(02).                              GENERATQ
           02 REPORT2-LINE0     PIC S9(09) COMP   VALUE 58.             GENERATQ
           02 REPORT2-LMAX0     PIC S9(09) COMP   VALUE 59.             GENERATQ
           02 REPORT2-LMAX1     PIC S9(09) COMP   VALUE 58.             GENERATQ
           02 REPORT2-LMAX2     PIC S9(09) COMP   VALUE 57.             GENERATQ
           02 REPORT2-LMAX3     PIC S9(09) COMP   VALUE 56.             GENERATQ
           02 REPORT2-LORPH     PIC S9(09) COMP   VALUE 0.              GENERATQ
           02 REPORT2-PAGE0     PIC 9(07) COMP-3 VALUE ZERO.            GENERATQ
           02 REPORT2-COUNT     PIC 9(11) COMP-3 VALUE ZERO.            GENERATQ
           02 REPORT2-CNTRL     PIC X(01)        VALUE SPACES.          GENERATQ
           02 REPORT2-FOOTSW    PIC X(01)        VALUE 'N'.             GENERATQ
              88 REPORT2-FOOTON VALUE 'Y'.                              GENERATQ
           02 REPORT2-PENGI-CTL  PIC X(64) JUST RIGHT VALUE SPACES.     GENERATQ
           02 REPORT2-PENGI-CTLID PIC X(64) JUST RIGHT VALUE SPACES.    GENERATQ
           02 REPORT2-PENGI-CTLIDL  PIC S9(09) COMP VALUE 18.           GENERATQ
           02 REPORT2-PENGI-CTLDISP PIC S9(09) COMP VALUE ZERO.         GENERATQ
           02 REPORT2-PENGI-FIRST-SW PIC X(01) VALUE 'S'.               GENERATQ
              88 REPORT2-FIRST-DETAIL  VALUE 'S' 'H'.                   GENERATQ
              88 REPORT2-AFTER-BREAK   VALUE 'S'.                       GENERATQ
              88 REPORT2-NO1ST-DETAIL  VALUE 'N'.                       GENERATQ
           02 REPORT2-PAGE-RENUM-SW    PIC X(01) VALUE SPACE.           GENERATQ
              88 REPORT2-PAGE-RENUM   VALUE 'Y'.                        GENERATQ
           02 REPORT2-LSEQ-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-ADV-CNTRL  PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-PAGE-SIZE  PIC S9(09) COMP VALUE 58.              GENERATQ
           02 REPORT2-DSPL-SIZE  PIC S9(09) COMP VALUE 66.              GENERATQ
           02 REPORT2-CSKP-CNTRL PIC S9(09) COMP VALUE 1.               GENERATQ
           02 REPORT2-LNXT-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
      *,REPORT2-LGRP-CNTRL = THE NUMBER OF LINES IN DTL LINES GROUP
           02 REPORT2-LGRP-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-L1ST-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-LSAV-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-DSKP-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-RSKP-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-WSKP-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-HSKP-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-HOFF-CNTRL PIC S9(09) COMP VALUE 1.               GENERATQ
           02 REPORT2-PNXT-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-PADV-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-PADJ-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-FINL-CNTRL PIC X VALUE 'N'.                       GENERATQ
           02 REPORT2-PFOOT-LEVL PIC 9(03) COMP-3 VALUE ZERO.           GENERATQ
                                                                        GENERATQ
           02 REPORT2-PSKP-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-LXIT-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-DADV-CNTRL PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-RXIT-IO    PIC S9(09) COMP VALUE ZEROS.           GENERATQ
           02 REPORT2-PENGI-RECORD PIC X(132).                          GENERATQ
           02 REPORT2-HEADER-LINES PIC S9(09) COMP VALUE 2.             GENERATQ
                                                                        GENERATQ
           02 REPORT2-CTL-LEVEL PIC 9(03) COMP-3 VALUE ZERO.            GENERATQ
              88 R02-BRK-FINAL VALUE 1.                                 GENERATQ
              88 R02-BRK-CRITERIA VALUE 2.                              GENERATQ
              88 R02-BRK-W-BANK VALUE 3.                                GENERATQ
              88 R02-BRK-W-ASSIGNMENT VALUE 4.                          GENERATQ
              88 R02-BRK-WORK-TYPE VALUE 5.                             GENERATQ
              88 R02-BRK-ACCR-DATE VALUE 6.                             GENERATQ
           02 REPORT2-BREAK-LEVL  PIC S9(04) COMP VALUE ZERO.           GENERATQ
              88 R02-HBR-FINAL VALUE 6.                                 GENERATQ
              88 R02-HBR-CRITERIA VALUE 5.                              GENERATQ
              88 R02-HBR-W-BANK VALUE 4.                                GENERATQ
              88 R02-HBR-W-ASSIGNMENT VALUE 3.                          GENERATQ
              88 R02-HBR-WORK-TYPE VALUE 2.                             GENERATQ
              88 R02-HBR-ACCR-DATE VALUE 1.                             GENERATQ
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI INTERNALLY GENERATED REPORT2 SAVE AREAS.                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  REPORT2-SAVE-AREAS.                                          GENERATQ
           02 R02-SAV-CRITERIA                  PIC S9(5)               GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R02-TXT-CRITERIA.                                         GENERATQ
              03 R02-EDT-CRITERIA               PIC 9(5)                GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R02-SAV-W-BANK                    PIC S9(2)               GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R02-TXT-W-BANK.                                           GENERATQ
              03 R02-EDT-W-BANK                 PIC 9(2)                GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R02-SAV-W-ASSIGNMENT              PIC S9(5)               GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R02-TXT-W-ASSIGNMENT.                                     GENERATQ
              03 R02-EDT-W-ASSIGNMENT           PIC 9(5)                GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R02-SAV-WORK-TYPE                 PIC X(5)                GENERATQ
                                     VALUE LOW-VALUES.                  GENERATQ
           02 R02-TXT-WORK-TYPE.                                        GENERATQ
              03 R02-EDT-WORK-TYPE              PIC X(5)                GENERATQ
                                     VALUE LOW-VALUES.                  GENERATQ
           02 R02-SAV-ACCR-DATE                 PIC S9(6)               GENERATQ
                                     VALUE ZEROES.                      GENERATQ
           02 R02-TXT-ACCR-DATE.                                        GENERATQ
              03 R02-EDT-ACCR-DATE              PIC 9(6)                GENERATQ
                                     VALUE ZEROES.                      GENERATQ
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI INTERNALLY GENERATED REPORT2 CTL BREAK BUCKETS          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
                                                                        GENERATQ
       01  REPORT2-LEVEL0-BUCKETS COMP-3.                               GENERATQ
           02 R02-LV0-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
           02 R02-LV0-W-AMOUNT               PIC S9(17)V9(2)  VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT2-LEVEL1-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R02-LV1-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R02-LV1-W-AMOUNT               PIC S9(17)V9(2)  VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT2-LEVEL2-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R02-LV2-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R02-LV2-W-AMOUNT               PIC S9(17)V9(2)  VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT2-LEVEL3-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R02-LV3-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R02-LV3-W-AMOUNT               PIC S9(17)V9(2)  VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT2-LEVEL4-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R02-LV4-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R02-LV4-W-AMOUNT               PIC S9(17)V9(2)  VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT2-LEVEL5-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R02-LV5-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R02-LV5-W-AMOUNT               PIC S9(17)V9(2)  VALUE +0. GENERATQ
                                                                        GENERATQ
       01  REPORT2-LEVEL6-BUCKETS COMP-3.                               GENERATQ
      * GENQ: S9(19) ?                                                  GENERATQ
           02 R02-LV6-PENGI-COUNT            PIC S9(19)       VALUE +0. GENERATQ
      * GENQ: S9(17)V9(2) ?                                             GENERATQ
           02 R02-LV6-W-AMOUNT               PIC S9(17)V9(2)  VALUE +0. GENERATQ
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI INTERNALLY GENERATED HD2-F02-CF01 HEADER LAYOUT.        * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  HD2-F02-CF01.                                                GENERATQ
           02 FILLER            PIC X(57) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(04) VALUE 'TYPE'.                 GENERATQ
      *,PENGI - THE COMPUTED LENGTH FOR HD2-F02-CF01 IS 61
                                                                        GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI INTERNALLY GENERATED HD1-F02-CF01 HEADER LAYOUT.        * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  HD1-F02-CF01.                                                GENERATQ
           02 FILLER            PIC X(21) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(08) VALUE 'CRITERIA'.             GENERATQ
           02 FILLER            PIC X(03) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(04) VALUE 'BANK'.                 GENERATQ
           02 FILLER            PIC X(03) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(15) VALUE 'ASSIGNMENT UNIT'.      GENERATQ
           02 FILLER            PIC X(03) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(04) VALUE 'CODE'.                 GENERATQ
           02 FILLER            PIC X(04) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(09) VALUE 'ACCR-DATE'.            GENERATQ
           02 FILLER            PIC X(11) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(08) VALUE 'W-AMOUNT'.             GENERATQ
           02 FILLER            PIC X(11) VALUE SPACES.                 GENERATQ
           02 FILLER            PIC X(05) VALUE 'TALLY'.                GENERATQ
      *,PENGI - THE COMPUTED LENGTH FOR HD1-F02-CF01 IS 109
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
           02 WS-PENGI-EDIT-5-0-1  PIC 99999-.                          CHKOVF0
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
                 04 WS-PENGI-ESPI-TEMPWK1.                              PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'STATIC'.              PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'TEMPWK1'.             PENGIEND
                 04 WS-PENGI-ESPI-SORTFL1.                              PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'STATIC'.              PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'SORTFL1'.             PENGIEND
                 04 WS-PENGI-ESPI-SYSPRINT.                             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'STATIC'.              PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'SYSPRINT'.            PENGIEND
                 04 WS-PENGI-ESPI-TEMPWK2.                              PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'STATIC'.              PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'TEMPWK2'.             PENGIEND
                 04 WS-PENGI-ESPI-SORTFL2.                              PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'STATIC'.              PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'SORTFL2'.             PENGIEND
                 04 WS-PENGI-ESPI-1-M8104D.                             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'DYNAMIC'.             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'M8104D'.              PENGIEND
                 04 WS-PENGI-ESPI-2-M8124D.                             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'DYNAMIC'.             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'M8124D'.              PENGIEND
                 04 WS-PENGI-ESPI-3-M8134D.                             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'DYNAMIC'.             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'M8134D'.              PENGIEND
                 04 WS-PENGI-ESPI-4-M8234D.                             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'DYNAMIC'.             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'M8234D'.              PENGIEND
                 04 WS-PENGI-ESPI-5-ACH.                                PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'DYNAMIC'.             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'ACH'.                 PENGIEND
                 04 WS-PENGI-ESPI-6-ME7231.                             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'DYNAMIC'.             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'ME7231'.              PENGIEND
                 04 WS-PENGI-ESPI-7-ME7232.                             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'DYNAMIC'.             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'ME7232'.              PENGIEND
                 04 WS-PENGI-ESPI-8-SMYFIL.                             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'DYNAMIC'.             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'SMYFIL'.              PENGIEND
                 04 WS-PENGI-ESPI-9-SMYFIL2.                            PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'DYNAMIC'.             PENGIEND
                    05 FILLER   PIC  X(08) VALUE 'SMYFIL2'.             PENGIEND
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
      * PENGI RECORD STORAGE DEFINITION FOR M8104D-IO-AREA.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  M8104D-IO-AREA.                                              DEFINE
           02 FILLER PIC X                                              DEFINE
                     OCCURS 0 TO 32767 TIMES                            DEFINE
                     DEPENDING ON M8104D-RECORD-TAIL.                   DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR M8104D-IO-AREA IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR M8104D-RECORD.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  M8104D-RECORD.                                               DEFINE
           02 M8104D-GRECORD.                                           DEFINE
              03 FILLER                 PIC X(1).                       DEFINE
              03 CS-KEY                 PIC X(30).                      DEFINE
              03 FILLER                 PIC X(269).                     DEFINE
           02 FILLER REDEFINES M8104D-GRECORD.                          DEFINE
              03 CS-001-DEL-CODE        PIC X(1).                       DEFINE
              03 CS-006-REC-CODE        PIC 9(3).                       DEFINE
              03 FILLER                 PIC X(296).                     DEFINE
           02 FILLER REDEFINES M8104D-GRECORD.                          DEFINE
              03 CSH001-DEL-CODE        PIC X(1).                       DEFINE
              03 CSH006-REC-CODE        PIC 9(3).                       DEFINE
              03 CSH008-BAN-NUM         PIC 9(2).                       DEFINE
              03 CSH009-APP-CODE        PIC 9(1).                       DEFINE
              03 FILLER                 PIC X(6).                       DEFINE
              03 CSH014-SEQ-NUM         PIC 9(2).                       DEFINE
              03 FILLER                 PIC X(16).                      DEFINE
              03 CSH030-CUR-DATE        PIC 9(6).                       DEFINE
              03 CSH032-NEX-DATE        PIC 9(6).                       DEFINE
              03 CSH036-LAS-DATE        PIC 9(6).                       DEFINE
              03 FILLER                 PIC X(17).                      DEFINE
              03 CSH050-BANK-NAME       PIC X(50).                      DEFINE
              03 FILLER                 PIC X(184).                     DEFINE
           02 FILLER REDEFINES M8104D-GRECORD.                          DEFINE
              03 FILLER                 PIC X(7).                       DEFINE
              03 CSW012-REP-NUM         PIC X(8).                       DEFINE
              03 FILLER                 PIC X(32).                      DEFINE
              03 CSW051-LEF-DESCR       PIC X(30).                      DEFINE
              03 CSW052-RIG-DESCR       PIC X(30).                      DEFINE
              03 FILLER                 PIC X(25).                      DEFINE
              03 CSW100-SPE-DATA        PIC X(30).                      DEFINE
              03 FILLER                 PIC X(138).                     DEFINE
           02 FILLER  OCCURS 0 TO 32467 TIMES DEPENDING ON              DEFINE
           M8104D-RECORD-VEND                                           DEFINE
                                     PIC X(01).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR M8104D-RECORD IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR M8124D-IO-AREA.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  M8124D-IO-AREA.                                              DEFINE
           02 FILLER PIC X                                              DEFINE
                     OCCURS 0 TO 32767 TIMES                            DEFINE
                     DEPENDING ON M8124D-RECORD-TAIL.                   DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR M8124D-IO-AREA IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR M8124D-RECORD.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  M8124D-RECORD.                                               DEFINE
           02 M8124D-GRECORD.                                           DEFINE
              03 FILLER                 PIC X(1).                       DEFINE
              03 M-KEY                  PIC X(22).                      DEFINE
              03 FILLER                 PIC X(2423).                    DEFINE
           02 FILLER REDEFINES M8124D-GRECORD.                          DEFINE
              03 M-001-DEL-CODE         PIC X(1).                       DEFINE
              03 M-005-BAN-NUMBER       PIC 9(2).                       DEFINE
              03 M-010-OBL-NUMBER       PIC 9(10).                      DEFINE
              03 M-012-APP-CODE         PIC 9(1).                       DEFINE
              03 M-015-OBL-NUMBER      COMP-3 PIC S9(11).               DEFINE
              03 M-025-REC-CODE         PIC 9(3).                       DEFINE
              03 FILLER                 PIC X(3).                       DEFINE
              03 M-DATE                 PIC 9(6).                       DEFINE
              03 FILLER                 PIC X(2414).                    DEFINE
           02 FILLER REDEFINES M8124D-GRECORD.                          DEFINE
              03 MC001-DEL-CODE         PIC X(1).                       DEFINE
              03 MC005-BAN-NUMBER       PIC 9(2).                       DEFINE
              03 MC010-OBL-NUMBER       PIC 9(10).                      DEFINE
              03 MC012-APP-CODE         PIC 9(1).                       DEFINE
              03 MC015-OBL-NUMBER      COMP-3 PIC S9(11).               DEFINE
              03 MC025-REC-CODE         PIC 9(3).                       DEFINE
              03 MC038-PRO-TYPE         PIC 9(4).                       DEFINE
              03 FILLER                 PIC X(1).                       DEFINE
              03 MC040-OBL-NAME         PIC X(15).                      DEFINE
              03 FILLER                 PIC X(6).                       DEFINE
              03 MC043-OBL-TYPE        COMP-3 PIC 9(3).                 DEFINE
              03 MC044-EFF-DATE        COMP-3 PIC S9(7).                DEFINE
              03 MC045-POS-DATE        COMP-3 PIC S9(7).                DEFINE
              03 FILLER                 PIC X(8).                       DEFINE
              03 MC048-LEG-DATE        COMP-3 PIC S9(7).                DEFINE
              03 FILLER                 PIC X(4).                       DEFINE
              03 MC050-DAT-OUT-DE      COMP-3 PIC S9(7).                DEFINE
              03 MC051-LAS-DT          COMP-3 PIC S9(7).                DEFINE
              03 FILLER                 PIC X(4).                       DEFINE
              03 MC060-ORI-BALANC      COMP-3 PIC S9(13)V9(2).          DEFINE
              03 MC061-CUR-BALANC      COMP-3 PIC S9(13)V9(2).          DEFINE
              03 MC062-MON-BAL         COMP-3 PIC S9(13)V9(2).          DEFINE
              03 FILLER                 PIC X(24).                      DEFINE
              03 MC066-CHA-BALANC      COMP-3 PIC S9(13)V9(2).          DEFINE
              03 FILLER                 PIC X(8).                       DEFINE
              03 MC070-ORI-AMOUN       COMP-3 PIC S9(13)V9(2).          DEFINE
              03 MC071-ORI-DATE        COMP-3 PIC S9(7).                DEFINE
              03 FILLER                 PIC X(27).                      DEFINE
              03 MC080-SER-UNIT         PIC 9(5).                       DEFINE
              03 MC081-ASS-UNIT         PIC 9(5).                       DEFINE
              03 MC082-CON-OFF          PIC X(5).                       DEFINE
              03 MC083-GEN-CODE         PIC 9(7).                       DEFINE
              03 FILLER                 PIC X(9).                       DEFINE
              03 MC091-EXA-CODE-1       PIC 9(2).                       DEFINE
              03 FILLER                 PIC X(57).                      DEFINE
              03 FC151-AMT-TAK         COMP-3 PIC S9(13)V9(2).          DEFINE
              03 FILLER                 PIC X(2158).                    DEFINE
           02 FILLER REDEFINES M8124D-GRECORD.                          DEFINE
              03 FILLER                 PIC X(249).                     DEFINE
              03 MC111-DUR-CODE         PIC 9(1).                       DEFINE
              03 FILLER                 PIC X(5).                       DEFINE
              03 MC114-DIS-CODE         PIC 9(1).                       DEFINE
              03 FILLER                 PIC X(10).                      DEFINE
              03 MC143-SEC-CODE         PIC 9(1).                       DEFINE
              03 FILLER                 PIC X(13).                      DEFINE
              03 MC151-PRI-PAID        COMP-3 PIC S9(13)V9(2).          DEFINE
              03 FILLER                 PIC X(320).                     DEFINE
              03 MC354-USER-AMT        COMP-3 PIC S9(13)V9(2).          DEFINE
              03 FILLER                 PIC X(63).                      DEFINE
              03 MC400-ZER-DATE        COMP-3 PIC S9(7).                DEFINE
              03 MC410-DIV-NUMBER       PIC 9(3).                       DEFINE
              03 MC411-REG-NUMBER       PIC 9(3).                       DEFINE
              03 FILLER                 PIC X(74).                      DEFINE
              03 FC438-ADV-SWITCH       PIC 9(1).                       DEFINE
              03 FC475-AVA             COMP-3 PIC S9(13)V9(2).          DEFINE
              03 FILLER                 PIC X(104).                     DEFINE
              03 MC544-CUM-MTD         COMP-3 PIC S9(13)V9(2).          DEFINE
              03 MC546-INT-PAI-PR      COMP-3 PIC S9(13)V9(2).          DEFINE
              03 FILLER                 PIC X(158).                     DEFINE
              03 MC700-PAR-OBLIGR      COMP-3 PIC S9(11).               DEFINE
              03 MC701-PAR-APPL         PIC 9(1).                       DEFINE
              03 MC702-PAR-OBLGT       COMP-3 PIC S9(11).               DEFINE
              03 FILLER                 PIC X(9).                       DEFINE
              03 MC705-PAR-TYPE         PIC X(1).                       DEFINE
              03 FILLER                 PIC X(92).                      DEFINE
              03 MC730-PAR-SEG-RE      COMP-3 PIC 9(3).                 DEFINE
              03 FILLER                 PIC X(1279).                    DEFINE
           02 FILLER REDEFINES M8124D-GRECORD.                          DEFINE
              03 FILLER                 PIC X(1101).                    DEFINE
              03 MC732-TOT-AMOUN       COMP-3 PIC S9(13)V9(2).          DEFINE
              03 FILLER                 PIC X(725).                     DEFINE
              03 MC900-NUM-OF-SEG      COMP-3 PIC S9(3).                DEFINE
              03 MC950-SEG-CODE        COMP-3 PIC S9(3).                DEFINE
              03 FILLER                 PIC X(608).                     DEFINE
           02 FILLER REDEFINES M8124D-GRECORD.                          DEFINE
              03 FILLER                 PIC X(1836).                    DEFINE
              03 MC950-PRI-SEG          PIC X(598).                     DEFINE
              03 FILLER                 PIC X(12).                      DEFINE
           02 FILLER REDEFINES M8124D-GRECORD.                          DEFINE
              03 NS001-DEL-CODE         PIC X(1).                       DEFINE
              03 NS005-BAN-NUMBER       PIC 9(2).                       DEFINE
              03 NS010-OBL-NUMBER       PIC 9(10).                      DEFINE
              03 NS012-APP-CODE         PIC 9(1).                       DEFINE
              03 NS015-OBL-NUMBER      COMP-3 PIC S9(11).               DEFINE
              03 NS025-REC-CODE         PIC 9(3).                       DEFINE
              03 NS040-ACT-NUM-SE      COMP-3 PIC S9(1).                DEFINE
              03 NS100-SEG-CODE        COMP-3 PIC S9(3).                DEFINE
              03 NS110-NUM-OF-ENT      COMP-3 PIC S9(3).                DEFINE
              03 FILLER                 PIC X(2418).                    DEFINE
           02 FILLER REDEFINES M8124D-GRECORD.                          DEFINE
              03 FILLER                 PIC X(24).                      DEFINE
              03 FILLER OCCURS 4 TIMES INDEXED BY SEG-NDX-001.          DEFINE
                 04 NS-SEGMENT.                                         DEFINE
                    05 CURRENT-SEGMENT        PIC X(604).               DEFINE
              03 FILLER                 PIC X(6).                       DEFINE
           02 FILLER  OCCURS 0 TO 30321 TIMES DEPENDING ON              DEFINE
           M8124D-RECORD-VEND                                           DEFINE
                                     PIC X(01).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR M8124D-RECORD IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR M8134D-IO-AREA.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  M8134D-IO-AREA.                                              DEFINE
           02 FILLER PIC X                                              DEFINE
                     OCCURS 0 TO 32767 TIMES                            DEFINE
                     DEPENDING ON M8134D-RECORD-TAIL.                   DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR M8134D-IO-AREA IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR M8134D-RECORD.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  M8134D-RECORD.                                               DEFINE
           02 M8134D-GRECORD.                                           DEFINE
              03 FILLER                 PIC X(1).                       DEFINE
              03 V-KEY                  PIC X(27).                      DEFINE
              03 FILLER                 PIC X(122).                     DEFINE
           02 FILLER REDEFINES M8134D-GRECORD.                          DEFINE
              03 V-001-DEL-CODE         PIC X(1).                       DEFINE
              03 V-005-BAN-NUMBER       PIC 9(2).                       DEFINE
              03 V-010-OBL-NUMBER       PIC 9(10).                      DEFINE
              03 V-013-INV-NUMBER       PIC 9(10).                      DEFINE
              03 V-025-REC-CODE         PIC 9(5).                       DEFINE
              03 FILLER                 PIC X(122).                     DEFINE
           02 FILLER REDEFINES M8134D-GRECORD.                          DEFINE
              03 VI001-DEL-CODE         PIC X(1).                       DEFINE
              03 VI005-BAN-NUMBER       PIC 9(2).                       DEFINE
              03 VI010-OBL-NUMBER       PIC 9(10).                      DEFINE
              03 VI013-INV-NUMBER       PIC 9(10).                      DEFINE
              03 VI025-REC-CODE         PIC 9(5).                       DEFINE
              03 FILLER                 PIC X(6).                       DEFINE
              03 VI055-OBL-NUMBER      COMP-3 PIC S9(11).               DEFINE
              03 VI060-TOT-P           COMP-3 PIC S9(13)V9(2).          DEFINE
              03 VI070-INV-DATE        COMP-3 PIC S9(7).                DEFINE
              03 VI072-INV-DATE        COMP-3 PIC S9(7).                DEFINE
              03 VI074-FUT-OR-COD       PIC X(1).                       DEFINE
              03 FILLER                 PIC X(30).                      DEFINE
              03 VI-INVOICE-DATA.                                       DEFINE
                 04 FILLER OCCURS 3 TIMES INDEXED BY VI-SEG-NDX-002.    DEFINE
                    05 VI-SEGMENT.                                      DEFINE
                       06 CURRENT-VI-SEG.                               DEFINE
                          07 VI200-CHA-CODE         PIC 9(3).           DEFINE
                          07 VI210-INV-C           COMP-3 PIC           DEFINE
                          S9(13)V9(2).                                  DEFINE
                          07 VI220-INV-PERIOD      COMP-3 PIC           DEFINE
                          S9(13)V9(2).                                  DEFINE
              03 FILLER                 PIC X(6).                       DEFINE
           02 FILLER  OCCURS 0 TO 32617 TIMES DEPENDING ON              DEFINE
           M8134D-RECORD-VEND                                           DEFINE
                                     PIC X(01).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR M8134D-RECORD IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR M8234D-IO-AREA.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  M8234D-IO-AREA.                                              DEFINE
           02 FILLER PIC X                                              DEFINE
                     OCCURS 0 TO 32767 TIMES                            DEFINE
                     DEPENDING ON M8234D-RECORD-TAIL.                   DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR M8234D-IO-AREA IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR M8234D-RECORD.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  M8234D-RECORD.                                               DEFINE
           02 M8234D-GRECORD.                                           DEFINE
              03 FILLER                 PIC X(1).                       DEFINE
              03 PROOF-FILE-KEY         PIC X(22).                      DEFINE
              03 FILLER                 PIC X(83).                      DEFINE
              03 PROOF-TRA-RECORD       PIC X(80).                      DEFINE
              03 FILLER                 PIC X(264).                     DEFINE
           02 FILLER  OCCURS 0 TO 32317 TIMES DEPENDING ON              DEFINE
           M8234D-RECORD-VEND                                           DEFINE
                                     PIC X(01).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR M8234D-RECORD IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR ACH-IO-AREA.              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  ACH-IO-AREA.                                                 DEFINE
           02 FILLER PIC X                                              DEFINE
                     OCCURS 0 TO 32767 TIMES                            DEFINE
                     DEPENDING ON ACH-RECORD-TAIL.                      DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR ACH-IO-AREA IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR ACH-RECORD.               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  ACH-RECORD.                                                  DEFINE
           02 ACH-GRECORD.                                              DEFINE
              03 ACH-RECORD-Y1          PIC X(80).                      DEFINE
           02 FILLER  OCCURS 0 TO 32687 TIMES DEPENDING ON              DEFINE
           ACH-RECORD-VEND                                              DEFINE
                                     PIC X(01).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR ACH-RECORD IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR ME7231-IO-AREA.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  ME7231-IO-AREA.                                              DEFINE
           02 FILLER PIC X                                              DEFINE
                     OCCURS 0 TO 32767 TIMES                            DEFINE
                     DEPENDING ON ME7231-RECORD-TAIL.                   DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR ME7231-IO-AREA IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR ME7231-RECORD.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  ME7231-RECORD.                                               DEFINE
           02 ME7231-GRECORD.                                           DEFINE
              03 EXT-CRITERIA           PIC 9(5).                       DEFINE
              03 EXT-BANK               PIC 9(2).                       DEFINE
              03 EXT-BRANCH             PIC 9(5).                       DEFINE
              03 EXT-TYPE               PIC X(5).                       DEFINE
              03 EXT-DATE               PIC 9(6).                       DEFINE
              03 EXT-COUNT             COMP-3 PIC S9(19).               DEFINE
              03 EXT-AMOUNT REDEFINES EXT-COUNT                         DEFINE
                                       COMP-3 PIC S9(17)V9(2).          DEFINE
           02 FILLER  OCCURS 0 TO 32734 TIMES DEPENDING ON              DEFINE
           ME7231-RECORD-VEND                                           DEFINE
                                     PIC X(01).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR ME7231-RECORD IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR ME7232-IO-AREA.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  ME7232-IO-AREA.                                              DEFINE
           02 FILLER PIC X                                              DEFINE
                     OCCURS 0 TO 32767 TIMES                            DEFINE
                     DEPENDING ON ME7232-RECORD-TAIL.                   DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR ME7232-IO-AREA IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR ME7232-RECORD.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  ME7232-RECORD.                                               DEFINE
           02 ME7232-GRECORD.                                           DEFINE
              03 EXT-CRITERIA2          PIC 9(5).                       DEFINE
              03 EXT-BANK2              PIC 9(2).                       DEFINE
              03 EXT-BRANCH2            PIC 9(5).                       DEFINE
              03 EXT-OBLIGOR2           PIC 9(10).                      DEFINE
              03 EXT-OBLIGAT2           PIC 9(10).                      DEFINE
              03 EXT-TYPE2              PIC X(5).                       DEFINE
              03 EXT-DATE2              PIC 9(6).                       DEFINE
              03 EXT-AMOUNT2           COMP-3 PIC S9(17)V9(2).          DEFINE
              03 EXT-MAT-DT2            PIC 9(6).                       DEFINE
              03 EXT-ORIG-DT2           PIC 9(6).                       DEFINE
           02 FILLER  OCCURS 0 TO 32702 TIMES DEPENDING ON              DEFINE
           ME7232-RECORD-VEND                                           DEFINE
                                     PIC X(01).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR ME7232-RECORD IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR SMYFIL-IO-AREA2.          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  SMYFIL-IO-AREA2.                                             DEFINE
           02 FILLER  OCCURS 1 TO 32767 TIMES DEPENDING ON              DEFINE
           SMYFIL-RECORD-SIZE                                           DEFINE
                                     PIC X(01).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR SMYFIL-IO-AREA2 IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR SMYFIL-IO-AREA.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  SMYFIL-IO-AREA.                                              DEFINE
           02 ISMYFIL-GRECORD.                                          DEFINE
              03 ISMY-CRITERIA          PIC 9(5).                       DEFINE
              03 ISMY-BANK              PIC 9(2).                       DEFINE
              03 ISMY-BRANCH            PIC 9(5).                       DEFINE
              03 ISMY-TYPE              PIC X(5).                       DEFINE
              03 ISMY-DATE              PIC 9(6).                       DEFINE
              03 FILLER                 PIC X(20).                      DEFINE
           02 FILLER PIC X                                              DEFINE
                     OCCURS 0 TO 32724 TIMES                            DEFINE
                     DEPENDING ON SMYFIL-RECORD-TAIL.                   DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR SMYFIL-IO-AREA IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR SMYFIL-RECORD.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  SMYFIL-RECORD.                                               DEFINE
           02 SMYFIL-GRECORD.                                           DEFINE
              03 SMY-CRITERIA           PIC 9(5).                       DEFINE
              03 SMY-BANK               PIC 9(2).                       DEFINE
              03 SMY-BRANCH             PIC 9(5).                       DEFINE
              03 SMY-TYPE               PIC X(5).                       DEFINE
              03 SMY-DATE               PIC 9(6).                       DEFINE
              03 ACC-PER-TYPE          COMP-3 PIC S9(19).               DEFINE
              03 SMY-AMOUNT            COMP-3 PIC S9(17)V9(2).          DEFINE
           02 FILLER  OCCURS 0 TO 32724 TIMES DEPENDING ON              DEFINE
           SMYFIL-RECORD-VEND                                           DEFINE
                                     PIC X(01).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR SMYFIL-RECORD IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR SMYFIL2-IO-AREA2.         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  SMYFIL2-IO-AREA2.                                            DEFINE
           02 FILLER  OCCURS 1 TO 32767 TIMES DEPENDING ON              DEFINE
           SMYFIL2-RECORD-SIZE                                          DEFINE
                                     PIC X(01).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR SMYFIL2-IO-AREA2 IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR SMYFIL2-IO-AREA.          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  SMYFIL2-IO-AREA.                                             DEFINE
           02 ISMYFIL2-GRECORD.                                         DEFINE
              03 ISMY2-CRITERIA         PIC 9(5).                       DEFINE
              03 ISMY2-BANK             PIC 9(2).                       DEFINE
              03 ISMY2-BRANCH           PIC 9(5).                       DEFINE
              03 ISMY2-TYPE             PIC X(5).                       DEFINE
              03 ISMY2-DATE             PIC 9(6).                       DEFINE
              03 FILLER                 PIC X(20).                      DEFINE
           02 FILLER PIC X                                              DEFINE
                     OCCURS 0 TO 32724 TIMES                            DEFINE
                     DEPENDING ON SMYFIL2-RECORD-TAIL.                  DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR SMYFIL2-IO-AREA IS 32767
                                                                        EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR SMYFIL2-RECORD.           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       01  SMYFIL2-RECORD.                                              DEFINE
           02 SMYFIL2-GRECORD.                                          DEFINE
              03 SMY2-CRITERIA          PIC 9(5).                       DEFINE
              03 SMY2-BANK              PIC 9(2).                       DEFINE
              03 SMY2-BRANCH            PIC 9(5).                       DEFINE
              03 SMY2-TYPE              PIC X(5).                       DEFINE
              03 SMY2-DATE              PIC 9(6).                       DEFINE
              03 ACC-PER-TYPE2         COMP-3 PIC S9(19).               DEFINE
              03 SMY2-AMOUNT           COMP-3 PIC S9(17)V9(2).          DEFINE
           02 FILLER  OCCURS 0 TO 32724 TIMES DEPENDING ON              DEFINE
           SMYFIL2-RECORD-VEND                                          DEFINE
                                     PIC X(01).                         DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR SMYFIL2-RECORD IS 32767
                                                                        EASYT007
           EJECT                                                        GENERATQ
       PROCEDURE DIVISION USING                                         COBOLBAS
                          LS-PENGI-PARM.                                COBOLBAS
            PERFORM G00000-SET-FSYESPI1-TRAP.                           COBOLBAS
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
#00787     MOVE 1 TO REPORT1-LGRP-CNTRL.                                EASYT007
#00787     MOVE 1 TO REPORT1-L1ST-CNTRL.                                EASYT007
#01467     MOVE 1 TO REPORT2-LGRP-CNTRL.                                EASYT007
#01467     MOVE 1 TO REPORT2-L1ST-CNTRL.                                EASYT007
#01529     MOVE ' ' TO KEY-CS-KEY.                                      EASYT007
#01529     MOVE ' ' TO KEY-M-KEY.                                       EASYT007
#01529     MOVE ' ' TO KEY-V-KEY.                                       EASYT007
#01529     MOVE ' ' TO KEY-V-INV-NUM.                                   EASYT007
#01529     MOVE 'ALLOC SORTWK01' TO WS-PENGI-ALLOC-REQ                  EASYT007
#01529     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC.             EASYT007
#01529     MOVE 'ALLOC SORTWK02' TO WS-PENGI-ALLOC-REQ                  EASYT007
#01529     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC.             EASYT007
#01529     MOVE 'ALLOC SORTWK03' TO WS-PENGI-ALLOC-REQ                  EASYT007
#01529     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC.             EASYT007
                                                                        EASYT007
#00573***************************************************************** EASYT007
#00573* JOB1 INITIATION ROUTINE                                       * EASYT007
#00573***************************************************************** EASYT007
#00573 A01000-JOB1-ENTRY.                                               EASYT007
#00573                                                                  EASYT007
#00573     PERFORM A01180-JOB1-OPEN                                     EASYT007
#00573     SET JOB1-START-PROC TO TRUE                                  EASYT007
#00573     PERFORM A01150-GET-PROCESS-DATE                              EASYT007
#00573        THRU A01160-GET-PROCESS-DATE-EXIT.                        EASYT007
#00573     IF NOT JOB1-STOP-JOB                                         EASYT007
#00573        SET JOB1-PENDING TO TRUE                                  EASYT007
#00573     END-IF.                                                      EASYT007
#00573     PERFORM A01010-JOB1-READ                                     EASYT007
#00573       UNTIL END-OF-M8234D                                        EASYT007
#00573             OR JOB1-REQUEST-STOP.                                EASYT007
#00573                                                                  EASYT007
#00573     MOVE ZERO TO WS-JOB1-FLAG.                                   EASYT007
#00573                                                                  EASYT007
#00777     IF (WS-JOB1-ABEND NOT EQUAL 'Y')                             EASYT007
#00777         SET JOB1-FINISH-PROC TO TRUE                             EASYT007
#00777         PERFORM A01110-ACH-PROC                                  EASYT007
#00777            THRU A01140-ACH-PROC-EXIT                             EASYT007
#00777     END-IF.                                                      EASYT007
#00777                                                                  EASYT007
#00787     IF WS-JOB1-REPORT1-SW = 'Y'                                  EASYT007
#00787         PERFORM E00270-REPORT1-TERMINATE                         EASYT007
#00787     END-IF.                                                      EASYT007
#00787                                                                  EASYT007
#00787     MOVE 'JOB1'  TO WS-PENGI-EZ-JID                              EASYT007
#00787     MOVE '1' TO WS-PENGI-EZ-JOB                                  EASYT007
#00787     DISPLAY ' '                                                  EASYT007
#00787     DISPLAY WS-PENGI-EZ-STAT1                                    EASYT007
#00787     DISPLAY ' '                                                  EASYT007
#00787     DISPLAY WS-PENGI-EZ-STAT2                                    EASYT007
#00787     MOVE 'INPUT' TO WS-PENGI-EZ-IOTYPE                           EASYT007
#00787     MOVE 'M8104D' TO WS-PENGI-EZ-DDNAME                          EASYT007
#00787     MOVE M8104D-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                 EASYT007
#00787     MOVE M8104D-DCB-LRECL TO WS-PENGI-EZ-LRECL                   EASYT007
#00787     MOVE M8104D-PHORG TO WS-PENGI-EZ-ORG                         EASYT007
#00787     MOVE M8104D-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM               EASYT007
#00787     MOVE M8104D-IOM-NAME      TO WS-PENGI-EZ-IOMOD               EASYT007
#00787     MOVE M8104D-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE               EASYT007
#00787     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#00787     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#00787                                                                  EASYT007
#00787* M8104D CLOSE ROUTINE                                            FDYNIOR
#00787     MOVE 'CLOSE'  TO M8104D-IO-REQUEST                           FDYNIOR
#00787     MOVE ZERO TO M8104D-STATUS                                   FDYNIOR
#00787     IF M8104D-IOSW = 'E'                                         FDYNIOR
#00787        CALL 'FSDYNIO1' USING M8104D-DYNAM-FIB                    FDYNIOR
#00787        MOVE ZERO TO M8104D-STATUS                                FDYNIOR
#00787     ELSE                                                         FDYNIOR
#00787        IF M8104D-OPEN                                            FDYNIOR
#00787           CALL 'FSDYNIO1' USING M8104D-DYNAM-FIB                 FDYNIOR
#00787           MOVE  M8104D-IO-ERCODE1 TO M8104D-STATUS               FDYNIOR
#00787        END-IF                                                    FDYNIOR
#00787     END-IF                                                       FDYNIOR
#00787     MOVE 'C'     TO M8104D-IOSW                                  FDYNIOR
#00787     MOVE SPACE   TO M8104D-ACCEPT-FLAG                           FDYNIOR
#00787     IF (NOT M8104D-GOOD-IO)                                      FDYNIOR
#00787       AND (M8104D-IOSW NOT = 'E')                                FDYNIOR
#00787        DISPLAY M8104D-MESSAGE                                    FDYNIOR
#00787        MOVE 3001 TO WS-PENGI-RETURN                              ABRCODE
#00787        MOVE M8104D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00787        DISPLAY M8104D-IOM-NAME ': ' M8104D-IO-VSMEMSG            FDYNIOR
#00787        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00787     END-IF.                                                      FDYNIOR
#00787                                                                  FDYNIOR
#00787     MOVE 'INPUT' TO WS-PENGI-EZ-IOTYPE                           EASYT007
#00787     MOVE 'M8124D' TO WS-PENGI-EZ-DDNAME                          EASYT007
#00787     MOVE M8124D-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                 EASYT007
#00787     MOVE M8124D-DCB-LRECL TO WS-PENGI-EZ-LRECL                   EASYT007
#00787     MOVE M8124D-PHORG TO WS-PENGI-EZ-ORG                         EASYT007
#00787     MOVE M8124D-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM               EASYT007
#00787     MOVE M8124D-IOM-NAME      TO WS-PENGI-EZ-IOMOD               EASYT007
#00787     MOVE M8124D-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE               EASYT007
#00787     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#00787     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#00787                                                                  EASYT007
#00787* M8124D CLOSE ROUTINE                                            FDYNIOR
#00787     MOVE 'CLOSE'  TO M8124D-IO-REQUEST                           FDYNIOR
#00787     MOVE ZERO TO M8124D-STATUS                                   FDYNIOR
#00787     IF M8124D-IOSW = 'E'                                         FDYNIOR
#00787        CALL 'FSDYNIO1' USING M8124D-DYNAM-FIB                    FDYNIOR
#00787        MOVE ZERO TO M8124D-STATUS                                FDYNIOR
#00787     ELSE                                                         FDYNIOR
#00787        IF M8124D-OPEN                                            FDYNIOR
#00787           CALL 'FSDYNIO1' USING M8124D-DYNAM-FIB                 FDYNIOR
#00787           MOVE  M8124D-IO-ERCODE1 TO M8124D-STATUS               FDYNIOR
#00787        END-IF                                                    FDYNIOR
#00787     END-IF                                                       FDYNIOR
#00787     MOVE 'C'     TO M8124D-IOSW                                  FDYNIOR
#00787     MOVE SPACE   TO M8124D-ACCEPT-FLAG                           FDYNIOR
#00787     IF (NOT M8124D-GOOD-IO)                                      FDYNIOR
#00787       AND (M8124D-IOSW NOT = 'E')                                FDYNIOR
#00787        DISPLAY M8124D-MESSAGE                                    FDYNIOR
#00787        MOVE 3002 TO WS-PENGI-RETURN                              ABRCODE
#00787        MOVE M8124D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00787        DISPLAY M8124D-IOM-NAME ': ' M8124D-IO-VSMEMSG            FDYNIOR
#00787        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00787     END-IF.                                                      FDYNIOR
#00787                                                                  FDYNIOR
#00787     MOVE 'INPUT' TO WS-PENGI-EZ-IOTYPE                           EASYT007
#00787     MOVE 'M8134D' TO WS-PENGI-EZ-DDNAME                          EASYT007
#00787     MOVE M8134D-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                 EASYT007
#00787     MOVE M8134D-DCB-LRECL TO WS-PENGI-EZ-LRECL                   EASYT007
#00787     MOVE M8134D-PHORG TO WS-PENGI-EZ-ORG                         EASYT007
#00787     MOVE M8134D-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM               EASYT007
#00787     MOVE M8134D-IOM-NAME      TO WS-PENGI-EZ-IOMOD               EASYT007
#00787     MOVE M8134D-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE               EASYT007
#00787     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#00787     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#00787                                                                  EASYT007
#00787* M8134D CLOSE ROUTINE                                            FDYNIOR
#00787     MOVE 'CLOSE'  TO M8134D-IO-REQUEST                           FDYNIOR
#00787     MOVE ZERO TO M8134D-STATUS                                   FDYNIOR
#00787     IF M8134D-IOSW = 'E'                                         FDYNIOR
#00787        CALL 'FSDYNIO1' USING M8134D-DYNAM-FIB                    FDYNIOR
#00787        MOVE ZERO TO M8134D-STATUS                                FDYNIOR
#00787     ELSE                                                         FDYNIOR
#00787        IF M8134D-OPEN                                            FDYNIOR
#00787           CALL 'FSDYNIO1' USING M8134D-DYNAM-FIB                 FDYNIOR
#00787           MOVE  M8134D-IO-ERCODE1 TO M8134D-STATUS               FDYNIOR
#00787        END-IF                                                    FDYNIOR
#00787     END-IF                                                       FDYNIOR
#00787     MOVE 'C'     TO M8134D-IOSW                                  FDYNIOR
#00787     MOVE SPACE   TO M8134D-ACCEPT-FLAG                           FDYNIOR
#00787     IF (NOT M8134D-GOOD-IO)                                      FDYNIOR
#00787       AND (M8134D-IOSW NOT = 'E')                                FDYNIOR
#00787        DISPLAY M8134D-MESSAGE                                    FDYNIOR
#00787        MOVE 3003 TO WS-PENGI-RETURN                              ABRCODE
#00787        MOVE M8134D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00787        DISPLAY M8134D-IOM-NAME ': ' M8134D-IO-VSMEMSG            FDYNIOR
#00787        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00787     END-IF.                                                      FDYNIOR
#00787                                                                  FDYNIOR
#00787     MOVE 'INPUT' TO WS-PENGI-EZ-IOTYPE                           EASYT007
#00787     MOVE 'M8234D' TO WS-PENGI-EZ-DDNAME                          EASYT007
#00787     MOVE M8234D-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                 EASYT007
#00787     MOVE M8234D-DCB-LRECL TO WS-PENGI-EZ-LRECL                   EASYT007
#00787     MOVE M8234D-PHORG TO WS-PENGI-EZ-ORG                         EASYT007
#00787     MOVE M8234D-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM               EASYT007
#00787     MOVE M8234D-IOM-NAME      TO WS-PENGI-EZ-IOMOD               EASYT007
#00787     MOVE M8234D-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE               EASYT007
#00787     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#00787     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#00787                                                                  EASYT007
#00787* M8234D CLOSE ROUTINE                                            FDYNIOR
#00787     MOVE 'CLOSE'  TO M8234D-IO-REQUEST                           FDYNIOR
#00787     MOVE ZERO TO M8234D-STATUS                                   FDYNIOR
#00787     IF M8234D-IOSW = 'E'                                         FDYNIOR
#00787        CALL 'FSDYNIO1' USING M8234D-DYNAM-FIB                    FDYNIOR
#00787        MOVE ZERO TO M8234D-STATUS                                FDYNIOR
#00787     ELSE                                                         FDYNIOR
#00787        IF M8234D-OPEN                                            FDYNIOR
#00787           CALL 'FSDYNIO1' USING M8234D-DYNAM-FIB                 FDYNIOR
#00787           MOVE  M8234D-IO-ERCODE1 TO M8234D-STATUS               FDYNIOR
#00787        END-IF                                                    FDYNIOR
#00787     END-IF                                                       FDYNIOR
#00787     MOVE 'C'     TO M8234D-IOSW                                  FDYNIOR
#00787     MOVE SPACE   TO M8234D-ACCEPT-FLAG                           FDYNIOR
#00787     IF (NOT M8234D-GOOD-IO)                                      FDYNIOR
#00787       AND (M8234D-IOSW NOT = 'E')                                FDYNIOR
#00787        DISPLAY M8234D-MESSAGE                                    FDYNIOR
#00787        MOVE 3004 TO WS-PENGI-RETURN                              ABRCODE
#00787        MOVE M8234D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00787        DISPLAY M8234D-IOM-NAME ': ' M8234D-IO-VSMEMSG            FDYNIOR
#00787        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00787     END-IF.                                                      FDYNIOR
#00787                                                                  FDYNIOR
#00787     MOVE 'INPUT' TO WS-PENGI-EZ-IOTYPE                           EASYT007
#00787     MOVE 'ACH' TO WS-PENGI-EZ-DDNAME                             EASYT007
#00787     MOVE ACH-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                    EASYT007
#00787     MOVE ACH-DCB-LRECL TO WS-PENGI-EZ-LRECL                      EASYT007
#00787     MOVE ACH-PHORG TO WS-PENGI-EZ-ORG                            EASYT007
#00787     MOVE ACH-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM                  EASYT007
#00787     MOVE ACH-IOM-NAME      TO WS-PENGI-EZ-IOMOD                  EASYT007
#00787     MOVE ACH-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE                  EASYT007
#00787     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#00787     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#00787                                                                  EASYT007
#00787* ACH CLOSE ROUTINE                                               FDYNIOR
#00787     MOVE 'CLOSE'  TO ACH-IO-REQUEST                              FDYNIOR
#00787     MOVE ZERO TO ACH-STATUS                                      FDYNIOR
#00787     IF ACH-OPEN                                                  FDYNIOR
#00787        CALL 'FSDYNIO1' USING ACH-DYNAM-FIB                       FDYNIOR
#00787        MOVE  ACH-IO-ERCODE1 TO ACH-STATUS                        FDYNIOR
#00787     END-IF                                                       FDYNIOR
#00787     MOVE 'C'     TO ACH-IOSW                                     FDYNIOR
#00787     MOVE SPACE   TO ACH-ACCEPT-FLAG                              FDYNIOR
#00787     IF (NOT ACH-GOOD-IO)                                         FDYNIOR
#00787        DISPLAY ACH-MESSAGE                                       FDYNIOR
#00787        MOVE 3005 TO WS-PENGI-RETURN                              ABRCODE
#00787        MOVE ACH-MESSAGE TO ABEND-MESSAGE                         FDYNIOR
#00787        DISPLAY ACH-IOM-NAME ': ' ACH-IO-VSMEMSG                  FDYNIOR
#00787        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00787     END-IF.                                                      FDYNIOR
#00787                                                                  FDYNIOR
#00787     MOVE 'OUTPUT' TO WS-PENGI-EZ-IOTYPE                          EASYT007
#00787     MOVE 'SMYFIL' TO WS-PENGI-EZ-DDNAME                          EASYT007
#00787     MOVE SMYFIL-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                 EASYT007
#00787     MOVE SMYFIL-DCB-LRECL TO WS-PENGI-EZ-LRECL                   EASYT007
#00787     MOVE SMYFIL-PHORG TO WS-PENGI-EZ-ORG                         EASYT007
#00787     MOVE SMYFIL-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM               EASYT007
#00787     MOVE SMYFIL-IOM-NAME      TO WS-PENGI-EZ-IOMOD               EASYT007
#00787     MOVE SMYFIL-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE               EASYT007
#00787     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#00787     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#00787                                                                  EASYT007
#00787* SMYFIL CLOSE ROUTINE                                            FDYNIOR
#00787     MOVE 'CLOSE'  TO SMYFIL-IO-REQUEST                           FDYNIOR
#00787     MOVE ZERO TO SMYFIL-STATUS                                   FDYNIOR
#00787     IF SMYFIL-OPEN                                               FDYNIOR
#00787        CALL 'FSDYNIO1' USING SMYFIL-DYNAM-FIB                    FDYNIOR
#00787        MOVE  SMYFIL-IO-ERCODE1 TO SMYFIL-STATUS                  FDYNIOR
#00787     END-IF                                                       FDYNIOR
#00787     MOVE 'C'     TO SMYFIL-IOSW                                  FDYNIOR
#00787     MOVE SPACE   TO SMYFIL-ACCEPT-FLAG                           FDYNIOR
#00787     IF (NOT SMYFIL-GOOD-IO)                                      FDYNIOR
#00787        DISPLAY SMYFIL-MESSAGE                                    FDYNIOR
#00787        MOVE 3006 TO WS-PENGI-RETURN                              ABRCODE
#00787        MOVE SMYFIL-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00787        DISPLAY SMYFIL-IOM-NAME ': ' SMYFIL-IO-VSMEMSG            FDYNIOR
#00787        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00787     END-IF.                                                      FDYNIOR
#00787                                                                  FDYNIOR
#00787     MOVE 'C'            TO GLCODES-IOSW.                         TBSERV1
#00787     MOVE 'PRINTER' TO WS-PENGI-EZ-ORG                            EASYT007
#00787     MOVE 'OUTPUT'  TO WS-PENGI-EZ-IOTYPE                         EASYT007
      *,FILE DCB INFO. IS FROM THE DEFAULT VALUES.
#00787     MOVE 'SYSPRINT'  TO WS-PENGI-EZ-DDNAME                       EASYT007
#00787     MOVE SYSPRINT-IO-COUNT TO WS-PENGI-EZ-IO-COUNT               EASYT007
#00787     MOVE 'FBA' TO WS-PENGI-EZ-RECFM                              EASYT007
#00787     COMPUTE WS-PENGI-EZ-LRECL = (132 + 1)                        EASYT007
#00787     MOVE 0 TO WS-PENGI-EZ-BLKSIZE                                EASYT007
#00787     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#00787     MOVE SPACES TO WS-PENGI-EZ-IOMOD                             EASYT007
#00787     CLOSE SYSPRINT                                               EASYT007
#00787                                                                  EASYT007
#00787     MOVE ZERO TO SYSPRINT-IO-COUNT                               EASYT007
#00787     MOVE  'C' TO SYSPRINT-IOSW.                                  EASYT007
#00787                                                                  EASYT007
#00789***************************************************************** EASYT007
#00789* JOB2 INITIATION ROUTINE                                       * EASYT007
#00789***************************************************************** EASYT007
#00789 A02000-JOB2-ENTRY.                                               EASYT007
#00789                                                                  EASYT007
#00789     PERFORM A02410-JOB2-OPEN                                     EASYT007
#00789     SET JOB2-START-PROC TO TRUE                                  EASYT007
#00789     PERFORM A02070-START-OBLIGAT-PROC                            EASYT007
#00789        THRU A02080-START-OBLIGAT-PROC-EXIT.                      EASYT007
#00789     IF NOT JOB2-STOP-JOB                                         EASYT007
#00789        SET JOB2-PENDING TO TRUE                                  EASYT007
#00789     END-IF.                                                      EASYT007
#00789     PERFORM A02010-JOB2-READ                                     EASYT007
#00789       UNTIL END-OF-M8124D                                        EASYT007
#00789             OR JOB2-REQUEST-STOP.                                EASYT007
#00789                                                                  EASYT007
#00789     MOVE ZERO TO WS-JOB2-FLAG.                                   EASYT007
#00789                                                                  EASYT007
#01427     IF (WS-JOB2-ABEND NOT EQUAL 'Y')                             EASYT007
#01427         SET JOB2-FINISH-PROC TO TRUE                             EASYT007
#01427         PERFORM A02290-LAST-REC-PROC                             EASYT007
#01427            THRU A02300-LAST-REC-PROC-EXIT                        EASYT007
#01427     END-IF.                                                      EASYT007
#01427                                                                  EASYT007
#01467     IF WS-JOB2-REPORT2-SW = 'Y'                                  EASYT007
#01467         PERFORM E01270-REPORT2-TERMINATE                         EASYT007
#01467     END-IF.                                                      EASYT007
#01467                                                                  EASYT007
#01467     MOVE 'JOB2'  TO WS-PENGI-EZ-JID                              EASYT007
#01467     MOVE '2' TO WS-PENGI-EZ-JOB                                  EASYT007
#01467     DISPLAY ' '                                                  EASYT007
#01467     DISPLAY WS-PENGI-EZ-STAT1                                    EASYT007
#01467     DISPLAY ' '                                                  EASYT007
#01467     DISPLAY WS-PENGI-EZ-STAT2                                    EASYT007
#01467     MOVE 'INPUT' TO WS-PENGI-EZ-IOTYPE                           EASYT007
#01467     MOVE 'M8104D' TO WS-PENGI-EZ-DDNAME                          EASYT007
#01467     MOVE M8104D-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                 EASYT007
#01467     MOVE M8104D-DCB-LRECL TO WS-PENGI-EZ-LRECL                   EASYT007
#01467     MOVE M8104D-PHORG TO WS-PENGI-EZ-ORG                         EASYT007
#01467     MOVE M8104D-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM               EASYT007
#01467     MOVE M8104D-IOM-NAME      TO WS-PENGI-EZ-IOMOD               EASYT007
#01467     MOVE M8104D-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE               EASYT007
#01467     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#01467     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#01467                                                                  EASYT007
#01467* M8104D CLOSE ROUTINE                                            FDYNIOR
#01467     MOVE 'CLOSE'  TO M8104D-IO-REQUEST                           FDYNIOR
#01467     MOVE ZERO TO M8104D-STATUS                                   FDYNIOR
#01467     IF M8104D-IOSW = 'E'                                         FDYNIOR
#01467        CALL 'FSDYNIO1' USING M8104D-DYNAM-FIB                    FDYNIOR
#01467        MOVE ZERO TO M8104D-STATUS                                FDYNIOR
#01467     ELSE                                                         FDYNIOR
#01467        IF M8104D-OPEN                                            FDYNIOR
#01467           CALL 'FSDYNIO1' USING M8104D-DYNAM-FIB                 FDYNIOR
#01467           MOVE  M8104D-IO-ERCODE1 TO M8104D-STATUS               FDYNIOR
#01467        END-IF                                                    FDYNIOR
#01467     END-IF                                                       FDYNIOR
#01467     MOVE 'C'     TO M8104D-IOSW                                  FDYNIOR
#01467     MOVE SPACE   TO M8104D-ACCEPT-FLAG                           FDYNIOR
#01467     IF (NOT M8104D-GOOD-IO)                                      FDYNIOR
#01467       AND (M8104D-IOSW NOT = 'E')                                FDYNIOR
#01467        DISPLAY M8104D-MESSAGE                                    FDYNIOR
#01467        MOVE 3007 TO WS-PENGI-RETURN                              ABRCODE
#01467        MOVE M8104D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01467        DISPLAY M8104D-IOM-NAME ': ' M8104D-IO-VSMEMSG            FDYNIOR
#01467        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01467     END-IF.                                                      FDYNIOR
#01467                                                                  FDYNIOR
#01467     MOVE 'INPUT' TO WS-PENGI-EZ-IOTYPE                           EASYT007
#01467     MOVE 'M8124D' TO WS-PENGI-EZ-DDNAME                          EASYT007
#01467     MOVE M8124D-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                 EASYT007
#01467     MOVE M8124D-DCB-LRECL TO WS-PENGI-EZ-LRECL                   EASYT007
#01467     MOVE M8124D-PHORG TO WS-PENGI-EZ-ORG                         EASYT007
#01467     MOVE M8124D-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM               EASYT007
#01467     MOVE M8124D-IOM-NAME      TO WS-PENGI-EZ-IOMOD               EASYT007
#01467     MOVE M8124D-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE               EASYT007
#01467     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#01467     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#01467                                                                  EASYT007
#01467* M8124D CLOSE ROUTINE                                            FDYNIOR
#01467     MOVE 'CLOSE'  TO M8124D-IO-REQUEST                           FDYNIOR
#01467     MOVE ZERO TO M8124D-STATUS                                   FDYNIOR
#01467     IF M8124D-IOSW = 'E'                                         FDYNIOR
#01467        CALL 'FSDYNIO1' USING M8124D-DYNAM-FIB                    FDYNIOR
#01467        MOVE ZERO TO M8124D-STATUS                                FDYNIOR
#01467     ELSE                                                         FDYNIOR
#01467        IF M8124D-OPEN                                            FDYNIOR
#01467           CALL 'FSDYNIO1' USING M8124D-DYNAM-FIB                 FDYNIOR
#01467           MOVE  M8124D-IO-ERCODE1 TO M8124D-STATUS               FDYNIOR
#01467        END-IF                                                    FDYNIOR
#01467     END-IF                                                       FDYNIOR
#01467     MOVE 'C'     TO M8124D-IOSW                                  FDYNIOR
#01467     MOVE SPACE   TO M8124D-ACCEPT-FLAG                           FDYNIOR
#01467     IF (NOT M8124D-GOOD-IO)                                      FDYNIOR
#01467       AND (M8124D-IOSW NOT = 'E')                                FDYNIOR
#01467        DISPLAY M8124D-MESSAGE                                    FDYNIOR
#01467        MOVE 3008 TO WS-PENGI-RETURN                              ABRCODE
#01467        MOVE M8124D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01467        DISPLAY M8124D-IOM-NAME ': ' M8124D-IO-VSMEMSG            FDYNIOR
#01467        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01467     END-IF.                                                      FDYNIOR
#01467                                                                  FDYNIOR
#01467     MOVE 'INPUT' TO WS-PENGI-EZ-IOTYPE                           EASYT007
#01467     MOVE 'M8134D' TO WS-PENGI-EZ-DDNAME                          EASYT007
#01467     MOVE M8134D-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                 EASYT007
#01467     MOVE M8134D-DCB-LRECL TO WS-PENGI-EZ-LRECL                   EASYT007
#01467     MOVE M8134D-PHORG TO WS-PENGI-EZ-ORG                         EASYT007
#01467     MOVE M8134D-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM               EASYT007
#01467     MOVE M8134D-IOM-NAME      TO WS-PENGI-EZ-IOMOD               EASYT007
#01467     MOVE M8134D-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE               EASYT007
#01467     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#01467     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#01467                                                                  EASYT007
#01467* M8134D CLOSE ROUTINE                                            FDYNIOR
#01467     MOVE 'CLOSE'  TO M8134D-IO-REQUEST                           FDYNIOR
#01467     MOVE ZERO TO M8134D-STATUS                                   FDYNIOR
#01467     IF M8134D-IOSW = 'E'                                         FDYNIOR
#01467        CALL 'FSDYNIO1' USING M8134D-DYNAM-FIB                    FDYNIOR
#01467        MOVE ZERO TO M8134D-STATUS                                FDYNIOR
#01467     ELSE                                                         FDYNIOR
#01467        IF M8134D-OPEN                                            FDYNIOR
#01467           CALL 'FSDYNIO1' USING M8134D-DYNAM-FIB                 FDYNIOR
#01467           MOVE  M8134D-IO-ERCODE1 TO M8134D-STATUS               FDYNIOR
#01467        END-IF                                                    FDYNIOR
#01467     END-IF                                                       FDYNIOR
#01467     MOVE 'C'     TO M8134D-IOSW                                  FDYNIOR
#01467     MOVE SPACE   TO M8134D-ACCEPT-FLAG                           FDYNIOR
#01467     IF (NOT M8134D-GOOD-IO)                                      FDYNIOR
#01467       AND (M8134D-IOSW NOT = 'E')                                FDYNIOR
#01467        DISPLAY M8134D-MESSAGE                                    FDYNIOR
#01467        MOVE 3009 TO WS-PENGI-RETURN                              ABRCODE
#01467        MOVE M8134D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01467        DISPLAY M8134D-IOM-NAME ': ' M8134D-IO-VSMEMSG            FDYNIOR
#01467        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01467     END-IF.                                                      FDYNIOR
#01467                                                                  FDYNIOR
#01467     MOVE 'OUTPUT' TO WS-PENGI-EZ-IOTYPE                          EASYT007
#01467     MOVE 'ME7232' TO WS-PENGI-EZ-DDNAME                          EASYT007
#01467     MOVE ME7232-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                 EASYT007
#01467     MOVE ME7232-DCB-LRECL TO WS-PENGI-EZ-LRECL                   EASYT007
#01467     MOVE ME7232-PHORG TO WS-PENGI-EZ-ORG                         EASYT007
#01467     MOVE ME7232-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM               EASYT007
#01467     MOVE ME7232-IOM-NAME      TO WS-PENGI-EZ-IOMOD               EASYT007
#01467     MOVE ME7232-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE               EASYT007
#01467     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#01467     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#01467                                                                  EASYT007
#01467* ME7232 CLOSE ROUTINE                                            FDYNIOR
#01467     MOVE 'CLOSE'  TO ME7232-IO-REQUEST                           FDYNIOR
#01467     MOVE ZERO TO ME7232-STATUS                                   FDYNIOR
#01467     IF ME7232-OPEN                                               FDYNIOR
#01467        CALL 'FSDYNIO1' USING ME7232-DYNAM-FIB                    FDYNIOR
#01467        MOVE  ME7232-IO-ERCODE1 TO ME7232-STATUS                  FDYNIOR
#01467     END-IF                                                       FDYNIOR
#01467     MOVE 'C'     TO ME7232-IOSW                                  FDYNIOR
#01467     MOVE SPACE   TO ME7232-ACCEPT-FLAG                           FDYNIOR
#01467     IF (NOT ME7232-GOOD-IO)                                      FDYNIOR
#01467        DISPLAY ME7232-MESSAGE                                    FDYNIOR
#01467        MOVE 3010 TO WS-PENGI-RETURN                              ABRCODE
#01467        MOVE ME7232-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01467        DISPLAY ME7232-IOM-NAME ': ' ME7232-IO-VSMEMSG            FDYNIOR
#01467        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01467     END-IF.                                                      FDYNIOR
#01467                                                                  FDYNIOR
#01467     MOVE 'OUTPUT' TO WS-PENGI-EZ-IOTYPE                          EASYT007
#01467     MOVE 'SMYFIL2' TO WS-PENGI-EZ-DDNAME                         EASYT007
#01467     MOVE SMYFIL2-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                EASYT007
#01467     MOVE SMYFIL2-DCB-LRECL TO WS-PENGI-EZ-LRECL                  EASYT007
#01467     MOVE SMYFIL2-PHORG TO WS-PENGI-EZ-ORG                        EASYT007
#01467     MOVE SMYFIL2-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM              EASYT007
#01467     MOVE SMYFIL2-IOM-NAME      TO WS-PENGI-EZ-IOMOD              EASYT007
#01467     MOVE SMYFIL2-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE              EASYT007
#01467     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#01467     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#01467                                                                  EASYT007
#01467* SMYFIL2 CLOSE ROUTINE                                           FDYNIOR
#01467     MOVE 'CLOSE'  TO SMYFIL2-IO-REQUEST                          FDYNIOR
#01467     MOVE ZERO TO SMYFIL2-STATUS                                  FDYNIOR
#01467     IF SMYFIL2-OPEN                                              FDYNIOR
#01467        CALL 'FSDYNIO1' USING SMYFIL2-DYNAM-FIB                   FDYNIOR
#01467        MOVE  SMYFIL2-IO-ERCODE1 TO SMYFIL2-STATUS                FDYNIOR
#01467     END-IF                                                       FDYNIOR
#01467     MOVE 'C'     TO SMYFIL2-IOSW                                 FDYNIOR
#01467     MOVE SPACE   TO SMYFIL2-ACCEPT-FLAG                          FDYNIOR
#01467     IF (NOT SMYFIL2-GOOD-IO)                                     FDYNIOR
#01467        DISPLAY SMYFIL2-MESSAGE                                   FDYNIOR
#01467        MOVE 3011 TO WS-PENGI-RETURN                              ABRCODE
#01467        MOVE SMYFIL2-MESSAGE TO ABEND-MESSAGE                     FDYNIOR
#01467        DISPLAY SMYFIL2-IOM-NAME ': ' SMYFIL2-IO-VSMEMSG          FDYNIOR
#01467        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01467     END-IF.                                                      FDYNIOR
#01467                                                                  FDYNIOR
#01467     MOVE 'C'            TO GLCODES-IOSW.                         TBSERV1
#01467     MOVE 'PRINTER' TO WS-PENGI-EZ-ORG                            EASYT007
#01467     MOVE 'OUTPUT'  TO WS-PENGI-EZ-IOTYPE                         EASYT007
      *,FILE DCB INFO. IS FROM THE DEFAULT VALUES.
#01467     MOVE 'SYSPRINT'  TO WS-PENGI-EZ-DDNAME                       EASYT007
#01467     MOVE SYSPRINT-IO-COUNT TO WS-PENGI-EZ-IO-COUNT               EASYT007
#01467     MOVE 'FBA' TO WS-PENGI-EZ-RECFM                              EASYT007
#01467     COMPUTE WS-PENGI-EZ-LRECL = (132 + 1)                        EASYT007
#01467     MOVE 0 TO WS-PENGI-EZ-BLKSIZE                                EASYT007
#01467     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#01467     MOVE SPACES TO WS-PENGI-EZ-IOMOD                             EASYT007
#01467     CLOSE SYSPRINT                                               EASYT007
#01467                                                                  EASYT007
#01467     MOVE ZERO TO SYSPRINT-IO-COUNT                               EASYT007
#01467     MOVE  'C' TO SYSPRINT-IOSW.                                  EASYT007
#01467                                                                  EASYT007
#01472***************************************************************** EASYT007
#01472* JOB3 INITIATION ROUTINE                                       * EASYT007
#01472***************************************************************** EASYT007
#01472 A03000-JOB3-ENTRY.                                               EASYT007
#01472                                                                  EASYT007
#01472     PERFORM A03090-JOB3-OPEN.                                    EASYT007
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 - MAIN LOGIC INTERFACE ROUTINE.                  * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
#01472     MOVE SPACES TO MATCH1-SELECT-FLAGS                           EXTRACT
#01472     PERFORM D00210-MATCH1-OPEN-FILES.                            EXTRACT

#01472     MOVE SPACES TO MATCH1-FLAG-AREAS.                            EXTRACT
#01472     PERFORM D00000-MATCH1-MAIN-LINE                              EXTRACT
#01472         UNTIL END-OF-MATCH1-INPUT.                               EXTRACT
#01472                                                                  EXTRACT
#01472* CLOSE FOR SYNCF3 WAS NOT GENERATED DUE TO USER REQUEST.         NULLIOR
#01472     MOVE SPACE   TO SYNCF3-ACCEPT-FLAG.                          NULLIOR
#01472                                                                  NULLIOR
#01472     IF NOT SMYFIL2-CLOSED                                        EXTRACT
#01472         MOVE 'O' TO SMYFIL2-IOSW                                 EXTRACT
#01472         PERFORM D00240-MATCH1-CLOSE-SMYFIL2.                     EXTRACT
#01472                                                                  EXTRACT
#01472     IF NOT SMYFIL-CLOSED                                         EXTRACT
#01472         MOVE 'O' TO SMYFIL-IOSW                                  EXTRACT
#01472         PERFORM D00250-MATCH1-CLOSE-SMYFIL.                      EXTRACT
#01472                                                                  EXTRACT
#01529     MOVE 'JOB3'  TO WS-PENGI-EZ-JID                              EASYT007
#01529     MOVE '3' TO WS-PENGI-EZ-JOB                                  EASYT007
#01529     DISPLAY ' '                                                  EASYT007
#01529     DISPLAY WS-PENGI-EZ-STAT1                                    EASYT007
#01529     DISPLAY ' '                                                  EASYT007
#01529     DISPLAY WS-PENGI-EZ-STAT2                                    EASYT007
#01529     MOVE 'OUTPUT' TO WS-PENGI-EZ-IOTYPE                          EASYT007
#01529     MOVE 'SYSPRINT' TO WS-PENGI-EZ-DDNAME                        EASYT007
#01529     MOVE SYSPRINT-IO-COUNT TO WS-PENGI-EZ-IO-COUNT               EASYT007
      *,FILE DCB INFO. IS FROM THE DEFAULT VALUES.
      *,THERE ARE NO REPORTS IN USE FOR THIS PRINTER.
#01529     MOVE SYSPRINT-IO-COUNT TO WS-PENGI-EZ-IO-COUNT               EASYT007
#01529     MOVE 'PRINTER' TO WS-PENGI-EZ-ORG                            EASYT007
#01529     MOVE 0 TO WS-PENGI-EZ-BLKSIZE                                EASYT007
#01529     MOVE 'FBA' TO WS-PENGI-EZ-RECFM                              EASYT007
#01529     COMPUTE WS-PENGI-EZ-LRECL = (132 + 1)                        EASYT007
#01529     MOVE 0 TO WS-PENGI-EZ-BLKSIZE                                EASYT007
#01529     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#01529     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#01529                                                                  EASYT007
#01529     MOVE ZERO TO SYSPRINT-STATUS                                 MCCGIOR
#01529     IF SYSPRINT-OPEN                                             MCCGIOR
#01529        CLOSE SYSPRINT                                            MCCGIOR
#01529     END-IF                                                       MCCGIOR
#01529     MOVE 'C'     TO SYSPRINT-IOSW                                MCCGIOR
#01529     MOVE SPACE   TO SYSPRINT-ACCEPT-FLAG                         MCCGIOR
#01529     IF NOT SYSPRINT-GOOD-IO                                      MCCGIOR
#01529        DISPLAY SYSPRINT-MESSAGE                                  MCCGIOR
#01529        MOVE 3020 TO WS-PENGI-RETURN                              ABRCODE
#01529        MOVE SYSPRINT-MESSAGE TO ABEND-MESSAGE                    MCCGIOR
#01529        PERFORM F00000-ABEND-CALL-FSABEC16.                       ABEND00
#01529                                                                  MCCGIOR
#01529     MOVE 'OUTPUT' TO WS-PENGI-EZ-IOTYPE                          EASYT007
#01529     MOVE 'ME7231' TO WS-PENGI-EZ-DDNAME                          EASYT007
#01529     MOVE ME7231-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                 EASYT007
#01529     MOVE ME7231-DCB-LRECL TO WS-PENGI-EZ-LRECL                   EASYT007
#01529     MOVE ME7231-PHORG TO WS-PENGI-EZ-ORG                         EASYT007
#01529     MOVE ME7231-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM               EASYT007
#01529     MOVE ME7231-IOM-NAME      TO WS-PENGI-EZ-IOMOD               EASYT007
#01529     MOVE ME7231-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE               EASYT007
#01529     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#01529     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#01529                                                                  EASYT007
#01529* ME7231 CLOSE ROUTINE                                            FDYNIOR
#01529     MOVE 'CLOSE'  TO ME7231-IO-REQUEST                           FDYNIOR
#01529     MOVE ZERO TO ME7231-STATUS                                   FDYNIOR
#01529     IF ME7231-OPEN                                               FDYNIOR
#01529        CALL 'FSDYNIO1' USING ME7231-DYNAM-FIB                    FDYNIOR
#01529        MOVE  ME7231-IO-ERCODE1 TO ME7231-STATUS                  FDYNIOR
#01529     END-IF                                                       FDYNIOR
#01529     MOVE 'C'     TO ME7231-IOSW                                  FDYNIOR
#01529     MOVE SPACE   TO ME7231-ACCEPT-FLAG                           FDYNIOR
#01529     IF (NOT ME7231-GOOD-IO)                                      FDYNIOR
#01529        DISPLAY ME7231-MESSAGE                                    FDYNIOR
#01529        MOVE 3021 TO WS-PENGI-RETURN                              ABRCODE
#01529        MOVE ME7231-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01529        DISPLAY ME7231-IOM-NAME ': ' ME7231-IO-VSMEMSG            FDYNIOR
#01529        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01529     END-IF.                                                      FDYNIOR
#01529                                                                  FDYNIOR
#01529     MOVE 'INPUT' TO WS-PENGI-EZ-IOTYPE                           EASYT007
#01529     MOVE 'SMYFIL' TO WS-PENGI-EZ-DDNAME                          EASYT007
#01529     MOVE SMYFIL-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                 EASYT007
#01529     MOVE SMYFIL-DCB-LRECL TO WS-PENGI-EZ-LRECL                   EASYT007
#01529     MOVE SMYFIL-PHORG TO WS-PENGI-EZ-ORG                         EASYT007
#01529     MOVE SMYFIL-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM               EASYT007
#01529     MOVE SMYFIL-IOM-NAME      TO WS-PENGI-EZ-IOMOD               EASYT007
#01529     MOVE SMYFIL-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE               EASYT007
#01529     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#01529     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#01529                                                                  EASYT007
#01529     MOVE 'INPUT' TO WS-PENGI-EZ-IOTYPE                           EASYT007
#01529     MOVE 'SMYFIL2' TO WS-PENGI-EZ-DDNAME                         EASYT007
#01529     MOVE SMYFIL2-IO-COUNT TO WS-PENGI-EZ-IO-COUNT                EASYT007
#01529     MOVE SMYFIL2-DCB-LRECL TO WS-PENGI-EZ-LRECL                  EASYT007
#01529     MOVE SMYFIL2-PHORG TO WS-PENGI-EZ-ORG                        EASYT007
#01529     MOVE SMYFIL2-IOM-NAME(6:2) TO WS-PENGI-EZ-RECFM              EASYT007
#01529     MOVE SMYFIL2-IOM-NAME      TO WS-PENGI-EZ-IOMOD              EASYT007
#01529     MOVE SMYFIL2-DCB-BLKSIZE TO WS-PENGI-EZ-BLKSIZE              EASYT007
#01529     DISPLAY WS-PENGI-EZ-STAT3.                                   EASYT007
#01529     MOVE SPACES TO WS-PENGI-EZ-IOMOD.                            EASYT007
#01529                                                                  EASYT007
#01529     MOVE WS-PENGI-RETURN TO RETURN-CODE. GOBACK.                 EASYT007
#01529                                                                  EASYT007
#00573***************************************************************** EASYT007
#00573* JOB1 FILE READ ROUTINE                                        * EASYT007
#00573***************************************************************** EASYT007
#00573 A01010-JOB1-READ.                                                EASYT007
      *,EXIT IF STOP/STOP EXECUTE TO PREVENT AN EXTRA READ
#00573     IF (NOT JOB1-REQUEST-STOP)                                   EASYT007
#00573         PERFORM A01020-JOB1-READ-NEXT                            EASYT007
#00573     END-IF.                                                      EASYT007
#00573                                                                  EASYT007
#00573***************************************************************** EASYT007
#00573* JOB1 FILE READ-NEXT ROUTINE                                   * EASYT007
#00573***************************************************************** EASYT007
#00573 A01020-JOB1-READ-NEXT.                                           EASYT007
#00573                                                                  EASYT007
#00573     MOVE 'READ'  TO M8234D-IO-REQUEST                            FDYNIOR
#00573     CALL 'FSDYNIO2' USING M8234D-DYNAM-FIB                       FDYNIOR
#00573     MOVE  M8234D-IO-ERCODE1 TO M8234D-STATUS                     FDYNIOR
#00573     IF END-OF-M8234D                                             FDYNIOR
#00573        MOVE '10'    TO M8234D-STATUS                             FDYNIOR
#00573     ELSE                                                         FDYNIOR
#00573     IF NOT M8234D-GOOD-IO                                        FDYNIOR
#00573        DISPLAY M8234D-MESSAGE                                    FDYNIOR
#00573        MOVE 3022 TO WS-PENGI-RETURN                              ABRCODE
#00573        MOVE M8234D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00573        DISPLAY M8234D-IOM-NAME ': ' M8234D-IO-VSMEMSG            FDYNIOR
#00573        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00573     ELSE                                                         FDYNIOR
#00573     ADD 1 TO M8234D-IO-COUNT.                                    FDYNIOR
#00573                                                                  FDYNIOR
#00573     MOVE M8234D-STATUS TO PENGI-CODE0                            EASYT007
#00573     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO M8234D-EZSTATUS        EASYT007
#00573                                                                  EASYT007
#00573     IF NOT (END-OF-M8234D                                        EASYT007
#00573              OR JOB1-REQUEST-STOP)                               EASYT007
#00573         MOVE M8234D-IO-AREA TO M8234D-RECORD                     EASYT007
#00573     GO TO A01030-JOB1-RUN.                                       EASYT007
#00573                                                                  EASYT007
#00573***************************************************************** EASYT007
#00573* JOB1 MAIN PROCESSING ROUTINE                                  * EASYT007
#00573***************************************************************** EASYT007
#00573 A01030-JOB1-RUN.                                                 EASYT007
#00573     MOVE ZERO TO WS-JOB1-REPORT-LEVL.                            EASYT007
#00574     MOVE PROOF-TRA-RECORD TO TRAN-WORK                           EASYT007
#00575     PERFORM A01050-TEST-TRANS                                    EASYT007
#00575        THRU A01070-TEST-TRANS-EXIT.                              EASYT007
#00575                                                                  EASYT007
#00577 A01040-AUTO-GENERATE-READ.                                       EASYT007
#00577     MOVE 1 TO WS-JOB1-FLAG                                       EASYT007
#00577     GO TO A01010-JOB1-READ.                                      EASYT007
#00577                                                                  EASYT007
#00577*-*************************************************************** EASYT007
#00577* JOB1 PROC NAME: TEST-TRANS                                    * EASYT007
#00577***************************************************************** EASYT007
#00577 A01050-TEST-TRANS.                                               EASYT007
#00578     IF T-BANK NOT NUMERIC OR T-OBLIGOR NOT NUMERIC OR T-SEQ NOT  EASYT007
#00578     NUMERIC                                                      EASYT007
#00579        GO TO A01060-END-TEST-TRANS                               EASYT007
#00580     END-IF                                                       EASYT007
#00581     IF T-BANK NOT = W-BANK                                       EASYT007
#00582        MOVE SPACES  TO KEY-CS-KEY                                EASYT007
#00583        MOVE 050  TO WS-PENGI-MOVE-G                              EASYT007
#00583        MOVE WS-PENGI-MOVE-G  TO KEY-CS-006-CODE                  EASYT007
#00584        MOVE T-BANK  TO KEY-CSH-BAN-NUM                           EASYT007
#00585        MOVE 1  TO WS-PENGI-MOVE-G                                EASYT007
#00585        MOVE WS-PENGI-MOVE-G  TO KEY-CSH-APP-CODE                 EASYT007
#00586        MOVE 01  TO WS-PENGI-MOVE-G                               EASYT007
#00586        MOVE WS-PENGI-MOVE-G  TO KEY-CSH-SEQ-NUM                  EASYT007
#00587        MOVE KEY-CS-KEY TO IM8104D-KSD-KEY                        EASYT007
#00587        PERFORM A01200-M8104D-1-READR                             EASYT007
#00588        IF END-OF-M8104D OR M8104D-EZSTATUS NOT = ZEROS           EASYT007
#00589           MOVE KEY-CS-KEY TO DLN-0001-KEY-CS-KEY                 EASYT007
#00589           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00589           WRITE SYSPRINT-RECORD  FROM DLN-0001                   EASYT007
#00589                   AFTER ADVANCING 1                              EASYT007
#00589           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00589           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00591           MOVE TRAN-WORK TO DLN-0002-TRAN-WORK                   EASYT007
#00591           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00591           WRITE SYSPRINT-RECORD  FROM DLN-0002                   EASYT007
#00591                   AFTER ADVANCING 1                              EASYT007
#00591           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00591           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00592           IF JOB1-SPECIAL-PROC                                   EASYT007
#00592              IF JOB1-START-PROC                                  EASYT007
#00592                 SET JOB1-STOP-JOB TO TRUE                        EASYT007
#00592                 GO TO A01070-TEST-TRANS-EXIT                     EASYT007
#00592              END-IF                                              EASYT007
#00592              IF JOB1-FINISH-PROC                                 EASYT007
#00592                 SET JOB1-STOP-JOB TO TRUE                        EASYT007
#00592                 GO TO A01070-TEST-TRANS-EXIT                     EASYT007
#00592              END-IF                                              EASYT007
#00592           ELSE                                                   EASYT007
#00592              SET JOB1-STOP-JOB TO TRUE                           EASYT007
#00592              GO TO A01010-JOB1-READ                              EASYT007
#00592           END-IF                                                 EASYT007
#00593        END-IF                                                    EASYT007
#00594        MOVE CSH030-CUR-DATE  TO DATE-IN                          EASYT007
#00595        MOVE CSH030-CUR-DATE  TO DATE-INC                         EASYT007
#00596        MOVE CSH008-BAN-NUM  TO W-BANK                            EASYT007
#00597        MOVE CSH050-BANK-NAME  TO W-BANK-NAME                     EASYT007
#00598        MOVE CSH036-LAS-DATE  TO W-ACCRUAL-DATE                   EASYT007
#00599        MOVE W-ACCRUAL-DATE  TO DATE-IN                           EASYT007
#00600        MOVE DATE-IN  TO ACCR-DATE                                EASYT007
#00601     END-IF                                                       EASYT007
#00603     IF (T-TRAN-CODE NOT > 4009 AND NOT < 4000)                   EASYT007
#00604        MOVE T-BANK (1: 2) TO WS-PENGI-MOVE-G                     EASYT007
#00604        IF (WS-PENGI-MOVE-G (1: 2) = SPACES)                      EASYT007
#00604           MOVE ZEROS TO KEY-V-005-NUMBER                         EASYT007
#00604        ELSE                                                      EASYT007
#00604           MOVE T-BANK  TO KEY-V-005-NUMBER                       EASYT007
#00604        END-IF                                                    EASYT007
#00605        MOVE T-OBLIGOR (1: 10) TO WS-PENGI-MOVE-G                 EASYT007
#00605        IF (WS-PENGI-MOVE-G (1: 10) = SPACES)                     EASYT007
#00605           MOVE ZEROS TO KEY-V-010-NUMBER                         EASYT007
#00605        ELSE                                                      EASYT007
#00605           MOVE T-OBLIGOR  TO KEY-V-010-NUMBER                    EASYT007
#00605        END-IF                                                    EASYT007
#00606        MOVE 00000  TO KEY-V-025-CODE                             EASYT007
#00607        MOVE T-INVOICE (1: 10) TO WS-PENGI-MOVE-G                 EASYT007
#00607        IF (WS-PENGI-MOVE-G (1: 10) = SPACES)                     EASYT007
#00607           MOVE ZEROS TO KEY-V-013-NUMBER                         EASYT007
#00607        ELSE                                                      EASYT007
#00607           MOVE T-INVOICE  TO KEY-V-013-NUMBER                    EASYT007
#00607        END-IF                                                    EASYT007
#00608        MOVE KEY-V-KEY TO IM8134D-KSD-KEY                         EASYT007
#00608        PERFORM A01210-M8134D-2-START                             EASYT007
#00609        IF END-OF-M8134D OR M8134D-EZSTATUS NOT = ZEROS           EASYT007
#00610           MOVE KEY-V-KEY TO DLN-0003-KEY-V-KEY                   EASYT007
#00610           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00610           WRITE SYSPRINT-RECORD  FROM DLN-0003                   EASYT007
#00610                   AFTER ADVANCING 1                              EASYT007
#00610           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00610           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00612           MOVE TRAN-WORK TO DLN-0004-TRAN-WORK                   EASYT007
#00612           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00612           WRITE SYSPRINT-RECORD  FROM DLN-0004                   EASYT007
#00612                   AFTER ADVANCING 1                              EASYT007
#00612           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00612           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00613           GO TO A01060-END-TEST-TRANS                            EASYT007
#00614        END-IF                                                    EASYT007
#00615        PERFORM A01220-M8134D-3-READ                              EASYT007
#00616        IF END-OF-M8134D OR M8134D-EZSTATUS NOT = ZEROS           EASYT007
#00617           MOVE KEY-V-KEY TO DLN-0005-KEY-V-KEY                   EASYT007
#00617           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00617           WRITE SYSPRINT-RECORD  FROM DLN-0005                   EASYT007
#00617                   AFTER ADVANCING 1                              EASYT007
#00617           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00617           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00619           MOVE TRAN-WORK TO DLN-0006-TRAN-WORK                   EASYT007
#00619           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00619           WRITE SYSPRINT-RECORD  FROM DLN-0006                   EASYT007
#00619                   AFTER ADVANCING 1                              EASYT007
#00619           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00619           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00620           GO TO A01060-END-TEST-TRANS                            EASYT007
#00621        END-IF                                                    EASYT007
#00622        IF T-INVOICE NOT NUMERIC                                  EASYT007
#00623           MOVE TRAN-WORK TO DLN-0007-TRAN-WORK                   EASYT007
#00623           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00623           WRITE SYSPRINT-RECORD  FROM DLN-0007                   EASYT007
#00623                   AFTER ADVANCING 1                              EASYT007
#00623           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00623           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00624           GO TO A01060-END-TEST-TRANS                            EASYT007
#00625        END-IF                                                    EASYT007
#00626        IF VI013-INV-NUMBER NOT = T-INVOICE                       EASYT007
#00627           MOVE TRAN-WORK TO DLN-0008-TRAN-WORK                   EASYT007
#00627           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00627           WRITE SYSPRINT-RECORD  FROM DLN-0008                   EASYT007
#00627                   AFTER ADVANCING 1                              EASYT007
#00627           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00627           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00628           GO TO A01060-END-TEST-TRANS                            EASYT007
#00629        END-IF                                                    EASYT007
#00630        MOVE VI055-OBL-NUMBER  TO T-OBLIGATION                    EASYT007
#00631        PERFORM A01080-OBLIGATION-READ                            EASYT007
#00631           THRU A01100-OBLIGATION-READ-EXIT                       EASYT007
#00632        IF NRF-OBLIGATION = 'Y'                                   EASYT007
#00633           GO TO A01060-END-TEST-TRANS                            EASYT007
#00634        END-IF                                                    EASYT007
#00635        MOVE 00502  TO CRITERIA                                   EASYT007
#00636        PERFORM A01280-GENERATE-TRAN-RPT                          EASYT007
#00636           THRU A01290-GENERATE-TRAN-RPT-EXIT                     EASYT007
#00638        GO TO A01060-END-TEST-TRANS                               EASYT007
#00639     END-IF                                                       EASYT007
#00640     IF (T-TRAN-CODE = 4022 OR 4042)                              EASYT007
#00641        PERFORM A01080-OBLIGATION-READ                            EASYT007
#00641           THRU A01100-OBLIGATION-READ-EXIT                       EASYT007
#00642        IF NRF-OBLIGATION = 'Y'                                   EASYT007
#00643           GO TO A01060-END-TEST-TRANS                            EASYT007
#00644        END-IF                                                    EASYT007
#00645        MOVE 00502  TO CRITERIA                                   EASYT007
#00646        PERFORM A01280-GENERATE-TRAN-RPT                          EASYT007
#00646           THRU A01290-GENERATE-TRAN-RPT-EXIT                     EASYT007
#00648        GO TO A01060-END-TEST-TRANS                               EASYT007
#00649     END-IF                                                       EASYT007
#00650     IF (T-TRAN-CODE = 3402 OR 3502 OR 3602)                      EASYT007
#00651        PERFORM A01080-OBLIGATION-READ                            EASYT007
#00651           THRU A01100-OBLIGATION-READ-EXIT                       EASYT007
#00652        IF NRF-OBLIGATION = 'Y'                                   EASYT007
#00653           GO TO A01060-END-TEST-TRANS                            EASYT007
#00654        END-IF                                                    EASYT007
#00655        MOVE 00501  TO CRITERIA                                   EASYT007
#00659        GO TO A01060-END-TEST-TRANS                               EASYT007
#00660     END-IF                                                       EASYT007
#00661     IF T-TRAN-CODE = 3902                                        EASYT007
#00662        PERFORM A01080-OBLIGATION-READ                            EASYT007
#00662           THRU A01100-OBLIGATION-READ-EXIT                       EASYT007
#00663        IF NRF-OBLIGATION = 'Y'                                   EASYT007
#00664           GO TO A01060-END-TEST-TRANS                            EASYT007
#00665        END-IF                                                    EASYT007
#00666        IF PROCESS-TYPE-LOW NOT = 55                              EASYT007
#00667           MOVE 00531  TO CRITERIA                                EASYT007
#00668        ELSE                                                      EASYT007
#00672           GO TO A01060-END-TEST-TRANS                            EASYT007
#00673        END-IF                                                    EASYT007
#00674        PERFORM A01280-GENERATE-TRAN-RPT                          EASYT007
#00674           THRU A01290-GENERATE-TRAN-RPT-EXIT                     EASYT007
#00676        GO TO A01060-END-TEST-TRANS                               EASYT007
#00677     END-IF                                                       EASYT007
#00678     IF T-TRAN-CODE = 9881                                        EASYT007
#00679        PERFORM A01080-OBLIGATION-READ                            EASYT007
#00679           THRU A01100-OBLIGATION-READ-EXIT                       EASYT007
#00680        IF NRF-OBLIGATION = 'Y'                                   EASYT007
#00681           GO TO A01060-END-TEST-TRANS                            EASYT007
#00682        END-IF                                                    EASYT007
#00683        MOVE 00002  TO CRITERIA                                   EASYT007
#00686        GO TO A01060-END-TEST-TRANS                               EASYT007
#00687     END-IF.                                                      EASYT007
#00687                                                                  EASYT007
#00689 A01060-END-TEST-TRANS.                                           EASYT007
#00689 A01070-TEST-TRANS-EXIT. EXIT.                                    EASYT007
#00691                                                                  EASYT007
#00691*-*************************************************************** EASYT007
#00691* JOB1 PROC NAME: OBLIGATION-READ                               * EASYT007
#00691***************************************************************** EASYT007
#00691 A01080-OBLIGATION-READ.                                          EASYT007
#00692     MOVE SPACES TO NRF-OBLIGATION                                EASYT007
#00693     IF T-OBLIGOR NOT NUMERIC                                     EASYT007
#00694        MOVE TRAN-WORK TO DLN-0009-TRAN-WORK                      EASYT007
#00694        ADD 1 TO SYSPRINT-IO-COUNT                                EASYT007
#00694        WRITE SYSPRINT-RECORD  FROM DLN-0009                      EASYT007
#00694                AFTER ADVANCING 1                                 EASYT007
#00694        MOVE SYSPRINT-STATUS TO PENGI-CODE0                       EASYT007
#00694        MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUS   EASYT007
#00695        MOVE 'Y' TO NRF-OBLIGATION                                EASYT007
#00696        GO TO A01090-END-OBN-READ                                 EASYT007
#00697     END-IF                                                       EASYT007
#00698     MOVE T-BANK  TO KEY-M-005-NUMBER                             EASYT007
#00699     MOVE T-OBLIGOR  TO KEY-M-010-NUMBER                          EASYT007
#00700     MOVE T-APPLICATION  TO KEY-M-012-CODE                        EASYT007
#00701     MOVE T-OBLIGATION (1: 10) TO WS-PENGI-MOVE-G                 EASYT007
#00701     IF (WS-PENGI-MOVE-G (1: 10) = SPACES)                        EASYT007
#00701        MOVE ZEROS TO KEY-M-015-NUMBER                            EASYT007
#00701     ELSE                                                         EASYT007
#00701        MOVE T-OBLIGATION  TO KEY-M-015-NUMBER                    EASYT007
#00701     END-IF                                                       EASYT007
#00702     MOVE 300  TO WS-PENGI-MOVE-G                                 EASYT007
#00702     MOVE WS-PENGI-MOVE-G  TO KEY-M-025-CODE                      EASYT007
#00703     IF T-TRAN-CODE = 9881                                        EASYT007
#00704        MOVE 200  TO WS-PENGI-MOVE-G                              EASYT007
#00704        MOVE WS-PENGI-MOVE-G  TO KEY-M-025-CODE                   EASYT007
#00705     END-IF                                                       EASYT007
#00706     IF (T-TRAN-CODE NOT > 4009 AND NOT < 4000)                   EASYT007
#00707        MOVE VI074-FUT-OR-COD  TO WS-PENGI-MOVE-G                 EASYT007
#00707        MOVE WS-PENGI-MOVE-G  TO KEY-M-025-1                      EASYT007
#00708     END-IF                                                       EASYT007
#00709     MOVE KEY-M-KEY TO IM8124D-KSD-KEY                            EASYT007
#00709     PERFORM A01230-M8124D-4-READR                                EASYT007
#00710     IF END-OF-M8124D OR M8124D-EZSTATUS NOT = ZEROS              EASYT007
#00711        MOVE T-OBLIGOR TO DLN-0010-T-OBLIGOR                      EASYT007
#00711        ADD 1 TO SYSPRINT-IO-COUNT                                EASYT007
#00711        WRITE SYSPRINT-RECORD  FROM DLN-0010                      EASYT007
#00711                AFTER ADVANCING 1                                 EASYT007
#00711        MOVE SYSPRINT-STATUS TO PENGI-CODE0                       EASYT007
#00711        MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUS   EASYT007
#00712        MOVE M8124D-EZSTATUS TO DLN-0011-M8124D-EZSTATUS          EASYT007
#00712        MOVE KEY-M-KEY TO DLN-0011-KEY-M-KEY                      EASYT007
#00712        ADD 1 TO SYSPRINT-IO-COUNT                                EASYT007
#00712        WRITE SYSPRINT-RECORD  FROM DLN-0011                      EASYT007
#00712                AFTER ADVANCING 1                                 EASYT007
#00712        MOVE SYSPRINT-STATUS TO PENGI-CODE0                       EASYT007
#00712        MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUS   EASYT007
#00714        MOVE TRAN-WORK TO DLN-0012-TRAN-WORK                      EASYT007
#00714        ADD 1 TO SYSPRINT-IO-COUNT                                EASYT007
#00714        WRITE SYSPRINT-RECORD  FROM DLN-0012                      EASYT007
#00714                AFTER ADVANCING 1                                 EASYT007
#00714        MOVE SYSPRINT-STATUS TO PENGI-CODE0                       EASYT007
#00714        MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUS   EASYT007
#00715        MOVE 'Y' TO NRF-OBLIGATION                                EASYT007
#00716        GO TO A01090-END-OBN-READ                                 EASYT007
#00717     END-IF                                                       EASYT007
#00718     MOVE MC025-REC-CODE  TO HOLD-RECORD-CODE                     EASYT007
#00719     MOVE MC038-PRO-TYPE (1: 4) TO WS-PENGI-MOVE-G                EASYT007
#00719     IF (WS-PENGI-MOVE-G (1: 4) = SPACES)                         EASYT007
#00719        MOVE ZEROS TO HOLD-PRO-TYPE                               EASYT007
#00719     ELSE                                                         EASYT007
#00719        MOVE MC038-PRO-TYPE  TO HOLD-PRO-TYPE                     EASYT007
#00719     END-IF                                                       EASYT007
#00720     MOVE MC005-BAN-NUMBER (1: 2) TO WS-PENGI-MOVE-G              EASYT007
#00720     IF (WS-PENGI-MOVE-G (1: 2) = SPACES)                         EASYT007
#00720        MOVE ZEROS TO W-BANK                                      EASYT007
#00720     ELSE                                                         EASYT007
#00720        MOVE MC005-BAN-NUMBER  TO W-BANK                          EASYT007
#00720     END-IF                                                       EASYT007
#00721     MOVE MC010-OBL-NUMBER (1: 10) TO WS-PENGI-MOVE-G             EASYT007
#00721     IF (WS-PENGI-MOVE-G (1: 10) = SPACES)                        EASYT007
#00721        MOVE ZEROS TO W-OBLIGOR                                   EASYT007
#00721     ELSE                                                         EASYT007
#00721        MOVE MC010-OBL-NUMBER  TO W-OBLIGOR                       EASYT007
#00721     END-IF                                                       EASYT007
#00722     MOVE MC015-OBL-NUMBER  TO UNPACK-OBL-NUM                     EASYT007
#00723     MOVE UNPACK-OBL-NUM  TO W-OBLIGAT                            EASYT007
#00724     MOVE MC040-OBL-NAME TO W-SHORT-NAME                          EASYT007
#00725     MOVE MC080-SER-UNIT (1: 5) TO WS-PENGI-MOVE-G                EASYT007
#00725     IF (WS-PENGI-MOVE-G (1: 5) = SPACES)                         EASYT007
#00725        MOVE ZEROS TO W-SERVICE                                   EASYT007
#00725     ELSE                                                         EASYT007
#00725        MOVE MC080-SER-UNIT  TO W-SERVICE                         EASYT007
#00725     END-IF                                                       EASYT007
#00726     MOVE MC081-ASS-UNIT (1: 5) TO WS-PENGI-MOVE-G                EASYT007
#00726     IF (WS-PENGI-MOVE-G (1: 5) = SPACES)                         EASYT007
#00726        MOVE ZEROS TO W-ASSIGNMENT                                EASYT007
#00726     ELSE                                                         EASYT007
#00726        MOVE MC081-ASS-UNIT  TO W-ASSIGNMENT                      EASYT007
#00726     END-IF                                                       EASYT007
#00727     MOVE MC083-GEN-CODE (1: 7) TO WS-PENGI-MOVE-G                EASYT007
#00727     IF (WS-PENGI-MOVE-G (1: 7) = SPACES)                         EASYT007
#00727        MOVE ZEROS TO W-GL-CODE                                   EASYT007
#00727     ELSE                                                         EASYT007
#00727        MOVE MC083-GEN-CODE  TO W-GL-CODE                         EASYT007
#00727     END-IF                                                       EASYT007
#00728     IF HOLD-RECORD-CODE = 200                                    EASYT007
#00729        MOVE 'CML99' TO DESCRIPTION                               EASYT007
#00730     ELSE                                                         EASYT007
#00731        MOVE W-GL-CODE TO ARG                                     EASYT007
#00731        PERFORM A01170-GLCODES-SEARCH                             EASYT007
#00731        IF GLCODES-GOOD-IO                                        EASYT007
#00731           MOVE DESC TO DESCRIPTION                               EASYT007
#00731        END-IF                                                    EASYT007
#00731                                                                  EASYT007
#00731        MOVE GLCODES-STATUS TO PENGI-CODE0                        EASYT007
#00731        MOVE PENGI-CODES (PENGI-CODE0 + 1) TO GLCODES-EZSTATUS    EASYT007
#00732        IF NOT GLCODES-GOOD-IO                                    EASYT007
#00733           MOVE 00000  TO REAL-GL-CODE                            EASYT007
#00734           MOVE W-GL-CODE TO DLN-0013-W-GL-CODE                   EASYT007
#00734           MOVE HOLD-RECORD-CODE TO DLN-0013-HOLD-RECORD-CODE     EASYT007
#00734           MOVE W-OBLIGAT TO DLN-0013-W-OBLIGAT                   EASYT007
#00734           MOVE W-OBLIGOR TO DLN-0013-W-OBLIGOR                   EASYT007
#00734           MOVE W-BANK TO DLN-0013-W-BANK                         EASYT007
                 PERFORM B00000-CON-DLN-0013-CHR                        CON-DLN-
#00734           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00734           WRITE SYSPRINT-RECORD  FROM DLN-0013                   EASYT007
#00734                   AFTER ADVANCING 1                              EASYT007
#00734           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00734           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00736        END-IF                                                    EASYT007
#00737     END-IF                                                       EASYT007
#00738     MOVE 'F' TO RATE-CODE                                        EASYT007
#00739     MOVE MC043-OBL-TYPE  TO OBLIGATION-TYPE                      EASYT007
#00740     MOVE SPACES TO WORK-FILLER.                                  EASYT007
#00740                                                                  EASYT007
#00742 A01090-END-OBN-READ.                                             EASYT007
#00742 A01100-OBLIGATION-READ-EXIT. EXIT.                               EASYT007
#00744                                                                  EASYT007
#00744*-*************************************************************** EASYT007
#00744* JOB1 PROC NAME: ACH-PROC                                      * EASYT007
#00744***************************************************************** EASYT007
#00744 A01110-ACH-PROC.                                                 EASYT007
#00745                                                                  EASYT007
#00745 A01120-ACH-LOOP.                                                 EASYT007
#00746     PERFORM A01240-ACH-5-READ                                    EASYT007
#00747     IF END-OF-ACH                                                EASYT007
#00748        GO TO A01130-END-ACH                                      EASYT007
#00749     END-IF                                                       EASYT007
#00750     MOVE ACH-RECORD-Y1 TO TRAN-WORK                              EASYT007
#00751     PERFORM A01050-TEST-TRANS                                    EASYT007
#00751        THRU A01070-TEST-TRANS-EXIT                               EASYT007
#00752     GO TO A01120-ACH-LOOP.                                       EASYT007
#00752                                                                  EASYT007
#00754 A01130-END-ACH.                                                  EASYT007
#00754 A01140-ACH-PROC-EXIT. EXIT.                                      EASYT007
#00756                                                                  EASYT007
#00756*-*************************************************************** EASYT007
#00756* JOB1 PROC NAME: GET-PROCESS-DATE                              * EASYT007
#00756***************************************************************** EASYT007
#00756 A01150-GET-PROCESS-DATE.                                         EASYT007
#00757     MOVE SPACES  TO KEY-M-KEY                                    EASYT007
#00758     MOVE KEY-M-KEY TO IM8124D-KSD-KEY                            EASYT007
#00758     PERFORM A01250-M8124D-6-START                                EASYT007
#00759     IF END-OF-M8124D OR M8124D-EZSTATUS NOT = ZEROS              EASYT007
#00760        MOVE KEY-M-KEY TO DLN-0014-KEY-M-KEY                      EASYT007
#00760        ADD 1 TO SYSPRINT-IO-COUNT                                EASYT007
#00760        WRITE SYSPRINT-RECORD  FROM DLN-0014                      EASYT007
#00760                AFTER ADVANCING 1                                 EASYT007
#00760        MOVE SYSPRINT-STATUS TO PENGI-CODE0                       EASYT007
#00760        MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUS   EASYT007
#00762        IF JOB1-SPECIAL-PROC                                      EASYT007
#00762           IF JOB1-START-PROC                                     EASYT007
#00762              SET JOB1-STOP-JOB TO TRUE                           EASYT007
#00762              GO TO A01160-GET-PROCESS-DATE-EXIT                  EASYT007
#00762           END-IF                                                 EASYT007
#00762           IF JOB1-FINISH-PROC                                    EASYT007
#00762              SET JOB1-STOP-JOB TO TRUE                           EASYT007
#00762              GO TO A01160-GET-PROCESS-DATE-EXIT                  EASYT007
#00762           END-IF                                                 EASYT007
#00762        ELSE                                                      EASYT007
#00762           SET JOB1-STOP-JOB TO TRUE                              EASYT007
#00762           GO TO A01010-JOB1-READ                                 EASYT007
#00762        END-IF                                                    EASYT007
#00763     END-IF                                                       EASYT007
#00764     PERFORM A01260-M8124D-7-READ                                 EASYT007
#00765     IF END-OF-M8124D OR M8124D-EZSTATUS NOT = ZEROS              EASYT007
#00766        MOVE KEY-M-KEY TO DLN-0015-KEY-M-KEY                      EASYT007
#00766        ADD 1 TO SYSPRINT-IO-COUNT                                EASYT007
#00766        WRITE SYSPRINT-RECORD  FROM DLN-0015                      EASYT007
#00766                AFTER ADVANCING 1                                 EASYT007
#00766        MOVE SYSPRINT-STATUS TO PENGI-CODE0                       EASYT007
#00766        MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUS   EASYT007
#00768        IF JOB1-SPECIAL-PROC                                      EASYT007
#00768           IF JOB1-START-PROC                                     EASYT007
#00768              SET JOB1-STOP-JOB TO TRUE                           EASYT007
#00768              GO TO A01160-GET-PROCESS-DATE-EXIT                  EASYT007
#00768           END-IF                                                 EASYT007
#00768           IF JOB1-FINISH-PROC                                    EASYT007
#00768              SET JOB1-STOP-JOB TO TRUE                           EASYT007
#00768              GO TO A01160-GET-PROCESS-DATE-EXIT                  EASYT007
#00768           END-IF                                                 EASYT007
#00768        ELSE                                                      EASYT007
#00768           SET JOB1-STOP-JOB TO TRUE                              EASYT007
#00768           GO TO A01010-JOB1-READ                                 EASYT007
#00768        END-IF                                                    EASYT007
#00769     END-IF                                                       EASYT007
#00770     MOVE M-DATE (1: 6) TO WS-PENGI-MOVE-G                        EASYT007
#00770     IF (WS-PENGI-MOVE-G (1: 6) = SPACES)                         EASYT007
#00770        MOVE ZEROS TO DATE-OUT                                    EASYT007
#00770     ELSE                                                         EASYT007
#00770        MOVE M-DATE  TO DATE-OUT                                  EASYT007
#00770     END-IF                                                       EASYT007
#00771     MOVE MM-OUT  TO MM-IN                                        EASYT007
#00772     MOVE DD-OUT  TO DD-IN                                        EASYT007
#00773     MOVE YY-OUT  TO YY-IN                                        EASYT007
#00774     MOVE DATE-IN  TO PROC-DATE.                                  EASYT007
#00774                                                                  EASYT007
#00775 A01160-GET-PROCESS-DATE-EXIT. EXIT.                              EASYT007
#00731                                                                  EASYT007
#00731 A01170-GLCODES-SEARCH.                                           EASYT007
#00731     PERFORM C00000-GLCODES-POINT.                                TBSERV1
#00731     IF NOT (END-OF-GLCODES OR GLCODES-CROW = ZERO)               TBSERV1
#00731        MOVE GLCODES-QAREA-TBFIELDS (GLCODES-CROW) TO             TBSERV1
              GLCODES-QAREA                                             TBSERV1
#00731     END-IF.                                                      TBSERV1
#00731                                                                  EASYT007
#00573***************************************************************** EASYT007
#00573* JOB1 FILE OPEN ROUTINE                                        * EASYT007
#00573***************************************************************** EASYT007
#00573 A01180-JOB1-OPEN.                                                EASYT007
#00777     MOVE 'X' TO SYSPRINT-IOSW                                    EASYT007
#00777     PERFORM E00260-REPORT1-OPEN                                  EASYT007
#00777     MOVE 'C' TO SYSPRINT-IOSW.                                   EASYT007
#00787                                                                  FDYNIOR
#00787* M8104D OPEN ROUTINE                                             FDYNIOR
#00787     MOVE 'OPEN'  TO M8104D-IO-REQUEST                            FDYNIOR
#00787     MOVE 'INPUT'  TO M8104D-IO-REQTYPE                           FDYNIOR
#00787     CALL 'FSDYNIO1' USING M8104D-DYNAM-FIB                       FDYNIOR
#00787                           IM8104D-KSD-KEY                        FDYNIOR
#00787     IF M8104D-KEY-PTR = NULL                                     FDYNIOR
#00787        SET ADDRESS OF M8104D-IO-AREA TO M8104D-IOAREA-PTR        FDYNIOR
#00787        SET M8104D-KEY-PTR TO ADDRESS OF IM8104D-KSD-KEY          FDYNIOR
#00787     END-IF                                                       FDYNIOR
#00787     MOVE  M8104D-IO-ERCODE1 TO M8104D-STATUS                     FDYNIOR
#00787     MOVE 'O'     TO M8104D-IOSW                                  FDYNIOR
#00787     IF M8104D-STATUS = '35'                                      FDYNIOR
#00787        MOVE 'I-O'  TO M8104D-IO-REQTYPE                          FDYNIOR
#00787        MOVE 'OPEN'  TO M8104D-IO-REQUEST                         FDYNIOR
#00787        CALL 'FSDYNIO1' USING M8104D-DYNAM-FIB                    FDYNIOR
#00787                           IM8104D-KSD-KEY                        FDYNIOR
#00787        MOVE  M8104D-IO-ERCODE1 TO M8104D-STATUS                  FDYNIOR
#00787        IF M8104D-STATUS = ZERO                                   FDYNIOR
#00787           MOVE '10' TO M8104D-STATUS                             FDYNIOR
#00787           MOVE 'E' TO M8104D-IOSW                                FDYNIOR
#00787        END-IF                                                    FDYNIOR
#00787     END-IF                                                       FDYNIOR
#00787     MOVE 'Y'     TO M8104D-ACCEPT-FLAG                           FDYNIOR
#00787     MOVE ZERO    TO M8104D-IO-COUNT                              FDYNIOR
#00787     IF (NOT M8104D-GOOD-IO)                                      FDYNIOR
#00787       AND (M8104D-IOSW NOT = 'E')                                FDYNIOR
#00787        DISPLAY M8104D-MESSAGE                                    FDYNIOR
#00787        MOVE 3023 TO WS-PENGI-RETURN                              ABRCODE
#00787        MOVE M8104D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00787        DISPLAY M8104D-IOM-NAME ': ' M8104D-IO-VSMEMSG            FDYNIOR
#00787        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00787     END-IF.                                                      FDYNIOR
#00787     SET ADDRESS OF M8104D-IO-AREA TO M8104D-IOAREA-PTR           FDYNIOR
#00787     CALL 'FSDYNPTR' USING  M8104D-DYNAM-FIB                      FDYNIOR
#00787     SET ADDRESS OF M8104D-RECORD  TO M8104D-RECORD-PTR           FDYNIOR
#00787     MOVE SPACES TO M8104D-RECORD.                                FDYNIOR
#00787     INITIALIZE M8104D-GRECORD.                                   FDYNIOR
#00787                                                                  FDYNIOR
#00787* M8124D OPEN ROUTINE                                             FDYNIOR
#00787     MOVE 'OPEN'  TO M8124D-IO-REQUEST                            FDYNIOR
#00787     MOVE 'INPUT'  TO M8124D-IO-REQTYPE                           FDYNIOR
#00787     CALL 'FSDYNIO1' USING M8124D-DYNAM-FIB                       FDYNIOR
#00787                           IM8124D-KSD-KEY                        FDYNIOR
#00787     IF M8124D-KEY-PTR = NULL                                     FDYNIOR
#00787        SET ADDRESS OF M8124D-IO-AREA TO M8124D-IOAREA-PTR        FDYNIOR
#00787        SET M8124D-KEY-PTR TO ADDRESS OF IM8124D-KSD-KEY          FDYNIOR
#00787     END-IF                                                       FDYNIOR
#00787     MOVE  M8124D-IO-ERCODE1 TO M8124D-STATUS                     FDYNIOR
#00787     MOVE 'O'     TO M8124D-IOSW                                  FDYNIOR
#00787     IF M8124D-STATUS = '35'                                      FDYNIOR
#00787        MOVE 'I-O'  TO M8124D-IO-REQTYPE                          FDYNIOR
#00787        MOVE 'OPEN'  TO M8124D-IO-REQUEST                         FDYNIOR
#00787        CALL 'FSDYNIO1' USING M8124D-DYNAM-FIB                    FDYNIOR
#00787                           IM8124D-KSD-KEY                        FDYNIOR
#00787        MOVE  M8124D-IO-ERCODE1 TO M8124D-STATUS                  FDYNIOR
#00787        IF M8124D-STATUS = ZERO                                   FDYNIOR
#00787           MOVE '10' TO M8124D-STATUS                             FDYNIOR
#00787           MOVE 'E' TO M8124D-IOSW                                FDYNIOR
#00787        END-IF                                                    FDYNIOR
#00787     END-IF                                                       FDYNIOR
#00787     MOVE 'Y'     TO M8124D-ACCEPT-FLAG                           FDYNIOR
#00787     MOVE ZERO    TO M8124D-IO-COUNT                              FDYNIOR
#00787     IF (NOT M8124D-GOOD-IO)                                      FDYNIOR
#00787       AND (M8124D-IOSW NOT = 'E')                                FDYNIOR
#00787        DISPLAY M8124D-MESSAGE                                    FDYNIOR
#00787        MOVE 3024 TO WS-PENGI-RETURN                              ABRCODE
#00787        MOVE M8124D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00787        DISPLAY M8124D-IOM-NAME ': ' M8124D-IO-VSMEMSG            FDYNIOR
#00787        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00787     END-IF.                                                      FDYNIOR
#00787     SET ADDRESS OF M8124D-IO-AREA TO M8124D-IOAREA-PTR           FDYNIOR
#00787     CALL 'FSDYNPTR' USING  M8124D-DYNAM-FIB                      FDYNIOR
#00787     SET ADDRESS OF M8124D-RECORD  TO M8124D-RECORD-PTR           FDYNIOR
#00787     MOVE SPACES TO M8124D-RECORD.                                FDYNIOR
#00787     INITIALIZE M8124D-GRECORD.                                   FDYNIOR
#00787                                                                  FDYNIOR
#00787* M8134D OPEN ROUTINE                                             FDYNIOR
#00787     MOVE 'OPEN'  TO M8134D-IO-REQUEST                            FDYNIOR
#00787     MOVE 'INPUT'  TO M8134D-IO-REQTYPE                           FDYNIOR
#00787     CALL 'FSDYNIO1' USING M8134D-DYNAM-FIB                       FDYNIOR
#00787                           IM8134D-KSD-KEY                        FDYNIOR
#00787     IF M8134D-KEY-PTR = NULL                                     FDYNIOR
#00787        SET ADDRESS OF M8134D-IO-AREA TO M8134D-IOAREA-PTR        FDYNIOR
#00787        SET M8134D-KEY-PTR TO ADDRESS OF IM8134D-KSD-KEY          FDYNIOR
#00787     END-IF                                                       FDYNIOR
#00787     MOVE  M8134D-IO-ERCODE1 TO M8134D-STATUS                     FDYNIOR
#00787     MOVE 'O'     TO M8134D-IOSW                                  FDYNIOR
#00787     IF M8134D-STATUS = '35'                                      FDYNIOR
#00787        MOVE 'I-O'  TO M8134D-IO-REQTYPE                          FDYNIOR
#00787        MOVE 'OPEN'  TO M8134D-IO-REQUEST                         FDYNIOR
#00787        CALL 'FSDYNIO1' USING M8134D-DYNAM-FIB                    FDYNIOR
#00787                           IM8134D-KSD-KEY                        FDYNIOR
#00787        MOVE  M8134D-IO-ERCODE1 TO M8134D-STATUS                  FDYNIOR
#00787        IF M8134D-STATUS = ZERO                                   FDYNIOR
#00787           MOVE '10' TO M8134D-STATUS                             FDYNIOR
#00787           MOVE 'E' TO M8134D-IOSW                                FDYNIOR
#00787        END-IF                                                    FDYNIOR
#00787     END-IF                                                       FDYNIOR
#00787     MOVE 'Y'     TO M8134D-ACCEPT-FLAG                           FDYNIOR
#00787     MOVE ZERO    TO M8134D-IO-COUNT                              FDYNIOR
#00787     IF (NOT M8134D-GOOD-IO)                                      FDYNIOR
#00787       AND (M8134D-IOSW NOT = 'E')                                FDYNIOR
#00787        DISPLAY M8134D-MESSAGE                                    FDYNIOR
#00787        MOVE 3025 TO WS-PENGI-RETURN                              ABRCODE
#00787        MOVE M8134D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00787        DISPLAY M8134D-IOM-NAME ': ' M8134D-IO-VSMEMSG            FDYNIOR
#00787        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00787     END-IF.                                                      FDYNIOR
#00787     SET ADDRESS OF M8134D-IO-AREA TO M8134D-IOAREA-PTR           FDYNIOR
#00787     CALL 'FSDYNPTR' USING  M8134D-DYNAM-FIB                      FDYNIOR
#00787     SET ADDRESS OF M8134D-RECORD  TO M8134D-RECORD-PTR           FDYNIOR
#00787     MOVE SPACES TO M8134D-RECORD.                                FDYNIOR
#00787     INITIALIZE M8134D-GRECORD.                                   FDYNIOR
#00787                                                                  FDYNIOR
#00787* M8234D OPEN ROUTINE                                             FDYNIOR
#00787     MOVE 'OPEN'  TO M8234D-IO-REQUEST                            FDYNIOR
#00787     MOVE 'INPUT'  TO M8234D-IO-REQTYPE                           FDYNIOR
#00787     CALL 'FSDYNIO1' USING M8234D-DYNAM-FIB                       FDYNIOR
#00787                           IM8234D-KSD-KEY                        FDYNIOR
#00787     IF M8234D-KEY-PTR = NULL                                     FDYNIOR
#00787        SET ADDRESS OF M8234D-IO-AREA TO M8234D-IOAREA-PTR        FDYNIOR
#00787        SET M8234D-KEY-PTR TO ADDRESS OF IM8234D-KSD-KEY          FDYNIOR
#00787     END-IF                                                       FDYNIOR
#00787     MOVE  M8234D-IO-ERCODE1 TO M8234D-STATUS                     FDYNIOR
#00787     MOVE 'O'     TO M8234D-IOSW                                  FDYNIOR
#00787     IF M8234D-STATUS = '35'                                      FDYNIOR
#00787        MOVE 'I-O'  TO M8234D-IO-REQTYPE                          FDYNIOR
#00787        MOVE 'OPEN'  TO M8234D-IO-REQUEST                         FDYNIOR
#00787        CALL 'FSDYNIO1' USING M8234D-DYNAM-FIB                    FDYNIOR
#00787                           IM8234D-KSD-KEY                        FDYNIOR
#00787        MOVE  M8234D-IO-ERCODE1 TO M8234D-STATUS                  FDYNIOR
#00787        IF M8234D-STATUS = ZERO                                   FDYNIOR
#00787           MOVE '10' TO M8234D-STATUS                             FDYNIOR
#00787           MOVE 'E' TO M8234D-IOSW                                FDYNIOR
#00787        END-IF                                                    FDYNIOR
#00787     END-IF                                                       FDYNIOR
#00787     MOVE 'Y'     TO M8234D-ACCEPT-FLAG                           FDYNIOR
#00787     MOVE ZERO    TO M8234D-IO-COUNT                              FDYNIOR
#00787     IF (NOT M8234D-GOOD-IO)                                      FDYNIOR
#00787       AND (M8234D-IOSW NOT = 'E')                                FDYNIOR
#00787        DISPLAY M8234D-MESSAGE                                    FDYNIOR
#00787        MOVE 3026 TO WS-PENGI-RETURN                              ABRCODE
#00787        MOVE M8234D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00787        DISPLAY M8234D-IOM-NAME ': ' M8234D-IO-VSMEMSG            FDYNIOR
#00787        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00787     END-IF.                                                      FDYNIOR
#00787     SET ADDRESS OF M8234D-IO-AREA TO M8234D-IOAREA-PTR           FDYNIOR
#00787     CALL 'FSDYNPTR' USING  M8234D-DYNAM-FIB                      FDYNIOR
#00787     SET ADDRESS OF M8234D-RECORD  TO M8234D-RECORD-PTR           FDYNIOR
#00787     MOVE SPACES TO M8234D-RECORD.                                FDYNIOR
#00787     INITIALIZE M8234D-GRECORD.                                   FDYNIOR
#00787                                                                  FDYNIOR
#00787* ACH OPEN ROUTINE                                                FDYNIOR
#00787     MOVE 'OPEN'  TO ACH-IO-REQUEST                               FDYNIOR
#00787     MOVE 'INPUT'  TO ACH-IO-REQTYPE                              FDYNIOR
#00787     CALL 'FSDYNIO1' USING ACH-DYNAM-FIB                          FDYNIOR
#00787     MOVE  ACH-IO-ERCODE1 TO ACH-STATUS                           FDYNIOR
#00787     MOVE 'O'     TO ACH-IOSW                                     FDYNIOR
#00787     MOVE 'Y'     TO ACH-ACCEPT-FLAG                              FDYNIOR
#00787     MOVE ZERO    TO ACH-IO-COUNT                                 FDYNIOR
#00787     IF (NOT ACH-GOOD-IO)                                         FDYNIOR
#00787        DISPLAY ACH-MESSAGE                                       FDYNIOR
#00787        MOVE 3027 TO WS-PENGI-RETURN                              ABRCODE
#00787        MOVE ACH-MESSAGE TO ABEND-MESSAGE                         FDYNIOR
#00787        DISPLAY ACH-IOM-NAME ': ' ACH-IO-VSMEMSG                  FDYNIOR
#00787        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00787     END-IF.                                                      FDYNIOR
#00787     SET ADDRESS OF ACH-IO-AREA TO ACH-IOAREA-PTR                 FDYNIOR
#00787     CALL 'FSDYNPTR' USING  ACH-DYNAM-FIB                         FDYNIOR
#00787     SET ADDRESS OF ACH-RECORD  TO ACH-RECORD-PTR                 FDYNIOR
#00787     MOVE SPACES TO ACH-RECORD.                                   FDYNIOR
#00787     INITIALIZE ACH-GRECORD.                                      FDYNIOR
#00787                                                                  FDYNIOR
#00787     MOVE 'ALLOC SMYFIL' TO WS-PENGI-ALLOC-REQ                    EASYT007
#00787     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC              EASYT007
#00787                                                                  FDYNIOR
#00787* SMYFIL OPEN ROUTINE                                             FDYNIOR
#00787     MOVE  LENGTH OF ISMYFIL-GRECORD                              FDYNIOR
#00787               TO SMYFIL-RECORD-KEYE                              FDYNIOR
#00787     MOVE 'OPEN'  TO SMYFIL-IO-REQUEST                            FDYNIOR
#00787     MOVE 'OUTPUT'  TO SMYFIL-IO-REQTYPE                          FDYNIOR
#00787     CALL 'FSDYNIO1' USING SMYFIL-DYNAM-FIB                       FDYNIOR
#00787     MOVE  SMYFIL-IO-ERCODE1 TO SMYFIL-STATUS                     FDYNIOR
#00787     MOVE 'O'     TO SMYFIL-IOSW                                  FDYNIOR
#00787     MOVE 'Y'     TO SMYFIL-ACCEPT-FLAG                           FDYNIOR
#00787     MOVE ZERO    TO SMYFIL-IO-COUNT                              FDYNIOR
#00787     IF (NOT SMYFIL-GOOD-IO)                                      FDYNIOR
#00787        DISPLAY SMYFIL-MESSAGE                                    FDYNIOR
#00787        MOVE 3028 TO WS-PENGI-RETURN                              ABRCODE
#00787        MOVE SMYFIL-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00787        DISPLAY SMYFIL-IOM-NAME ': ' SMYFIL-IO-VSMEMSG            FDYNIOR
#00787        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00787     END-IF.                                                      FDYNIOR
#00787     SET ADDRESS OF SMYFIL-IO-AREA2 TO SMYFIL-IOAREA2-PTR         FDYNIOR
#00787     SET ADDRESS OF SMYFIL-IO-AREA TO SMYFIL-IOAREA-PTR           FDYNIOR
#00787     CALL 'FSDYNPTR' USING  SMYFIL-DYNAM-FIB                      FDYNIOR
#00787     SET ADDRESS OF SMYFIL-RECORD  TO SMYFIL-RECORD-PTR           FDYNIOR
#00787     MOVE SPACES TO SMYFIL-RECORD.                                FDYNIOR
#00787     INITIALIZE SMYFIL-GRECORD.                                   FDYNIOR
#00787                                                                  FDYNIOR
#00787     PERFORM C00020-GLCODES-OPEN.                                 TBSERV1
#00777                                                                  EASYT007
#00777***************************************************************** EASYT007
#00777* JOB1 TRAN-RPT SUMMARY EXIT:                                   * EASYT007
#00777* SUMMARY FILE BUILDING LOGIC.                                  * EASYT007
#00777***************************************************************** EASYT007
#00777 A01190-JOB1-BLD-SMYFIL.                                          EASYT007
#00783     MOVE R01-SAV-CRITERIA TO G01-SAV-CRITERIA                    EASYT007
#00783     MOVE R01-SAV-T-BANK TO G01-SAV-T-BANK                        EASYT007
#00783     MOVE R01-SAV-W-ASSIGNMENT TO G01-SAV-W-ASSIGNMENT            EASYT007
#00784     MOVE R01-SAV-WORK-TYPE TO G01-SAV-WORK-TYPE                  EASYT007
#00784     MOVE R01-SAV-ACCR-DATE TO G01-SAV-ACCR-DATE                  EASYT007
#00784     MOVE R01-LV6-PENGI-COUNT TO G01-LV6-PENGI-COUNT              EASYT007
#00786     MOVE R01-LV6-W-AMOUNT TO G01-LV6-W-AMOUNT                    EASYT007
#00787     MOVE SMYFIL-QAREA1 TO SMYFIL-IO-AREA                         EASYT007
#00787     PERFORM A01270-SMYFIL-8-WRITE.                               EASYT007
#00587                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * M8104D - READR I/O INTERFACE ROUTINE                          * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00587 A01200-M8104D-1-READR.                                           EASYT007
#00587                                                                  FDYNIOR
#00587     MOVE 'READR'  TO M8104D-IO-REQUEST                           FDYNIOR
#00587     CALL 'FSDYNIO2' USING M8104D-DYNAM-FIB                       FDYNIOR
#00587     MOVE  M8104D-IO-ERCODE1 TO M8104D-STATUS                     FDYNIOR
#00587     IF M8104D-GOOD-IO                                            FDYNIOR
#00587        MOVE M8104D-IO-AREA TO M8104D-RECORD                      FDYNIOR
#00587     END-IF                                                       FDYNIOR
#00587     ADD 1 TO M8104D-IO-COUNT.                                    FDYNIOR
#00587                                                                  FDYNIOR
#00587     MOVE M8104D-STATUS TO PENGI-CODE0                            EASYT007
#00587     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO M8104D-EZSTATUS.       EASYT007
#00608                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * M8134D - START I/O INTERFACE ROUTINE                          * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00608 A01210-M8134D-2-START.                                           EASYT007
#00608                                                                  FDYNIOR
#00608     MOVE 'NOT <' TO M8134D-KEY-REL                               FDYNIOR
#00608     MOVE 'START' TO M8134D-IO-REQUEST                            FDYNIOR
#00608     CALL 'FSDYNIO2' USING M8134D-DYNAM-FIB                       FDYNIOR
#00608     MOVE  M8134D-IO-ERCODE1 TO M8134D-STATUS.                    FDYNIOR
#00608     MOVE M8134D-STATUS TO PENGI-CODE0                            EASYT007
#00608     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO M8134D-EZSTATUS.       EASYT007
#00615                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * M8134D - READ I/O INTERFACE ROUTINE                           * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00615 A01220-M8134D-3-READ.                                            EASYT007
#00615                                                                  FDYNIOR
#00615     MOVE 'READ'  TO M8134D-IO-REQUEST                            FDYNIOR
#00615     CALL 'FSDYNIO2' USING M8134D-DYNAM-FIB                       FDYNIOR
#00615     MOVE  M8134D-IO-ERCODE1 TO M8134D-STATUS                     FDYNIOR
#00615     IF M8134D-GOOD-IO                                            FDYNIOR
#00615        MOVE M8134D-IO-AREA TO M8134D-RECORD                      FDYNIOR
#00615     END-IF                                                       FDYNIOR
#00615     IF END-OF-M8134D                                             FDYNIOR
#00615        MOVE '10'    TO M8134D-STATUS                             FDYNIOR
#00615     ELSE                                                         FDYNIOR
#00615     IF NOT M8134D-GOOD-IO                                        FDYNIOR
#00615        DISPLAY M8134D-MESSAGE                                    FDYNIOR
#00615        MOVE 3030 TO WS-PENGI-RETURN                              ABRCODE
#00615        MOVE M8134D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00615        DISPLAY M8134D-IOM-NAME ': ' M8134D-IO-VSMEMSG            FDYNIOR
#00615        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00615     ELSE                                                         FDYNIOR
#00615     ADD 1 TO M8134D-IO-COUNT.                                    FDYNIOR
#00615                                                                  FDYNIOR
#00615     MOVE M8134D-STATUS TO PENGI-CODE0                            EASYT007
#00615     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO M8134D-EZSTATUS.       EASYT007
#00709                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * M8124D - READR I/O INTERFACE ROUTINE                          * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00709 A01230-M8124D-4-READR.                                           EASYT007
#00709                                                                  FDYNIOR
#00709     MOVE 'READR'  TO M8124D-IO-REQUEST                           FDYNIOR
#00709     CALL 'FSDYNIO2' USING M8124D-DYNAM-FIB                       FDYNIOR
#00709     MOVE  M8124D-IO-ERCODE1 TO M8124D-STATUS                     FDYNIOR
#00709     IF M8124D-GOOD-IO                                            FDYNIOR
#00709        MOVE M8124D-IO-AREA TO M8124D-RECORD                      FDYNIOR
#00709     END-IF                                                       FDYNIOR
#00709     ADD 1 TO M8124D-IO-COUNT.                                    FDYNIOR
#00709                                                                  FDYNIOR
#00709     MOVE M8124D-STATUS TO PENGI-CODE0                            EASYT007
#00709     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO M8124D-EZSTATUS.       EASYT007
#00746                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * ACH - READ I/O INTERFACE ROUTINE                              * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00746 A01240-ACH-5-READ.                                               EASYT007
#00746                                                                  FDYNIOR
#00746     MOVE 'READ'  TO ACH-IO-REQUEST                               FDYNIOR
#00746     CALL 'FSDYNIO2' USING ACH-DYNAM-FIB                          FDYNIOR
#00746     IF ACH-GOOD-IO                                               FDYNIOR
#00746        SET ADDRESS OF ACH-IO-AREA TO ACH-IOAREA-PTR              FDYNIOR
#00746     END-IF                                                       FDYNIOR

#00746     MOVE  ACH-IO-ERCODE1 TO ACH-STATUS                           FDYNIOR
#00746     IF ACH-GOOD-IO                                               FDYNIOR
#00746        MOVE ACH-IO-AREA TO ACH-RECORD                            FDYNIOR
#00746     END-IF                                                       FDYNIOR
#00746     IF END-OF-ACH                                                FDYNIOR
#00746        MOVE '10'    TO ACH-STATUS                                FDYNIOR
#00746     ELSE                                                         FDYNIOR
#00746     IF NOT ACH-GOOD-IO                                           FDYNIOR
#00746        DISPLAY ACH-MESSAGE                                       FDYNIOR
#00746        MOVE 3031 TO WS-PENGI-RETURN                              ABRCODE
#00746        MOVE ACH-MESSAGE TO ABEND-MESSAGE                         FDYNIOR
#00746        DISPLAY ACH-IOM-NAME ': ' ACH-IO-VSMEMSG                  FDYNIOR
#00746        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00746     ELSE                                                         FDYNIOR
#00746     ADD 1 TO ACH-IO-COUNT.                                       FDYNIOR
#00746                                                                  FDYNIOR
#00746     MOVE ACH-STATUS TO PENGI-CODE0                               EASYT007
#00746     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO ACH-EZSTATUS.          EASYT007
#00758                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * M8124D - START I/O INTERFACE ROUTINE                          * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00758 A01250-M8124D-6-START.                                           EASYT007
#00758                                                                  FDYNIOR
#00758     MOVE 'NOT <' TO M8124D-KEY-REL                               FDYNIOR
#00758     MOVE 'START' TO M8124D-IO-REQUEST                            FDYNIOR
#00758     CALL 'FSDYNIO2' USING M8124D-DYNAM-FIB                       FDYNIOR
#00758     MOVE  M8124D-IO-ERCODE1 TO M8124D-STATUS.                    FDYNIOR
#00758     MOVE M8124D-STATUS TO PENGI-CODE0                            EASYT007
#00758     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO M8124D-EZSTATUS.       EASYT007
#00764                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * M8124D - READ I/O INTERFACE ROUTINE                           * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00764 A01260-M8124D-7-READ.                                            EASYT007
#00764                                                                  FDYNIOR
#00764     MOVE 'READ'  TO M8124D-IO-REQUEST                            FDYNIOR
#00764     CALL 'FSDYNIO2' USING M8124D-DYNAM-FIB                       FDYNIOR
#00764     MOVE  M8124D-IO-ERCODE1 TO M8124D-STATUS                     FDYNIOR
#00764     IF M8124D-GOOD-IO                                            FDYNIOR
#00764        MOVE M8124D-IO-AREA TO M8124D-RECORD                      FDYNIOR
#00764     END-IF                                                       FDYNIOR
#00764     IF END-OF-M8124D                                             FDYNIOR
#00764        MOVE '10'    TO M8124D-STATUS                             FDYNIOR
#00764     ELSE                                                         FDYNIOR
#00764     IF NOT M8124D-GOOD-IO                                        FDYNIOR
#00764        DISPLAY M8124D-MESSAGE                                    FDYNIOR
#00764        MOVE 3032 TO WS-PENGI-RETURN                              ABRCODE
#00764        MOVE M8124D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00764        DISPLAY M8124D-IOM-NAME ': ' M8124D-IO-VSMEMSG            FDYNIOR
#00764        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00764     ELSE                                                         FDYNIOR
#00764     ADD 1 TO M8124D-IO-COUNT.                                    FDYNIOR
#00764                                                                  FDYNIOR
#00764     MOVE M8124D-STATUS TO PENGI-CODE0                            EASYT007
#00764     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO M8124D-EZSTATUS.       EASYT007
#00787                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * SMYFIL - WRITE I/O INTERFACE ROUTINE                          * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00787 A01270-SMYFIL-8-WRITE.                                           EASYT007
#00787                                                                  FDYNIOR
#00787     COMPUTE SMYFIL-RECORD-TAIL =                                 FDYNIOR
#00787             SMYFIL-RECORD-SIZE  - SMYFIL-RECORD-KEYE             FDYNIOR
#00787     MOVE 'WRITE'  TO SMYFIL-IO-REQUEST                           FDYNIOR
#00787     CALL 'FSDYNIO2' USING SMYFIL-DYNAM-FIB                       FDYNIOR
#00787     MOVE  SMYFIL-IO-ERCODE1 TO SMYFIL-STATUS                     FDYNIOR
#00787     ADD 1 TO SMYFIL-IO-COUNT                                     FDYNIOR
#00787     IF (NOT SMYFIL-GOOD-IO)                                      FDYNIOR
#00787        DISPLAY SMYFIL-MESSAGE                                    FDYNIOR
#00787        MOVE 3033 TO WS-PENGI-RETURN                              ABRCODE
#00787        MOVE SMYFIL-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00787        DISPLAY SMYFIL-IOM-NAME ': ' SMYFIL-IO-VSMEMSG            FDYNIOR
#00787        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00787     END-IF.                                                      FDYNIOR
#00787                                                                  FDYNIOR
#00787     MOVE SMYFIL-STATUS TO PENGI-CODE0                            EASYT007
#00787     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SMYFIL-EZSTATUS.       EASYT007
#00777                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * TRAN-RPT - INTERFACE ROUTINE AND GENERATE MACRO PARAMETERS    * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 A01280-GENERATE-TRAN-RPT.                                        EASYT007
#00777     MOVE 'Y' TO WS-JOB1-REPORT1-SW.                              EASYT007
#00777                                                                  GENFILE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI REPORT1 MAIN LINE INTERFACE ROUTINES.                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777     IF TEMPWK1-IOSW = 'C'                                        GENERATQ
#00777         MOVE 'ALLOC TEMPWK1' TO WS-PENGI-ALLOC-REQ               GENERATQ
#00777         CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC          GENERATQ
#00777         OPEN OUTPUT TEMPWK1                                      GENERATQ
#00777         MOVE 'O' TO TEMPWK1-IOSW                                 GENERATQ
#00777         MOVE ZERO TO TEMPWK1-IO-COUNT                            GENERATQ
#00777         IF NOT TEMPWK1-GOOD-IO                                   GENERATQ
#00777             DISPLAY TEMPWK1-MESSAGE                              GENERATQ
#00777             MOVE 3037 TO WS-PENGI-RETURN                         ABRCODE
#00777             MOVE TEMPWK1-MESSAGE TO ABEND-MESSAGE                GENERATQ
#00777             PERFORM F00000-ABEND-CALL-FSABEC16.                  ABEND00
#00777                                                                  GENERATQ
#00777     PERFORM E00280-REPORT1-BLD-TEMPWK1                           GENERATQ
#00777     ADD 1 TO TEMPWK1-IO-COUNT                                    GENERATQ
#00777     WRITE TEMPWK1-RECORD                                         GENERATQ
#00777     IF NOT TEMPWK1-GOOD-IO                                       GENERATQ
#00777        DISPLAY TEMPWK1-MESSAGE                                   GENERATQ
#00777        MOVE 3038 TO WS-PENGI-RETURN                              ABRCODE
#00777        MOVE TEMPWK1-MESSAGE TO ABEND-MESSAGE                     GENERATQ
#00777        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00777     END-IF.                                                      GENERATQ
#00787                                                                  EASYT007
#00787 A01290-GENERATE-TRAN-RPT-EXIT. EXIT.                             EASYT007
#00789                                                                  EASYT007
#00789***************************************************************** EASYT007
#00789* JOB2 FILE READ ROUTINE                                        * EASYT007
#00789***************************************************************** EASYT007
#00789 A02010-JOB2-READ.                                                EASYT007
      *,EXIT IF STOP/STOP EXECUTE TO PREVENT AN EXTRA READ
#00789     IF (NOT JOB2-REQUEST-STOP)                                   EASYT007
#00789         PERFORM A02020-JOB2-READ-NEXT                            EASYT007
#00789     END-IF.                                                      EASYT007
#00789                                                                  EASYT007
#00789***************************************************************** EASYT007
#00789* JOB2 FILE READ-NEXT ROUTINE                                   * EASYT007
#00789***************************************************************** EASYT007
#00789 A02020-JOB2-READ-NEXT.                                           EASYT007
#00789                                                                  EASYT007
#00789     MOVE 'READ'  TO M8124D-IO-REQUEST                            FDYNIOR
#00789     CALL 'FSDYNIO2' USING M8124D-DYNAM-FIB                       FDYNIOR
#00789     MOVE  M8124D-IO-ERCODE1 TO M8124D-STATUS                     FDYNIOR
#00789     IF END-OF-M8124D                                             FDYNIOR
#00789        MOVE '10'    TO M8124D-STATUS                             FDYNIOR
#00789     ELSE                                                         FDYNIOR
#00789     IF NOT M8124D-GOOD-IO                                        FDYNIOR
#00789        DISPLAY M8124D-MESSAGE                                    FDYNIOR
#00789        MOVE 3040 TO WS-PENGI-RETURN                              ABRCODE
#00789        MOVE M8124D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#00789        DISPLAY M8124D-IOM-NAME ': ' M8124D-IO-VSMEMSG            FDYNIOR
#00789        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#00789     ELSE                                                         FDYNIOR
#00789     ADD 1 TO M8124D-IO-COUNT.                                    FDYNIOR
#00789                                                                  FDYNIOR
#00789     MOVE M8124D-STATUS TO PENGI-CODE0                            EASYT007
#00789     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO M8124D-EZSTATUS        EASYT007
#00789                                                                  EASYT007
#00789     IF NOT (END-OF-M8124D                                        EASYT007
#00789              OR JOB2-REQUEST-STOP)                               EASYT007
#00789         MOVE M8124D-IO-AREA TO M8124D-RECORD                     EASYT007
#00789     GO TO A02030-JOB2-RUN.                                       EASYT007
#00789                                                                  EASYT007
#00789***************************************************************** EASYT007
#00789* JOB2 MAIN PROCESSING ROUTINE                                  * EASYT007
#00789***************************************************************** EASYT007
#00789 A02030-JOB2-RUN.                                                 EASYT007
#00789     MOVE ZERO TO WS-JOB2-REPORT-LEVL.                            EASYT007
#00791     IF W-SW = ZEROS                                              EASYT007
#00792        PERFORM A02180-TITLE-DATE-PROC                            EASYT007
#00792           THRU A02190-TITLE-DATE-PROC-EXIT                       EASYT007
#00793        MOVE DATE-RPT  TO LNE-DATE                                EASYT007
#00794        MOVE WS-PENGI-DATE TO SYS-DATE-IN                         EASYT007
#00795        IF MM-SYS-IN-A = SPACES                                   EASYT007
#00796           MOVE 0  TO MM-SYS-IN-N                                 EASYT007
#00797        END-IF                                                    EASYT007
#00798        MOVE 1  TO W-SW                                           EASYT007
#00799        MOVE 1 TO WS-JOB2-FLAG                                    EASYT007
#00799        GO TO A02010-JOB2-READ                                    EASYT007
#00800     END-IF                                                       EASYT007
#00802     IF EXTRACT-SW = 'Y'                                          EASYT007
#00803        IF MC005-BAN-NUMBER NOT = W-BANK OR MC010-OBL-NUMBER NOT =EASYT007
#00803        W-OBLIGOR OR MC015-OBL-NUMBER NOT = W-OBLIGAT             EASYT007
#00806           MOVE 'N' TO EXTRACT-SW                                 EASYT007
#00807           PERFORM A02150-EXTRACT-ROUTINE                         EASYT007
#00807              THRU A02170-EXTRACT-ROUTINE-EXIT                    EASYT007
#00808        END-IF                                                    EASYT007
#00809     END-IF                                                       EASYT007
#00811     IF MC001-DEL-CODE = '1'                                      EASYT007
#00812        MOVE 1 TO WS-JOB2-FLAG                                    EASYT007
#00812        GO TO A02010-JOB2-READ                                    EASYT007
#00813     END-IF                                                       EASYT007
#00815     IF MC005-BAN-NUMBER NOT = W-BANK                             EASYT007
#00816        MOVE SPACES  TO KEY-CS-KEY                                EASYT007
#00817        MOVE 050  TO WS-PENGI-MOVE-G                              EASYT007
#00817        MOVE WS-PENGI-MOVE-G  TO KEY-CS-006-CODE                  EASYT007
#00818        MOVE MC005-BAN-NUMBER  TO KEY-CSH-BAN-NUM                 EASYT007
#00819        MOVE 1  TO WS-PENGI-MOVE-G                                EASYT007
#00819        MOVE WS-PENGI-MOVE-G  TO KEY-CSH-APP-CODE                 EASYT007
#00820        MOVE 01  TO WS-PENGI-MOVE-G                               EASYT007
#00820        MOVE WS-PENGI-MOVE-G  TO KEY-CSH-SEQ-NUM                  EASYT007
#00821        MOVE KEY-CS-KEY TO IM8104D-KSD-KEY                        EASYT007
#00821        PERFORM A02430-M8104D-1-READR                             EASYT007
#00822        IF END-OF-M8104D OR M8104D-EZSTATUS NOT = ZEROS           EASYT007
#00823           MOVE KEY-CS-KEY TO DLN-0016-KEY-CS-KEY                 EASYT007
#00823           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00823           WRITE SYSPRINT-RECORD  FROM DLN-0016                   EASYT007
#00823                   AFTER ADVANCING 1                              EASYT007
#00823           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00823           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00825           SET JOB2-STOP-JOB TO TRUE                              EASYT007
#00825           GO TO A02010-JOB2-READ                                 EASYT007
#00826        END-IF                                                    EASYT007
#00827        MOVE CSH030-CUR-DATE  TO DATE-IN                          EASYT007
#00828        MOVE CSH030-CUR-DATE  TO DATE-INC                         EASYT007
#00829        IF YY-IN NOT = YY-RPT OR MM-IN NOT = MM-RPT OR DD-IN NOT =EASYT007
#00829        DD-RPT                                                    EASYT007
#00832           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00832           WRITE SYSPRINT-RECORD  FROM DLN-0017                   EASYT007
#00832                   AFTER ADVANCING 1                              EASYT007
#00832           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00832           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00833           MOVE DATE-RPT TO DLN-0018-DATE-RPT                     EASYT007
#00833           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00833           WRITE SYSPRINT-RECORD  FROM DLN-0018                   EASYT007
#00833                   AFTER ADVANCING 1                              EASYT007
#00833           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00833           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00834           MOVE CSH030-CUR-DATE TO DLN-0019-CSH030-CUR-DATE       EASYT007
#00834           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00834           WRITE SYSPRINT-RECORD  FROM DLN-0019                   EASYT007
#00834                   AFTER ADVANCING 1                              EASYT007
#00834           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00834           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00835           SET JOB2-STOP-JOB TO TRUE                              EASYT007
#00835           GO TO A02010-JOB2-READ                                 EASYT007
#00836        END-IF                                                    EASYT007
#00837        MOVE CSH008-BAN-NUM  TO W-BANK                            EASYT007
#00838        MOVE CSH050-BANK-NAME  TO W-BANK-NAME                     EASYT007
#00839        MOVE CSH036-LAS-DATE  TO W-ACCRUAL-DATE                   EASYT007
#00840        MOVE W-ACCRUAL-DATE  TO DATE-IN                           EASYT007
#00841        PERFORM A02200-LMS-DATE-RTN                               EASYT007
#00841           THRU A02210-LMS-DATE-RTN-EXIT                          EASYT007
#00842        MOVE DATE-IN  TO ACCR-DATE                                EASYT007
#00843        MOVE DATE-OUT  TO ACCRUAL-DATE                            EASYT007
#00844        PERFORM A02310-CONVERT-DATE-PROC                          EASYT007
#00844           THRU A02320-CONVERT-DATE-PROC-EXIT                     EASYT007
#00845        MOVE START-JULIAN  TO END-JULIAN                          EASYT007
#00845        IF END-JULIAN NOT < ZERO                                  EASYT007
#00845           MOVE END-JULIAN TO END-JULIAN-9U                       EASYT007
#00845        END-IF                                                    EASYT007
#00846        IF YY-IN > 1                                              EASYT007
#00847           COMPUTE KEY-V-YEAR =                                   EASYT007
#00847               YY-IN - 1                                          EASYT007
#00848           MOVE 1  TO KEY-V-APP-CODE                              EASYT007
#00849           MOVE 0000000  TO KEY-V-SEQ-NUM                         EASYT007
#00850        ELSE                                                      EASYT007
#00851           MOVE DATE-IN TO DLN-0020-DATE-IN                       EASYT007
#00851           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00851           WRITE SYSPRINT-RECORD  FROM DLN-0020                   EASYT007
#00851                   AFTER ADVANCING 1                              EASYT007
#00851           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00851           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00853           SET JOB2-STOP-JOB TO TRUE                              EASYT007
#00853           GO TO A02010-JOB2-READ                                 EASYT007
#00854        END-IF                                                    EASYT007
#00855        MOVE 150  TO WS-PENGI-MOVE-G                              EASYT007
#00855        MOVE WS-PENGI-MOVE-G  TO KEY-CS-006-CODE                  EASYT007
#00856        MOVE 'CL257'  TO KEY-CSW-REP-NUM                          EASYT007
#00857        MOVE KEY-CS-KEY TO IM8104D-KSD-KEY                        EASYT007
#00857        PERFORM A02430-M8104D-1-READR                             EASYT007
#00858        IF END-OF-M8104D OR M8104D-EZSTATUS NOT = ZEROS           EASYT007
#00859           MOVE KEY-CS-KEY TO DLN-0021-KEY-CS-KEY                 EASYT007
#00859           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#00859           WRITE SYSPRINT-RECORD  FROM DLN-0021                   EASYT007
#00859                   AFTER ADVANCING 1                              EASYT007
#00859           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#00859           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#00861           SET JOB2-STOP-JOB TO TRUE                              EASYT007
#00861           GO TO A02010-JOB2-READ                                 EASYT007
#00862        END-IF                                                    EASYT007
#00863        MOVE CSW100-SPE-DATA  TO W-REPORT-DATA                    EASYT007
#00864     END-IF                                                       EASYT007
#00866     IF MC025-REC-CODE = 200                                      EASYT007
#00867        MOVE MC038-PRO-TYPE (1: 4) TO WS-PENGI-MOVE-G             EASYT007
#00867        IF (WS-PENGI-MOVE-G (1: 4) = SPACES)                      EASYT007
#00867           MOVE ZEROS TO HOLD-PRO-TYPE                            EASYT007
#00867        ELSE                                                      EASYT007
#00867           MOVE MC038-PRO-TYPE  TO HOLD-PRO-TYPE                  EASYT007
#00867        END-IF                                                    EASYT007
#00877        MOVE 'O' TO W-STATUS-CODE                                 EASYT007
#00878        MOVE MC045-POS-DATE  TO DATE-IN                           EASYT007
#00879        IF MM-IN = MM-RPT                                         EASYT007
#00879        AND YY-IN = YY-RPT                                        EASYT007
#00880           MOVE 'N' TO W-STATUS-CODE                              EASYT007
#00881        END-IF                                                    EASYT007
#00882        MOVE MC048-LEG-DATE  TO DATE-IN                           EASYT007
#00883        MOVE MC048-LEG-DATE  TO DATE-INA                          EASYT007
#00884        MOVE DATE-INA (1: 6) TO WS-PENGI-MOVE-G                   EASYT007
#00884        IF (WS-PENGI-MOVE-G (1: 6) = SPACES)                      EASYT007
#00884           MOVE ZEROS TO WORK-DATEA                               EASYT007
#00884        ELSE                                                      EASYT007
#00884           MOVE DATE-INA  TO WORK-DATEA                           EASYT007
#00884        END-IF                                                    EASYT007
#00885        MOVE MC071-ORI-DATE  TO DATE-IN2                          EASYT007
#00886        MOVE DATE-INB (1: 6) TO WS-PENGI-MOVE-G                   EASYT007
#00886        IF (WS-PENGI-MOVE-G (1: 6) = SPACES)                      EASYT007
#00886           MOVE ZEROS TO WORK-DATEB                               EASYT007
#00886        ELSE                                                      EASYT007
#00886           MOVE DATE-INB  TO WORK-DATEB                           EASYT007
#00886        END-IF                                                    EASYT007
#00887        COMPUTE COMMITMENT-AMT =                                  EASYT007
#00887                   MC061-CUR-BALANC + FC151-AMT-TAK               EASYT007
#00887        IF COMMITMENT-AMT NOT < ZERO                              EASYT007
#00887           MOVE COMMITMENT-AMT TO COMMITMENT-AMT-9U               EASYT007
#00887        END-IF                                                    EASYT007
#00889        MOVE 'F' TO RATE-CODE                                     EASYT007
#00890        MOVE MC043-OBL-TYPE  TO OBLIGATION-TYPE                   EASYT007
#00891        MOVE SPACES TO WORK-FILLER                                EASYT007
#00892        IF COMMITMENT-AMT = ZEROS                                 EASYT007
#00893           IF MM-IN NOT = MM-RPT OR YY-IN NOT = YY-RPT            EASYT007
#00894              MOVE 1 TO WS-JOB2-FLAG                              EASYT007
#00894              GO TO A02010-JOB2-READ                              EASYT007
#00895           END-IF                                                 EASYT007
#00896           MOVE 'C' TO W-STATUS-CODE                              EASYT007
#00897        END-IF                                                    EASYT007
#00898        IF FC151-AMT-TAK = ZEROS                                  EASYT007
#00899           MOVE 00164  TO CRITERIA                                EASYT007
#00900        ELSE                                                      EASYT007
#00900           CONTINUE                                               EASYT007
#00903        END-IF                                                    EASYT007
#00904        MOVE MC010-OBL-NUMBER (1: 10) TO WS-PENGI-MOVE-G          EASYT007
#00904        IF (WS-PENGI-MOVE-G (1: 10) = SPACES)                     EASYT007
#00904           MOVE ZEROS TO W-OBLIGOR                                EASYT007
#00904        ELSE                                                      EASYT007
#00904           MOVE MC010-OBL-NUMBER  TO W-OBLIGOR                    EASYT007
#00904        END-IF                                                    EASYT007
#00905        MOVE MC015-OBL-NUMBER  TO UNPACK-OBL-NUM                  EASYT007
#00906        MOVE UNPACK-OBL-NUM  TO W-OBLIGAT                         EASYT007
#00907        MOVE MC025-REC-CODE  TO HOLD-RECORD-CODE                  EASYT007
#00908        MOVE MC081-ASS-UNIT (1: 5) TO WS-PENGI-MOVE-G             EASYT007
#00908        IF (WS-PENGI-MOVE-G (1: 5) = SPACES)                      EASYT007
#00908           MOVE ZEROS TO W-ASSIGNMENT                             EASYT007
#00908        ELSE                                                      EASYT007
#00908           MOVE MC081-ASS-UNIT  TO W-ASSIGNMENT                   EASYT007
#00908        END-IF                                                    EASYT007
#00909        MOVE MC083-GEN-CODE (1: 7) TO WS-PENGI-MOVE-G             EASYT007
#00909        IF (WS-PENGI-MOVE-G (1: 7) = SPACES)                      EASYT007
#00909           MOVE ZEROS TO W-GL-CODE                                EASYT007
#00909        ELSE                                                      EASYT007
#00909           MOVE MC083-GEN-CODE  TO W-GL-CODE                      EASYT007
#00909        END-IF                                                    EASYT007
#00910        MOVE MC410-DIV-NUMBER (1: 3) TO WS-PENGI-MOVE-G           EASYT007
#00910        IF (WS-PENGI-MOVE-G (1: 3) = SPACES)                      EASYT007
#00910           MOVE ZEROS TO W-DIVISION                               EASYT007
#00910        ELSE                                                      EASYT007
#00910           MOVE MC410-DIV-NUMBER  TO W-DIVISION                   EASYT007
#00910        END-IF                                                    EASYT007
#00911        MOVE MC411-REG-NUMBER (1: 3) TO WS-PENGI-MOVE-G           EASYT007
#00911        IF (WS-PENGI-MOVE-G (1: 3) = SPACES)                      EASYT007
#00911           MOVE ZEROS TO W-REGION                                 EASYT007
#00911        ELSE                                                      EASYT007
#00911           MOVE MC411-REG-NUMBER  TO W-REGION                     EASYT007
#00911        END-IF                                                    EASYT007
#00912        MOVE MC082-CON-OFF TO W-CONTACT                           EASYT007
#00913        MOVE 'CML99' TO DESCRIPTION                               EASYT007
#00920        PERFORM A02490-GENERATE-BAL-RPT                           EASYT007
#00920           THRU A02500-GENERATE-BAL-RPT-EXIT                      EASYT007
#00921     END-IF                                                       EASYT007
#00922     IF MC025-REC-CODE = 300                                      EASYT007
#00923        MOVE MC038-PRO-TYPE (1: 4) TO WS-PENGI-MOVE-G             EASYT007
#00923        IF (WS-PENGI-MOVE-G (1: 4) = SPACES)                      EASYT007
#00923           MOVE ZEROS TO HOLD-PRO-TYPE                            EASYT007
#00923        ELSE                                                      EASYT007
#00923           MOVE MC038-PRO-TYPE  TO HOLD-PRO-TYPE                  EASYT007
#00923        END-IF                                                    EASYT007
#00931        MOVE 'Y' TO EXTRACT-SW                                    EASYT007
#00932        MOVE 'Y' TO ZERO-SW                                       EASYT007
#00933        MOVE SPACES TO DELINQ-SW                                  EASYT007
#00934        MOVE 'O' TO W-STATUS-CODE                                 EASYT007
#00935        MOVE MC045-POS-DATE  TO DATE-IN                           EASYT007
#00936        MOVE MC048-LEG-DATE  TO DATE-INA                          EASYT007
#00937        MOVE DATE-INA (1: 6) TO WS-PENGI-MOVE-G                   EASYT007
#00937        IF (WS-PENGI-MOVE-G (1: 6) = SPACES)                      EASYT007
#00937           MOVE ZEROS TO WORK-DATEA                               EASYT007
#00937        ELSE                                                      EASYT007
#00937           MOVE DATE-INA  TO WORK-DATEA                           EASYT007
#00937        END-IF                                                    EASYT007
#00938        MOVE MC071-ORI-DATE  TO DATE-INB                          EASYT007
#00939        MOVE DATE-INB (1: 6) TO WS-PENGI-MOVE-G                   EASYT007
#00939        IF (WS-PENGI-MOVE-G (1: 6) = SPACES)                      EASYT007
#00939           MOVE ZEROS TO WORK-DATEB                               EASYT007
#00939        ELSE                                                      EASYT007
#00939           MOVE DATE-INB  TO WORK-DATEB                           EASYT007
#00939        END-IF                                                    EASYT007
#00940        IF MM-IN = MM-RPT                                         EASYT007
#00940        AND YY-IN = YY-RPT                                        EASYT007
#00941           MOVE 'N' TO W-STATUS-CODE                              EASYT007
#00942        END-IF                                                    EASYT007
#00943        MOVE MC051-LAS-DT  TO W-LAS-DAILY-TRAN                    EASYT007
#00944        MOVE MC400-ZER-DATE  TO W-ZER-BAL-PROC-D                  EASYT007
#00946        MOVE 'F' TO RATE-CODE                                     EASYT007
#00947        IF MC111-DUR-CODE = 2                                     EASYT007
#00948           MOVE 'V' TO RATE-CODE                                  EASYT007
#00949        END-IF                                                    EASYT007
#00950        MOVE MC043-OBL-TYPE  TO OBLIGATION-TYPE                   EASYT007
#00951        MOVE SPACES TO WORK-FILLER                                EASYT007
#00952        MOVE MC114-DIS-CODE (1: 1) TO WS-PENGI-MOVE-G             EASYT007
#00952        IF (WS-PENGI-MOVE-G (1: 1) = SPACES)                      EASYT007
#00952           MOVE ZEROS TO HOLD-DIS-CODE                            EASYT007
#00952        ELSE                                                      EASYT007
#00952           MOVE MC114-DIS-CODE  TO HOLD-DIS-CODE                  EASYT007
#00952        END-IF                                                    EASYT007
#00953        MOVE MC060-ORI-BALANC  TO W-ORIGINAL                      EASYT007
#00953        IF W-ORIGINAL NOT < ZERO                                  EASYT007
#00953           MOVE W-ORIGINAL TO W-ORIGINAL-9U                       EASYT007
#00953        END-IF                                                    EASYT007
#00954        IF PROCESS-TYPE-LOW = 51                                  EASYT007
#00955           MOVE MC060-ORI-BALANC  TO COMMITMENT-AMT               EASYT007
#00955           IF COMMITMENT-AMT NOT < ZERO                           EASYT007
#00955              MOVE COMMITMENT-AMT TO COMMITMENT-AMT-9U            EASYT007
#00955           END-IF                                                 EASYT007
#00956        ELSE                                                      EASYT007
#00957           MOVE 0  TO COMMITMENT-AMT                              EASYT007
#00957           IF COMMITMENT-AMT NOT < ZERO                           EASYT007
#00957              MOVE COMMITMENT-AMT TO COMMITMENT-AMT-9U            EASYT007
#00957           END-IF                                                 EASYT007
#00958        END-IF                                                    EASYT007
#00959        IF COMMITMENT-AMT NOT < ZEROS                             EASYT007
#00961           CONTINUE                                               EASYT007
#00961        ELSE                                                      EASYT007
#00961           CONTINUE                                               EASYT007
#00963        END-IF                                                    EASYT007
#00964        MOVE MC061-CUR-BALANC  TO W-PRINCIPAL                     EASYT007
#00964        IF W-PRINCIPAL NOT < ZERO                                 EASYT007
#00964           MOVE W-PRINCIPAL TO W-PRINCIPAL-9U                     EASYT007
#00964        END-IF                                                    EASYT007
#00965        MOVE 0  TO W-INTEREST-FEE                                 EASYT007
#00965        IF W-INTEREST-FEE NOT < ZERO                              EASYT007
#00965           MOVE W-INTEREST-FEE TO W-INTEREST-FEE-9U               EASYT007
#00965        END-IF                                                    EASYT007
#00972        COMPUTE PRI-BALANCE =                                     EASYT007
#00972                   MC061-CUR-BALANC - MC066-CHA-BALANC -          EASYT007
                         MC732-TOT-AMOUN - MC546-INT-PAI-PR             EASYT007
#00972        IF PRI-BALANCE NOT < ZERO                                 EASYT007
#00972           MOVE PRI-BALANCE TO PRI-BALANCE-9U                     EASYT007
#00972        END-IF                                                    EASYT007
#00977        IF MC062-MON-BAL NOT = ZEROS OR MC544-CUM-MTD NOT = ZEROS EASYT007
#00977        OR MC546-INT-PAI-PR NOT = ZEROS                           EASYT007
#00980           MOVE 'N' TO ZERO-SW                                    EASYT007
#00981        END-IF                                                    EASYT007
#00982        MOVE MC010-OBL-NUMBER (1: 10) TO WS-PENGI-MOVE-G          EASYT007
#00982        IF (WS-PENGI-MOVE-G (1: 10) = SPACES)                     EASYT007
#00982           MOVE ZEROS TO W-OBLIGOR                                EASYT007
#00982        ELSE                                                      EASYT007
#00982           MOVE MC010-OBL-NUMBER  TO W-OBLIGOR                    EASYT007
#00982        END-IF                                                    EASYT007
#00983        MOVE MC015-OBL-NUMBER  TO UNPACK-OBL-NUM                  EASYT007
#00984        MOVE UNPACK-OBL-NUM  TO W-OBLIGAT                         EASYT007
#00985        MOVE MC025-REC-CODE  TO HOLD-RECORD-CODE                  EASYT007
#00986        MOVE MC081-ASS-UNIT (1: 5) TO WS-PENGI-MOVE-G             EASYT007
#00986        IF (WS-PENGI-MOVE-G (1: 5) = SPACES)                      EASYT007
#00986           MOVE ZEROS TO W-ASSIGNMENT                             EASYT007
#00986        ELSE                                                      EASYT007
#00986           MOVE MC081-ASS-UNIT  TO W-ASSIGNMENT                   EASYT007
#00986        END-IF                                                    EASYT007
#00987        MOVE MC083-GEN-CODE (1: 7) TO WS-PENGI-MOVE-G             EASYT007
#00987        IF (WS-PENGI-MOVE-G (1: 7) = SPACES)                      EASYT007
#00987           MOVE ZEROS TO W-GL-CODE                                EASYT007
#00987        ELSE                                                      EASYT007
#00987           MOVE MC083-GEN-CODE  TO W-GL-CODE                      EASYT007
#00987        END-IF                                                    EASYT007
#00988        MOVE MC410-DIV-NUMBER (1: 3) TO WS-PENGI-MOVE-G           EASYT007
#00988        IF (WS-PENGI-MOVE-G (1: 3) = SPACES)                      EASYT007
#00988           MOVE ZEROS TO W-DIVISION                               EASYT007
#00988        ELSE                                                      EASYT007
#00988           MOVE MC410-DIV-NUMBER  TO W-DIVISION                   EASYT007
#00988        END-IF                                                    EASYT007
#00989        MOVE MC411-REG-NUMBER (1: 3) TO WS-PENGI-MOVE-G           EASYT007
#00989        IF (WS-PENGI-MOVE-G (1: 3) = SPACES)                      EASYT007
#00989           MOVE ZEROS TO W-REGION                                 EASYT007
#00989        ELSE                                                      EASYT007
#00989           MOVE MC411-REG-NUMBER  TO W-REGION                     EASYT007
#00989        END-IF                                                    EASYT007
#00990        MOVE MC082-CON-OFF TO W-CONTACT                           EASYT007
#00991        MOVE MC143-SEC-CODE (1: 1) TO WS-PENGI-MOVE-G             EASYT007
#00991        IF (WS-PENGI-MOVE-G (1: 1) = SPACES)                      EASYT007
#00991           MOVE ZEROS TO W-SECURED-CODE                           EASYT007
#00991        ELSE                                                      EASYT007
#00991           MOVE MC143-SEC-CODE  TO W-SECURED-CODE                 EASYT007
#00991        END-IF                                                    EASYT007
#00992        MOVE MC354-USER-AMT  TO W-LOAN-LOSS                       EASYT007
#00992        IF W-LOAN-LOSS NOT < ZERO                                 EASYT007
#00992           MOVE W-LOAN-LOSS TO W-LOAN-LOSS-9U                     EASYT007
#00992        END-IF                                                    EASYT007
#00993        MOVE W-GL-CODE TO ARG                                     EASYT007
#00993        PERFORM A02400-GLCODES-SEARCH                             EASYT007
#00993        IF GLCODES-GOOD-IO                                        EASYT007
#00993           MOVE DESC TO DESCRIPTION                               EASYT007
#00993        END-IF                                                    EASYT007
#00993                                                                  EASYT007
#00993        MOVE GLCODES-STATUS TO PENGI-CODE0                        EASYT007
#00993        MOVE PENGI-CODES (PENGI-CODE0 + 1) TO GLCODES-EZSTATUS    EASYT007
#00994        IF NOT GLCODES-GOOD-IO                                    EASYT007
#00995           MOVE 00000  TO REAL-GL-CODE                            EASYT007
#00998        END-IF                                                    EASYT007
#00999        MOVE SPACES TO TABLE-SW                                   EASYT007
#01000        IF MC151-PRI-PAID > ZEROS                                 EASYT007
#01000        AND W-PRINCIPAL NOT = ZEROS                               EASYT007
#01001           MOVE 001  TO CHARGE-CODE                               EASYT007
#01002           MOVE MC151-PRI-PAID  TO BILLED-AMOUNT                  EASYT007
#01002           IF BILLED-AMOUNT NOT < ZERO                            EASYT007
#01002              MOVE BILLED-AMOUNT TO BILLED-AMOUNT-9U              EASYT007
#01002           END-IF                                                 EASYT007
#01003           MOVE MC151-PRI-PAID  TO PAST-DUE-AMOUNT                EASYT007
#01003           IF PAST-DUE-AMOUNT NOT < ZERO                          EASYT007
#01003              MOVE PAST-DUE-AMOUNT TO PAST-DUE-AMOUNT-9U          EASYT007
#01003           END-IF                                                 EASYT007
#01004           PERFORM A02220-TEST-DELINQUENCY                        EASYT007
#01004              THRU A02280-TEST-DELINQUENCY-EXIT                   EASYT007
#01005        END-IF                                                    EASYT007
#01006        MOVE MC040-OBL-NAME TO W-SHORT-NAME                       EASYT007
#01007        MOVE 0  TO W-INTEREST-RATE                                EASYT007
#01007        IF W-INTEREST-RATE NOT < ZERO                             EASYT007
#01007           MOVE W-INTEREST-RATE TO W-INTEREST-RATE-9U             EASYT007
#01007        END-IF                                                    EASYT007
#01008        MOVE 0  TO INTEREST-OWING                                 EASYT007
#01008        IF INTEREST-OWING NOT < ZERO                              EASYT007
#01008           MOVE INTEREST-OWING TO INTEREST-OWING-9U               EASYT007
#01008        END-IF                                                    EASYT007
#01009        MOVE 0  TO W-INTEREST-FEE                                 EASYT007
#01009        IF W-INTEREST-FEE NOT < ZERO                              EASYT007
#01009           MOVE W-INTEREST-FEE TO W-INTEREST-FEE-9U               EASYT007
#01009        END-IF                                                    EASYT007
#01010        MOVE 0  TO FEES-OWING                                     EASYT007
#01010        IF FEES-OWING NOT < ZERO                                  EASYT007
#01010           MOVE FEES-OWING TO FEES-OWING-9U                       EASYT007
#01010        END-IF                                                    EASYT007
#01011        IF MC700-PAR-OBLIGR NOT = ZEROS                           EASYT007
#01012           MOVE MC700-PAR-OBLIGR  TO REF-OBLIGOR                  EASYT007
#01013           MOVE MC702-PAR-OBLGT  TO REF-OBLIGAT                   EASYT007
#01014           MOVE MC705-PAR-TYPE  TO W-TIE-TYPE                     EASYT007
#01015        END-IF                                                    EASYT007
#01016        IF MC900-NUM-OF-SEG = ZEROS                               EASYT007
#01017           MOVE 1 TO WS-JOB2-FLAG                                 EASYT007
#01017           GO TO A02010-JOB2-READ                                 EASYT007
#01018        END-IF                                                    EASYT007
#01019        IF MC950-SEG-CODE = 100                                   EASYT007
#01020           MOVE MC950-PRI-SEG  TO PE-INT-HEADER                   EASYT007
#01021           PERFORM A02090-TEST-INTEREST-HEAD                      EASYT007
#01021              THRU A02100-TEST-INTEREST-HEAD-EXIT                 EASYT007
#01022        END-IF                                                    EASYT007
#01023        IF (MC950-SEG-CODE = 400 OR 500)                          EASYT007
#01024           MOVE MC950-PRI-SEG  TO PE-INT-HEADER                   EASYT007
#01025           PERFORM A02110-TEST-FEE-HEADER                         EASYT007
#01025              THRU A02120-TEST-FEE-HEADER-EXIT                    EASYT007
#01026        END-IF                                                    EASYT007
#01027        IF MC950-SEG-CODE = 915                                   EASYT007
#01027        AND RATE-CODE = 'F'                                       EASYT007
#01028           MOVE MC950-PRI-SEG  TO RK-PRI-SCHEDULES                EASYT007
#01030           PERFORM A02130-TEST-PRIME-SCHEDUL                      EASYT007
#01030              THRU A02140-TEST-PRIME-SCHEDUL-EXIT                 EASYT007
#01031        END-IF                                                    EASYT007
#01032     END-IF                                                       EASYT007
#01034     IF (NS025-REC-CODE NOT > 399 AND NOT < 350)                  EASYT007
#01035        IF NS010-OBL-NUMBER = W-OBLIGOR                           EASYT007
#01035        AND NS005-BAN-NUMBER = W-BANK                             EASYT007
#01036           IF NS015-OBL-NUMBER = W-OBLIGAT                        EASYT007
#01037              MOVE 1  TO NS-OCCRS                                 EASYT007
#01040              PERFORM A02380-SEGMENT-LOOP                         EASYT007
#01059           END-IF                                                 EASYT007
#01060        END-IF                                                    EASYT007
#01061     END-IF.                                                      EASYT007
#01061                                                                  EASYT007
#01063 A02040-AUTO-GENERATE-READ.                                       EASYT007
#01063     MOVE 1 TO WS-JOB2-FLAG                                       EASYT007
#01063     GO TO A02010-JOB2-READ.                                      EASYT007
#01063                                                                  EASYT007
#01063*-*************************************************************** EASYT007
#01063* JOB2 PROC NAME: POINT-OBLIGAT-PROC                            * EASYT007
#01063***************************************************************** EASYT007
#01063 A02050-POINT-OBLIGAT-PROC.                                       EASYT007
#01064     MOVE KEY-M-KEY TO IM8124D-KSD-KEY                            EASYT007
#01064     PERFORM A02440-M8124D-2-START                                EASYT007
#01065     IF END-OF-M8124D OR M8124D-EZSTATUS NOT = ZEROS              EASYT007
#01066        MOVE KEY-M-KEY TO DLN-0022-KEY-M-KEY                      EASYT007
#01066        ADD 1 TO SYSPRINT-IO-COUNT                                EASYT007
#01066        WRITE SYSPRINT-RECORD  FROM DLN-0022                      EASYT007
#01066                AFTER ADVANCING 1                                 EASYT007
#01066        MOVE SYSPRINT-STATUS TO PENGI-CODE0                       EASYT007
#01066        MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUS   EASYT007
#01068        IF JOB2-SPECIAL-PROC                                      EASYT007
#01068           IF JOB2-START-PROC                                     EASYT007
#01068              SET JOB2-STOP-JOB TO TRUE                           EASYT007
#01068              GO TO A02060-POINT-OBLIGAT-PROC-EXIT                EASYT007
#01068           END-IF                                                 EASYT007
#01068           IF JOB2-FINISH-PROC                                    EASYT007
#01068              SET JOB2-STOP-JOB TO TRUE                           EASYT007
#01068              GO TO A02060-POINT-OBLIGAT-PROC-EXIT                EASYT007
#01068           END-IF                                                 EASYT007
#01068        ELSE                                                      EASYT007
#01068           SET JOB2-STOP-JOB TO TRUE                              EASYT007
#01068           GO TO A02010-JOB2-READ                                 EASYT007
#01068        END-IF                                                    EASYT007
#01069     END-IF.                                                      EASYT007
#01069                                                                  EASYT007
#01070 A02060-POINT-OBLIGAT-PROC-EXIT. EXIT.                            EASYT007
#01072                                                                  EASYT007
#01072*-*************************************************************** EASYT007
#01072* JOB2 PROC NAME: START-OBLIGAT-PROC                            * EASYT007
#01072***************************************************************** EASYT007
#01072 A02070-START-OBLIGAT-PROC.                                       EASYT007
#01073     MOVE SPACES  TO KEY-M-KEY                                    EASYT007
#01074     PERFORM A02050-POINT-OBLIGAT-PROC                            EASYT007
#01074        THRU A02060-POINT-OBLIGAT-PROC-EXIT                       EASYT007
#01075     MOVE 0  TO W-BANK                                            EASYT007
#01076     MOVE 0  TO W-OBLIGOR                                         EASYT007
#01077     MOVE 0  TO W-OBLIGAT                                         EASYT007
#01078     MOVE 0  TO W-SW.                                             EASYT007
#01078                                                                  EASYT007
#01079 A02080-START-OBLIGAT-PROC-EXIT. EXIT.                            EASYT007
#01081                                                                  EASYT007
#01081*-*************************************************************** EASYT007
#01081* JOB2 PROC NAME: TEST-INTEREST-HEAD                            * EASYT007
#01081***************************************************************** EASYT007
#01081 A02090-TEST-INTEREST-HEAD.                                       EASYT007
#01083     IF PE002-INT-C = 100                                         EASYT007
#01086        IF (PE045-INT-ITEM = ZEROS OR 1 OR 4 OR 5 OR 6)           EASYT007
#01087           COMPUTE INTEREST-OWING =                               EASYT007
#01087                         PE604-INT-MTD + INTEREST-OWING           EASYT007
#01087           IF INTEREST-OWING NOT < ZERO                           EASYT007
#01087              MOVE INTEREST-OWING TO INTEREST-OWING-9U            EASYT007
#01087           END-IF                                                 EASYT007
#01088           COMPUTE W-INTEREST-FEE =                               EASYT007
#01088                         W-INTEREST-FEE + PE600-INT-ITD -         EASYT007
                               PE630-INT-ITD                            EASYT007
#01088           IF W-INTEREST-FEE NOT < ZERO                           EASYT007
#01088              MOVE W-INTEREST-FEE TO W-INTEREST-FEE-9U            EASYT007
#01088           END-IF                                                 EASYT007
#01098           IF PE604-INT-MTD NOT = ZEROS                           EASYT007
#01099              MOVE 'N' TO ZERO-SW                                 EASYT007
#01100           END-IF                                                 EASYT007
#01101           COMPUTE W-INTEREST =                                   EASYT007
#01101                         PE730-INT-RECVD + PE606-INT-BTD          EASYT007
#01101           IF W-INTEREST NOT < ZERO                               EASYT007
#01101              MOVE W-INTEREST TO W-INTEREST-9U                    EASYT007
#01101           END-IF                                                 EASYT007
#01103           IF PE730-INT-RECVD > ZEROS                             EASYT007
#01103           AND W-INTEREST > ZEROS                                 EASYT007
#01105              MOVE PE010-INT-CD (1: 3) TO WS-PENGI-MOVE-G         EASYT007
#01105              IF (WS-PENGI-MOVE-G (1: 3) = SPACES)                EASYT007
#01105                 MOVE ZEROS TO CHARGE-CODE                        EASYT007
#01105              ELSE                                                EASYT007
#01105                 MOVE PE010-INT-CD  TO CHARGE-CODE                EASYT007
#01105              END-IF                                              EASYT007
#01106              MOVE PE730-INT-RECVD  TO BILLED-AMOUNT              EASYT007
#01106              IF BILLED-AMOUNT NOT < ZERO                         EASYT007
#01106                 MOVE BILLED-AMOUNT TO BILLED-AMOUNT-9U           EASYT007
#01106              END-IF                                              EASYT007
#01107              MOVE PE730-INT-RECVD  TO PAST-DUE-AMOUNT            EASYT007
#01107              IF PAST-DUE-AMOUNT NOT < ZERO                       EASYT007
#01107                 MOVE PAST-DUE-AMOUNT TO PAST-DUE-AMOUNT-9U       EASYT007
#01107              END-IF                                              EASYT007
#01108              PERFORM A02220-TEST-DELINQUENCY                     EASYT007
#01108                 THRU A02280-TEST-DELINQUENCY-EXIT                EASYT007
#01109           END-IF                                                 EASYT007
#01113        END-IF                                                    EASYT007
#01114     END-IF.                                                      EASYT007
#01114                                                                  EASYT007
#01115 A02100-TEST-INTEREST-HEAD-EXIT. EXIT.                            EASYT007
#01117                                                                  EASYT007
#01117*-*************************************************************** EASYT007
#01117* JOB2 PROC NAME: TEST-FEE-HEADER                               * EASYT007
#01117***************************************************************** EASYT007
#01117 A02110-TEST-FEE-HEADER.                                          EASYT007
#01119     IF PE002-INT-C = 400                                         EASYT007
#01122        IF (PE045-INT-ITEM = ZEROS OR 1 OR 4 OR 5 OR 6)           EASYT007
#01123           COMPUTE FEES-OWING =                                   EASYT007
#01123                         PE604-INT-MTD + FEES-OWING               EASYT007
#01123           IF FEES-OWING NOT < ZERO                               EASYT007
#01123              MOVE FEES-OWING TO FEES-OWING-9U                    EASYT007
#01123           END-IF                                                 EASYT007
#01124           COMPUTE W-INTEREST-FEE =                               EASYT007
#01124                         W-INTEREST-FEE + PE600-INT-ITD -         EASYT007
                               PE630-INT-ITD                            EASYT007
#01124           IF W-INTEREST-FEE NOT < ZERO                           EASYT007
#01124              MOVE W-INTEREST-FEE TO W-INTEREST-FEE-9U            EASYT007
#01124           END-IF                                                 EASYT007
#01127           IF PE604-INT-MTD NOT = ZEROS                           EASYT007
#01128              MOVE 'N' TO ZERO-SW                                 EASYT007
#01129           END-IF                                                 EASYT007
#01130        END-IF                                                    EASYT007
#01131     END-IF.                                                      EASYT007
#01131                                                                  EASYT007
#01132 A02120-TEST-FEE-HEADER-EXIT. EXIT.                               EASYT007
#01134                                                                  EASYT007
#01134*-*************************************************************** EASYT007
#01134* JOB2 PROC NAME: TEST-PRIME-SCHEDUL                            * EASYT007
#01134***************************************************************** EASYT007
#01134 A02130-TEST-PRIME-SCHEDUL.                                       EASYT007
#01136     IF RK002-PRI-C = 915                                         EASYT007
#01137        MOVE 1  TO RK-OCCRS                                       EASYT007
#01138        IF RK004-PRI-ENTRIE > ZEROS                               EASYT007
#01139           PERFORM A02390-RK-BUCKET-LOOP                          EASYT007
#01155        END-IF                                                    EASYT007
#01156     END-IF.                                                      EASYT007
#01156                                                                  EASYT007
#01157 A02140-TEST-PRIME-SCHEDUL-EXIT. EXIT.                            EASYT007
#01159                                                                  EASYT007
#01159*-*************************************************************** EASYT007
#01159* JOB2 PROC NAME: EXTRACT-ROUTINE                               * EASYT007
#01159***************************************************************** EASYT007
#01159 A02150-EXTRACT-ROUTINE.                                          EASYT007
#01160     MOVE W-LAS-DAILY-TRAN (1: 6) TO WS-PENGI-MOVE-G              EASYT007
#01160     IF (WS-PENGI-MOVE-G (1: 6) = SPACES)                         EASYT007
#01160        MOVE ZEROS TO DATE-IN                                     EASYT007
#01160     ELSE                                                         EASYT007
#01160        MOVE W-LAS-DAILY-TRAN  TO DATE-IN                         EASYT007
#01160     END-IF                                                       EASYT007
#01162     MOVE W-ZER-BAL-PROC-D (1: 6) TO WS-PENGI-MOVE-G              EASYT007
#01162     IF (WS-PENGI-MOVE-G (1: 6) = SPACES)                         EASYT007
#01162        MOVE ZEROS TO DATE-IN2                                    EASYT007
#01162     ELSE                                                         EASYT007
#01162        MOVE W-ZER-BAL-PROC-D  TO DATE-IN2                        EASYT007
#01162     END-IF                                                       EASYT007
#01167     IF MM-RPT = W-ZERO-BAL-MM                                    EASYT007
#01167     AND YY-RPT = W-ZERO-BAL-YY                                   EASYT007
#01168        MOVE 'C' TO W-STATUS-CODE                                 EASYT007
#01169     END-IF                                                       EASYT007
#01176     IF PRI-BALANCE NOT = ZEROS OR W-PRINCIPAL NOT = ZEROS        EASYT007
#01177        IF DESCRIPTION = '00000'                                  EASYT007
#01178           MOVE W-GL-CODE TO DLN-0023-W-GL-CODE                   EASYT007
#01178           MOVE HOLD-RECORD-CODE TO DLN-0023-HOLD-RECORD-CODE     EASYT007
#01178           MOVE W-OBLIGAT TO DLN-0023-W-OBLIGAT                   EASYT007
#01178           MOVE W-OBLIGOR TO DLN-0023-W-OBLIGOR                   EASYT007
#01178           MOVE W-BANK TO DLN-0023-W-BANK                         EASYT007
                 PERFORM B00010-CON-DLN-0023-CHR                        CON-DLN-
#01178           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#01178           WRITE SYSPRINT-RECORD  FROM DLN-0023                   EASYT007
#01178                   AFTER ADVANCING 1                              EASYT007
#01178           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#01178           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#01180        END-IF                                                    EASYT007
#01181        MOVE 00163  TO CRITERIA                                   EASYT007
#01182        PERFORM A02490-GENERATE-BAL-RPT                           EASYT007
#01182           THRU A02500-GENERATE-BAL-RPT-EXIT                      EASYT007
#01183        MOVE PRI-BALANCE  TO W-AMOUNT                             EASYT007
#01183        IF W-AMOUNT NOT < ZERO                                    EASYT007
#01183           MOVE W-AMOUNT TO W-AMOUNT-9U                           EASYT007
#01183        END-IF                                                    EASYT007
#01184        MOVE 10041  TO CRITERIA                                   EASYT007
#01188        IF (PROCESS-TYP-LEV = 51 OR 52 OR 55 OR 58 OR 61)         EASYT007
#01189           PERFORM A02490-GENERATE-BAL-RPT                        EASYT007
#01189              THRU A02500-GENERATE-BAL-RPT-EXIT                   EASYT007
#01191           IF RATE-CODE = 'F'                                     EASYT007
#01192              MOVE 20001  TO EXT-CRITERIA2                        EASYT007
#01193              MOVE W-BANK (1: 2) TO WS-PENGI-MOVE-G               EASYT007
#01193              IF (WS-PENGI-MOVE-G (1: 2) = SPACES)                EASYT007
#01193                 MOVE ZEROS TO EXT-BANK2                          EASYT007
#01193              ELSE                                                EASYT007
#01193                 MOVE W-BANK  TO EXT-BANK2                        EASYT007
#01193              END-IF                                              EASYT007
#01194              MOVE W-ASSIGNMENT (1: 5) TO WS-PENGI-MOVE-G         EASYT007
#01194              IF (WS-PENGI-MOVE-G (1: 5) = SPACES)                EASYT007
#01194                 MOVE ZEROS TO EXT-BRANCH2                        EASYT007
#01194              ELSE                                                EASYT007
#01194                 MOVE W-ASSIGNMENT  TO EXT-BRANCH2                EASYT007
#01194              END-IF                                              EASYT007
#01195              MOVE W-OBLIGOR (1: 10) TO WS-PENGI-MOVE-G           EASYT007
#01195              IF (WS-PENGI-MOVE-G (1: 10) = SPACES)               EASYT007
#01195                 MOVE ZEROS TO EXT-OBLIGOR2                       EASYT007
#01195              ELSE                                                EASYT007
#01195                 MOVE W-OBLIGOR  TO EXT-OBLIGOR2                  EASYT007
#01195              END-IF                                              EASYT007
#01196              MOVE W-OBLIGAT (1: 10) TO WS-PENGI-MOVE-G           EASYT007
#01196              IF (WS-PENGI-MOVE-G (1: 10) = SPACES)               EASYT007
#01196                 MOVE ZEROS TO EXT-OBLIGAT2                       EASYT007
#01196              ELSE                                                EASYT007
#01196                 MOVE W-OBLIGAT  TO EXT-OBLIGAT2                  EASYT007
#01196              END-IF                                              EASYT007
#01197              MOVE OBLIGATION-TYPE(1: 3) TO WS-PENGI-MOVE-G       EASYT007
#01197              IF (WS-PENGI-MOVE-G (1: 3) = SPACES)                EASYT007
#01197                 MOVE ZEROS TO WS-NUM-VALUE-5-3-0                 EASYT007
#01197              ELSE                                                EASYT007
#01197                 MOVE OBLIGATION-TYPE TO WS-NUM-VALUE-5-3-0       EASYT007
#01197              END-IF                                              EASYT007
#01197              MOVE WS-ALF-VALUE-5-3-0 TO EXT-TYPE2                EASYT007
#01198              MOVE DATE-INC (1: 6) TO WS-PENGI-MOVE-G             EASYT007
#01198              IF (WS-PENGI-MOVE-G (1: 6) = SPACES)                EASYT007
#01198                 MOVE ZEROS TO EXT-DATE2                          EASYT007
#01198              ELSE                                                EASYT007
#01198                 MOVE DATE-INC  TO EXT-DATE2                      EASYT007
#01198              END-IF                                              EASYT007
#01199              MOVE PRI-BALANCE  TO EXT-AMOUNT2                    EASYT007
#01200              MOVE WORK-DATEA (1: 6) TO WS-PENGI-MOVE-G           EASYT007
#01200              IF (WS-PENGI-MOVE-G (1: 6) = SPACES)                EASYT007
#01200                 MOVE ZEROS TO EXT-MAT-DT2                        EASYT007
#01200              ELSE                                                EASYT007
#01200                 MOVE WORK-DATEA  TO EXT-MAT-DT2                  EASYT007
#01200              END-IF                                              EASYT007
#01201              MOVE WORK-DATEB (1: 6) TO WS-PENGI-MOVE-G           EASYT007
#01201              IF (WS-PENGI-MOVE-G (1: 6) = SPACES)                EASYT007
#01201                 MOVE ZEROS TO EXT-ORIG-DT2                       EASYT007
#01201              ELSE                                                EASYT007
#01201                 MOVE WORK-DATEB  TO EXT-ORIG-DT2                 EASYT007
#01201              END-IF                                              EASYT007
#01202              MOVE 0  TO WORK-DATEA                               EASYT007
#01203              MOVE 0  TO WORK-DATEB                               EASYT007
#01204              PERFORM A02450-ME7232-3-WRITE                       EASYT007
#01205           END-IF                                                 EASYT007
#01207        END-IF                                                    EASYT007
#01211        MOVE 0  TO W-AMOUNT                                       EASYT007
#01211        IF W-AMOUNT NOT < ZERO                                    EASYT007
#01211           MOVE W-AMOUNT TO W-AMOUNT-9U                           EASYT007
#01211        END-IF                                                    EASYT007
#01212        IF (W-SECURED-CODE = 2 OR 3)                              EASYT007
#01213           MOVE 00529  TO CRITERIA                                EASYT007
#01214           PERFORM A02490-GENERATE-BAL-RPT                        EASYT007
#01214              THRU A02500-GENERATE-BAL-RPT-EXIT                   EASYT007
#01215        END-IF                                                    EASYT007
#01216        IF DELINQ-SW = 'Y'                                        EASYT007
#01217           MOVE 00505  TO CRITERIA                                EASYT007
#01218           PERFORM A02490-GENERATE-BAL-RPT                        EASYT007
#01218              THRU A02500-GENERATE-BAL-RPT-EXIT                   EASYT007
#01220        END-IF                                                    EASYT007
#01222        IF W-STATUS-CODE = 'N'                                    EASYT007
#01222        AND W-ORIGINAL > ZEROS                                    EASYT007
#01223           MOVE 00501  TO CRITERIA                                EASYT007
#01224           PERFORM A02490-GENERATE-BAL-RPT                        EASYT007
#01224              THRU A02500-GENERATE-BAL-RPT-EXIT                   EASYT007
#01225        END-IF                                                    EASYT007
#01226        MOVE CRITERIA  TO CRITERIA                                EASYT007
#01227     ELSE                                                         EASYT007
#01229        IF W-STATUS-CODE = 'N'                                    EASYT007
#01229        AND W-ORIGINAL > ZEROS                                    EASYT007
#01230           MOVE 00501  TO CRITERIA                                EASYT007
#01231           PERFORM A02490-GENERATE-BAL-RPT                        EASYT007
#01231              THRU A02500-GENERATE-BAL-RPT-EXIT                   EASYT007
#01232        END-IF                                                    EASYT007
#01233        IF W-STATUS-CODE = 'C'                                    EASYT007
#01234           MOVE 00002  TO CRITERIA                                EASYT007
#01235           PERFORM A02490-GENERATE-BAL-RPT                        EASYT007
#01235              THRU A02500-GENERATE-BAL-RPT-EXIT                   EASYT007
#01236        END-IF                                                    EASYT007
#01237     END-IF                                                       EASYT007
#01238     IF INTEREST-OWING NOT = ZEROS                                EASYT007
#01240        IF (PROCESS-TYP-LEV NOT = 54                              EASYT007
#01240        AND 56                                                    EASYT007
#01240        AND 57                                                    EASYT007
#01240        AND 59)                                                   EASYT007
#01241           MOVE INTEREST-OWING  TO W-AMOUNT                       EASYT007
#01241           IF W-AMOUNT NOT < ZERO                                 EASYT007
#01241              MOVE W-AMOUNT TO W-AMOUNT-9U                        EASYT007
#01241           END-IF                                                 EASYT007
#01242           MOVE 10058  TO CRITERIA                                EASYT007
#01243           PERFORM A02490-GENERATE-BAL-RPT                        EASYT007
#01243              THRU A02500-GENERATE-BAL-RPT-EXIT                   EASYT007
#01244           MOVE 0  TO W-AMOUNT                                    EASYT007
#01244           IF W-AMOUNT NOT < ZERO                                 EASYT007
#01244              MOVE W-AMOUNT TO W-AMOUNT-9U                        EASYT007
#01244           END-IF                                                 EASYT007
#01245        END-IF                                                    EASYT007
#01246     END-IF                                                       EASYT007
#01247     IF FEES-OWING NOT < ZEROS                                    EASYT007
#01248        CONTINUE                                                  EASYT007
#01248     END-IF.                                                      EASYT007
#01248                                                                  EASYT007
#01250 A02160-END-EXTRACT.                                              EASYT007
#01250 A02170-EXTRACT-ROUTINE-EXIT. EXIT.                               EASYT007
#01252                                                                  EASYT007
#01252*-*************************************************************** EASYT007
#01252* JOB2 PROC NAME: TITLE-DATE-PROC                               * EASYT007
#01252***************************************************************** EASYT007
#01252 A02180-TITLE-DATE-PROC.                                          EASYT007
#01253     MOVE M-DATE (1: 6) TO WS-PENGI-MOVE-G                        EASYT007
#01253     IF (WS-PENGI-MOVE-G (1: 6) = SPACES)                         EASYT007
#01253        MOVE ZEROS TO DATE-OUT                                    EASYT007
#01253     ELSE                                                         EASYT007
#01253        MOVE M-DATE  TO DATE-OUT                                  EASYT007
#01253     END-IF                                                       EASYT007
#01254     MOVE MM-OUT  TO MM-RPT                                       EASYT007
#01255     MOVE DD-OUT  TO DD-RPT                                       EASYT007
#01256     MOVE YY-OUT  TO YY-RPT                                       EASYT007
#01257     MOVE MM-OUT  TO BUS-MM                                       EASYT007
#01258     MOVE YY-OUT  TO BUS-YY                                       EASYT007
#01259     IF YY-OUT NOT > 60                                           EASYT007
#01260        MOVE 20  TO BUS-CC                                        EASYT007
#01261     ELSE                                                         EASYT007
#01262        MOVE 19  TO BUS-CC                                        EASYT007
#01263     END-IF.                                                      EASYT007
#01263                                                                  EASYT007
#01264 A02190-TITLE-DATE-PROC-EXIT. EXIT.                               EASYT007
#01266                                                                  EASYT007
#01266*-*************************************************************** EASYT007
#01266* JOB2 PROC NAME: LMS-DATE-RTN                                  * EASYT007
#01266***************************************************************** EASYT007
#01266 A02200-LMS-DATE-RTN.                                             EASYT007
#01267     MOVE MM-IN  TO MM-OUT                                        EASYT007
#01268     MOVE DD-IN  TO DD-OUT                                        EASYT007
#01269     MOVE YY-IN  TO YY-OUT.                                       EASYT007
#01269                                                                  EASYT007
#01270 A02210-LMS-DATE-RTN-EXIT. EXIT.                                  EASYT007
#01272                                                                  EASYT007
#01272*-*************************************************************** EASYT007
#01272* JOB2 PROC NAME: TEST-DELINQUENCY                              * EASYT007
#01272***************************************************************** EASYT007
#01272 A02220-TEST-DELINQUENCY.                                         EASYT007
#01273     IF TABLE-SW = 'Y'                                            EASYT007
#01274        MOVE CURRENT-MAX-OCCR (1: 3) TO WS-PENGI-MOVE-G           EASYT007
#01274        IF (WS-PENGI-MOVE-G (1: 3) = SPACES)                      EASYT007
#01274           MOVE ZEROS TO ITR-OCCRS                                EASYT007
#01274        ELSE                                                      EASYT007
#01274           MOVE CURRENT-MAX-OCCR  TO ITR-OCCRS                    EASYT007
#01274        END-IF                                                    EASYT007
#01275        GO TO A02240-READ-INVOICE-TABLE                           EASYT007
#01276     END-IF                                                       EASYT007
#01277     MOVE W-BANK (1: 2) TO WS-PENGI-MOVE-G                        EASYT007
#01277     IF (WS-PENGI-MOVE-G (1: 2) = SPACES)                         EASYT007
#01277        MOVE ZEROS TO KEY-V-005-NUMBER                            EASYT007
#01277     ELSE                                                         EASYT007
#01277        MOVE W-BANK  TO KEY-V-005-NUMBER                          EASYT007
#01277     END-IF                                                       EASYT007
#01278     MOVE W-OBLIGOR (1: 10) TO WS-PENGI-MOVE-G                    EASYT007
#01278     IF (WS-PENGI-MOVE-G (1: 10) = SPACES)                        EASYT007
#01278        MOVE ZEROS TO KEY-V-010-NUMBER                            EASYT007
#01278     ELSE                                                         EASYT007
#01278        MOVE W-OBLIGOR  TO KEY-V-010-NUMBER                       EASYT007
#01278     END-IF                                                       EASYT007
#01279     MOVE KEY-V-INV-NUM  TO WS-PENGI-MOVE-G                       EASYT007
#01279     MOVE WS-PENGI-MOVE-G  TO KEY-V-013-NUMBER                    EASYT007
#01280     MOVE 00000  TO KEY-V-025-CODE                                EASYT007
#01281     MOVE KEY-V-KEY TO IM8134D-KSD-KEY                            EASYT007
#01281     PERFORM A02460-M8134D-4-START                                EASYT007
#01282     IF END-OF-M8134D OR M8134D-EZSTATUS NOT = ZEROS              EASYT007
#01283        MOVE KEY-V-KEY TO DLN-0024-KEY-V-KEY                      EASYT007
#01283        ADD 1 TO SYSPRINT-IO-COUNT                                EASYT007
#01283        WRITE SYSPRINT-RECORD  FROM DLN-0024                      EASYT007
#01283                AFTER ADVANCING 1                                 EASYT007
#01283        MOVE SYSPRINT-STATUS TO PENGI-CODE0                       EASYT007
#01283        MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUS   EASYT007
#01286        GO TO A02270-END-TEST-DELINQUEN                           EASYT007
#01287     END-IF                                                       EASYT007
#01288     MOVE SPACES  TO INVOICE-TABLE                                EASYT007
#01289     MOVE 1  TO ITR-OCCRS.                                        EASYT007
#01289                                                                  EASYT007
#01291 A02230-READ-INVOICE-LOOP.                                        EASYT007
#01291     PERFORM A02470-M8134D-5-READ                                 EASYT007
#01292     IF END-OF-M8134D OR M8134D-EZSTATUS NOT = ZEROS              EASYT007
#01293        MOVE M8134D-EZSTATUS TO DLN-0025-M8134D-EZSTATUS          EASYT007
#01293        MOVE KEY-V-KEY TO DLN-0025-KEY-V-KEY                      EASYT007
#01293        ADD 1 TO SYSPRINT-IO-COUNT                                EASYT007
#01293        WRITE SYSPRINT-RECORD  FROM DLN-0025                      EASYT007
#01293                AFTER ADVANCING 1                                 EASYT007
#01293        MOVE SYSPRINT-STATUS TO PENGI-CODE0                       EASYT007
#01293        MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUS   EASYT007
#01297        GO TO A02270-END-TEST-DELINQUEN                           EASYT007
#01298     END-IF                                                       EASYT007
#01299     IF VI010-OBL-NUMBER NOT = W-OBLIGOR                          EASYT007
#01300        GO TO A02240-READ-INVOICE-TABLE                           EASYT007
#01301     END-IF                                                       EASYT007
#01302     IF VI055-OBL-NUMBER NOT = W-OBLIGAT                          EASYT007
#01303        GO TO A02230-READ-INVOICE-LOOP                            EASYT007
#01304     END-IF                                                       EASYT007
#01305     IF VI070-INV-DATE = 9999999                                  EASYT007
#01306        GO TO A02230-READ-INVOICE-LOOP                            EASYT007
#01307     END-IF                                                       EASYT007
#01308     COMPUTE ITR-SEG-NDX =                                        EASYT007
#01308         1.00000000 * (ITR-OCCRS - 1) * 65                        EASYT007
#01308     COMPUTE WS-FAKE-INDEX = ITR-SEG-NDX                          EASYT007
#01308     SET ITR-SEG-NDX-004 TO WS-WORK-INDEX                         EASYT007
#01309     MOVE VI070-INV-DATE TO WS-PENGI-MOVE-G                       EASYT007
#01309     MOVE WS-PENGI-MOVE-G  TO TVI070-INV-DATE (ITR-SEG-NDX-004)   EASYT007
#01310     MOVE VI072-INV-DATE TO WS-PENGI-MOVE-G                       EASYT007
#01310     MOVE WS-PENGI-MOVE-G  TO TVI072-INV-DATE (ITR-SEG-NDX-004)   EASYT007
#01312     MOVE VI-INVOICE-DATA  TO TVI-INVOICE-DATA (ITR-SEG-NDX-004)  EASYT007
#01313     IF ITR-OCCRS < 100                                           EASYT007
#01314        COMPUTE ITR-OCCRS =                                       EASYT007
#01314            ITR-OCCRS + 1                                         EASYT007
#01315        GO TO A02230-READ-INVOICE-LOOP                            EASYT007
#01316     END-IF.                                                      EASYT007
#01316                                                                  EASYT007
#01318 A02240-READ-INVOICE-TABLE.                                       EASYT007
#01318     MOVE 'Y' TO TABLE-SW                                         EASYT007
#01319     MOVE ITR-OCCRS (1: 3) TO WS-PENGI-MOVE-G                     EASYT007
#01319     IF (WS-PENGI-MOVE-G (1: 3) = SPACES)                         EASYT007
#01319        MOVE ZEROS TO CURRENT-MAX-OCCR                            EASYT007
#01319     ELSE                                                         EASYT007
#01319        MOVE ITR-OCCRS  TO CURRENT-MAX-OCCR                       EASYT007
#01319     END-IF                                                       EASYT007
#01320     MOVE 0  TO TEST-AMOUNT                                       EASYT007
#01320     IF TEST-AMOUNT NOT < ZERO                                    EASYT007
#01320        MOVE TEST-AMOUNT TO TEST-AMOUNT-9U                        EASYT007
#01320     END-IF.                                                      EASYT007
#01320                                                                  EASYT007
#01322 A02250-READ-TABLE-LOOP.                                          EASYT007
#01322     COMPUTE ITR-SEG-NDX =                                        EASYT007
#01322         1.00000000 * (ITR-OCCRS - 1) * 65                        EASYT007
#01322     COMPUTE WS-FAKE-INDEX = ITR-SEG-NDX                          EASYT007
#01322     SET ITR-SEG-NDX-004 TO WS-WORK-INDEX                         EASYT007
#01323     MOVE 1  TO TVI-OCCRS.                                        EASYT007
#01323                                                                  EASYT007
#01325 A02260-TVI-SEGMENT-LOOP.                                         EASYT007
#01325     COMPUTE TVI-SEG-NDX =                                        EASYT007
#01325         1.00000000 * (TVI-OCCRS - 1) * 19                        EASYT007
#01325     COMPUTE WS-FAKE-INDEX = TVI-SEG-NDX                          EASYT007
#01325     SET TVI-SEG-NDX-005 TO WS-WORK-INDEX                         EASYT007
#01326     IF TVI200-CHA-CODE (ITR-SEG-NDX-004, TVI-SEG-NDX-005)        EASYT007
#01326     NUMERIC                                                      EASYT007
#01327        IF TVI200-CHA-CODE (ITR-SEG-NDX-004, TVI-SEG-NDX-005) =   EASYT007
#01327        CHARGE-CODE                                               EASYT007
#01328           COMPUTE TEST-AMOUNT =                                  EASYT007
#01328                         TEST-AMOUNT + TVI220-INV-PERIO           EASYT007
                               (ITR-SEG-NDX-004, TVI-SEG-NDX-005)       EASYT007
#01328           IF TEST-AMOUNT NOT < ZERO                              EASYT007
#01328              MOVE TEST-AMOUNT TO TEST-AMOUNT-9U                  EASYT007
#01328           END-IF                                                 EASYT007
#01329           IF TEST-AMOUNT NOT < BILLED-AMOUNT                     EASYT007
#01330              COMPUTE REPORT-PAST-DUE =                           EASYT007
#01330                               BILLED-AMOUNT - TEST-AMOUNT +      EASYT007
                                     TVI220-INV-PERIO (ITR-SEG-NDX-004, EASYT007
                                     TVI-SEG-NDX-005)                   EASYT007
#01330              IF REPORT-PAST-DUE NOT < ZERO                       EASYT007
#01330                 MOVE REPORT-PAST-DUE TO REPORT-PAST-DUE-9U       EASYT007
#01330              END-IF                                              EASYT007
#01332              MOVE TVI072-INV-DATE (ITR-SEG-NDX-004)  TO DATE-IN  EASYT007
#01333              PERFORM A02330-COMPUTE-DAYS-DIFF                    EASYT007
#01333                 THRU A02350-COMPUTE-DAYS-DIFF-EXIT               EASYT007
#01334              GO TO A02270-END-TEST-DELINQUEN                     EASYT007
#01335           ELSE                                                   EASYT007
#01336              MOVE TVI072-INV-DATE (ITR-SEG-NDX-004)  TO DATE-IN  EASYT007
#01337              PERFORM A02310-CONVERT-DATE-PROC                    EASYT007
#01337                 THRU A02320-CONVERT-DATE-PROC-EXIT               EASYT007
#01338              IF END-JULIAN NOT > START-JULIAN                    EASYT007
#01339                 COMPUTE PAST-DUE-AMOUNT =                        EASYT007
#01339                                     PAST-DUE-AMOUNT -            EASYT007
           TVI220-INV-PERIO (ITR-SEG-NDX-004, TVI-SEG-NDX-005)          EASYT007
#01339                 IF PAST-DUE-AMOUNT NOT < ZERO                    EASYT007
#01339                    MOVE PAST-DUE-AMOUNT TO PAST-DUE-AMOUNT-9U    EASYT007
#01339                 END-IF                                           EASYT007
#01341              END-IF                                              EASYT007
#01342           END-IF                                                 EASYT007
#01343        END-IF                                                    EASYT007
#01344     END-IF                                                       EASYT007
#01345     IF TVI-OCCRS < 3                                             EASYT007
#01346        COMPUTE TVI-OCCRS =                                       EASYT007
#01346            TVI-OCCRS + 1                                         EASYT007
#01347        GO TO A02260-TVI-SEGMENT-LOOP                             EASYT007
#01348     END-IF                                                       EASYT007
#01349     IF ITR-OCCRS > 1                                             EASYT007
#01350        COMPUTE ITR-OCCRS =                                       EASYT007
#01350            ITR-OCCRS - 1                                         EASYT007
#01351        GO TO A02250-READ-TABLE-LOOP                              EASYT007
#01352     END-IF                                                       EASYT007
#01353     MOVE W-OBLIGAT TO DLN-0026-W-OBLIGAT                         EASYT007
#01353     MOVE W-OBLIGOR TO DLN-0026-W-OBLIGOR                         EASYT007
#01353     MOVE W-BANK TO DLN-0026-W-BANK                               EASYT007
           PERFORM B00020-CON-DLN-0026-CHR                              CON-DLN-
#01353     ADD 1 TO SYSPRINT-IO-COUNT                                   EASYT007
#01353     WRITE SYSPRINT-RECORD  FROM DLN-0026                         EASYT007
#01353             AFTER ADVANCING 1                                    EASYT007
#01353     MOVE SYSPRINT-STATUS TO PENGI-CODE0                          EASYT007
#01353     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUS      EASYT007
#01355     MOVE TEST-AMOUNT TO DLN-0027-TEST-AMOUNT                     EASYT007
#01355     MOVE BILLED-AMOUNT TO DLN-0027-BILLED-AMOUNT                 EASYT007
#01355     ADD 1 TO SYSPRINT-IO-COUNT                                   EASYT007
#01355     WRITE SYSPRINT-RECORD  FROM DLN-0027                         EASYT007
#01355             AFTER ADVANCING 1                                    EASYT007
#01355     MOVE SYSPRINT-STATUS TO PENGI-CODE0                          EASYT007
#01355     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUS      EASYT007
#01357     MOVE TVI072-INV-DATE (ITR-SEG-NDX-004)  TO DATE-IN           EASYT007
#01358     PERFORM A02330-COMPUTE-DAYS-DIFF                             EASYT007
#01358        THRU A02350-COMPUTE-DAYS-DIFF-EXIT.                       EASYT007
#01358                                                                  EASYT007
#01360 A02270-END-TEST-DELINQUEN.                                       EASYT007
#01360 A02280-TEST-DELINQUENCY-EXIT. EXIT.                              EASYT007
#01362                                                                  EASYT007
#01362*-*************************************************************** EASYT007
#01362* JOB2 PROC NAME: LAST-REC-PROC                                 * EASYT007
#01362***************************************************************** EASYT007
#01362 A02290-LAST-REC-PROC.                                            EASYT007
#01363     IF EXTRACT-SW = 'Y'                                          EASYT007
#01364        MOVE 'N' TO EXTRACT-SW                                    EASYT007
#01365        PERFORM A02150-EXTRACT-ROUTINE                            EASYT007
#01365           THRU A02170-EXTRACT-ROUTINE-EXIT                       EASYT007
#01366     END-IF.                                                      EASYT007
#01366                                                                  EASYT007
#01367 A02300-LAST-REC-PROC-EXIT. EXIT.                                 EASYT007
#01369                                                                  EASYT007
#01369*-*************************************************************** EASYT007
#01369* JOB2 PROC NAME: CONVERT-DATE-PROC                             * EASYT007
#01369***************************************************************** EASYT007
#01369 A02310-CONVERT-DATE-PROC.                                        EASYT007
#01370     PERFORM A02200-LMS-DATE-RTN                                  EASYT007
#01370        THRU A02210-LMS-DATE-RTN-EXIT                             EASYT007
#01371     MOVE DATE-OUT (1: 6) TO WS-PENGI-MOVE-G                      EASYT007
#01371     IF (WS-PENGI-MOVE-G (1: 6) = SPACES)                         EASYT007
#01371        MOVE ZEROS TO GREGORIAN                                   EASYT007
#01371     ELSE                                                         EASYT007
#01371        MOVE DATE-OUT  TO GREGORIAN                               EASYT007
#01371     END-IF                                                       EASYT007
#01372     MOVE 4  TO REQUEST-SW                                        EASYT007
#01373     MOVE 0  TO ERROR-SW                                          EASYT007
#01374     PERFORM A02360-LNSDATE-RTN                                   EASYT007
#01374        THRU A02370-LNSDATE-RTN-EXIT                              EASYT007
#01375     MOVE JULIAN  TO START-JULIAN.                                EASYT007
#01375                                                                  EASYT007
#01377 A02320-CONVERT-DATE-PROC-EXIT. EXIT.                             EASYT007
#01379                                                                  EASYT007
#01379*-*************************************************************** EASYT007
#01379* JOB2 PROC NAME: COMPUTE-DAYS-DIFF                             * EASYT007
#01379***************************************************************** EASYT007
#01379 A02330-COMPUTE-DAYS-DIFF.                                        EASYT007
#01380     PERFORM A02310-CONVERT-DATE-PROC                             EASYT007
#01380        THRU A02320-CONVERT-DATE-PROC-EXIT                        EASYT007
#01381     IF END-JULIAN NOT > START-JULIAN                             EASYT007
#01383        GO TO A02340-END-COMPUTE-DAYS-D                           EASYT007
#01384     END-IF                                                       EASYT007
#01385     COMPUTE DIFF =                                               EASYT007
#01385             END-JJJ - START-JJJ + 1                              EASYT007
#01385     IF DIFF NOT < ZERO                                           EASYT007
#01385        MOVE DIFF TO DIFF-9U                                      EASYT007
#01385     END-IF                                                       EASYT007
#01386     COMPUTE LEAPS =                                              EASYT007
#01386             1.00000000 * START-YY * 25                           EASYT007
#01386     IF LEAPS NOT < ZERO                                          EASYT007
#01386        MOVE LEAPS TO LEAPS-9U                                    EASYT007
#01386     END-IF                                                       EASYT007
#01387     IF START-YY < END-YY                                         EASYT007
#01388        IF LEAPS = ZEROS                                          EASYT007
#01389           COMPUTE DIFF =                                         EASYT007
#01389                         DIFF + 366                               EASYT007
#01389           IF DIFF NOT < ZERO                                     EASYT007
#01389              MOVE DIFF TO DIFF-9U                                EASYT007
#01389           END-IF                                                 EASYT007
#01390        ELSE                                                      EASYT007
#01391           COMPUTE DIFF =                                         EASYT007
#01391                         DIFF + 365                               EASYT007
#01391           IF DIFF NOT < ZERO                                     EASYT007
#01391              MOVE DIFF TO DIFF-9U                                EASYT007
#01391           END-IF                                                 EASYT007
#01392        END-IF                                                    EASYT007
#01393     END-IF                                                       EASYT007
#01394     IF DIFF < DELQ-CATEGORY1                                     EASYT007
#01395        MOVE 0  TO DELQ-LEVEL                                     EASYT007
#01396     ELSE                                                         EASYT007
#01397        IF DIFF < DELQ-CATEGORY2                                  EASYT007
#01398           MOVE 1  TO DELQ-LEVEL                                  EASYT007
#01399        ELSE                                                      EASYT007
#01400           IF DIFF < DELQ-CATEGORY3                               EASYT007
#01401              MOVE 2  TO DELQ-LEVEL                               EASYT007
#01402           ELSE                                                   EASYT007
#01403              IF DIFF < DELQ-CATEGORY4                            EASYT007
#01404                 MOVE 3  TO DELQ-LEVEL                            EASYT007
#01405              ELSE                                                EASYT007
#01406                 MOVE 4  TO DELQ-LEVEL                            EASYT007
#01407              END-IF                                              EASYT007
#01408           END-IF                                                 EASYT007
#01409        END-IF                                                    EASYT007
#01410     END-IF                                                       EASYT007
#01412     IF DIFF > 30                                                 EASYT007
#01413        MOVE 'Y' TO DELINQ-SW                                     EASYT007
#01415     END-IF.                                                      EASYT007
#01415                                                                  EASYT007
#01417 A02340-END-COMPUTE-DAYS-D.                                       EASYT007
#01417 A02350-COMPUTE-DAYS-DIFF-EXIT. EXIT.                             EASYT007
#01419                                                                  EASYT007
#01419*-*************************************************************** EASYT007
#01419* JOB2 PROC NAME: LNSDATE-RTN                                   * EASYT007
#01419***************************************************************** EASYT007
#01419 A02360-LNSDATE-RTN.                                              EASYT007
#01420     CALL WS-GPROG-LNSDATE-1 USING                                EASYT007
#01420                           JULIAN                                 EASYT007
#01420                           GREGORIAN                              EASYT007
#01420                           REQUEST-SW                             EASYT007
#01420                           ERROR-SW                               EASYT007
#01421     IF ERROR-SW NOT = ZEROS                                      EASYT007
#01422        MOVE REQUEST-SW TO DLN-0028-REQUEST-SW                    EASYT007
#01422        MOVE GREGORIAN TO DLN-0028-GREGORIAN                      EASYT007
#01422        MOVE JULIAN TO DLN-0028-JULIAN                            EASYT007
              PERFORM B00030-CON-DLN-0028-CHR                           CON-DLN-
#01422        ADD 1 TO SYSPRINT-IO-COUNT                                EASYT007
#01422        WRITE SYSPRINT-RECORD  FROM DLN-0028                      EASYT007
#01422                AFTER ADVANCING 1                                 EASYT007
#01422        MOVE SYSPRINT-STATUS TO PENGI-CODE0                       EASYT007
#01422        MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUS   EASYT007
#01423        IF JOB2-SPECIAL-PROC                                      EASYT007
#01423           IF JOB2-START-PROC                                     EASYT007
#01423              SET JOB2-STOP-JOB TO TRUE                           EASYT007
#01423              GO TO A02370-LNSDATE-RTN-EXIT                       EASYT007
#01423           END-IF                                                 EASYT007
#01423           IF JOB2-FINISH-PROC                                    EASYT007
#01423              SET JOB2-STOP-JOB TO TRUE                           EASYT007
#01423              GO TO A02370-LNSDATE-RTN-EXIT                       EASYT007
#01423           END-IF                                                 EASYT007
#01423        ELSE                                                      EASYT007
#01423           SET JOB2-STOP-JOB TO TRUE                              EASYT007
#01423           GO TO A02010-JOB2-READ                                 EASYT007
#01423        END-IF                                                    EASYT007
#01424     END-IF.                                                      EASYT007
#01424                                                                  EASYT007
#01425 A02370-LNSDATE-RTN-EXIT. EXIT.                                   EASYT007
#01040                                                                  EASYT007
#01040*--************************************************************** EASYT007
#01040* JOB2 PROC NAME: SEGMENT-LOOP                                  * EASYT007
#01040***************************************************************** EASYT007
#01040 A02380-SEGMENT-LOOP.                                             EASYT007
#01040     COMPUTE SEG-NDX =                                            EASYT007
#01040         1.00000000 * (NS-OCCRS - 1) * 604                        EASYT007
#01040     COMPUTE WS-FAKE-INDEX = SEG-NDX                              EASYT007
#01040     SET SEG-NDX-001 TO WS-WORK-INDEX                             EASYT007
#01041     MOVE CURRENT-SEGMENT (SEG-NDX-001)  TO SEGMENT-RECORD        EASYT007
#01042     IF SEGMENT-FOR-CODE = 100                                    EASYT007
#01043        MOVE SEGMENT-RECORD  TO PE-INT-HEADER                     EASYT007
#01044        PERFORM A02090-TEST-INTEREST-HEAD                         EASYT007
#01044           THRU A02100-TEST-INTEREST-HEAD-EXIT                    EASYT007
#01045     END-IF                                                       EASYT007
#01046     IF (SEGMENT-FOR-CODE = 400 OR 500)                           EASYT007
#01047        MOVE SEGMENT-RECORD  TO PE-INT-HEADER                     EASYT007
#01048        PERFORM A02110-TEST-FEE-HEADER                            EASYT007
#01048           THRU A02120-TEST-FEE-HEADER-EXIT                       EASYT007
#01049     END-IF                                                       EASYT007
#01050     IF SEGMENT-FOR-CODE = 915                                    EASYT007
#01050     AND RATE-CODE = 'F'                                          EASYT007
#01051        MOVE SEGMENT-RECORD  TO RK-PRI-SCHEDULES                  EASYT007
#01053        PERFORM A02130-TEST-PRIME-SCHEDUL                         EASYT007
#01053           THRU A02140-TEST-PRIME-SCHEDUL-EXIT                    EASYT007
#01054     END-IF                                                       EASYT007
#01055     IF NS-OCCRS < NS040-ACT-NUM-SE                               EASYT007
#01056        COMPUTE NS-OCCRS =                                        EASYT007
#01056            NS-OCCRS + 1                                          EASYT007
#01057        GO TO A02380-SEGMENT-LOOP                                 EASYT007
#01058     END-IF.                                                      EASYT007
#01058                                                                  EASYT007
#01139*--************************************************************** EASYT007
#01139* JOB2 PROC NAME: RK-BUCKET-LOOP                                * EASYT007
#01139***************************************************************** EASYT007
#01139 A02390-RK-BUCKET-LOOP.                                           EASYT007
#01141     COMPUTE RKBKT-NDX =                                          EASYT007
#01141         1.00000000 * (RK-OCCRS - 1) * 60                         EASYT007
#01141     COMPUTE WS-FAKE-INDEX = RKBKT-NDX                            EASYT007
#01141     SET RKBKT-NDX-003 TO WS-WORK-INDEX                           EASYT007
#01143     IF RK020-PRI-DATE (RKBKT-NDX-003) NOT > W-ACCRUAL-DATE       EASYT007
#01143     AND RK030-PRI-DATE (RKBKT-NDX-003) NOT < W-ACCRUAL-DATE      EASYT007
#01146        IF RK040-PRI-NUMBER (RKBKT-NDX-003) NOT = ZEROS           EASYT007
#01147           MOVE 'V' TO RATE-CODE                                  EASYT007
#01148        END-IF                                                    EASYT007
#01149     END-IF                                                       EASYT007
#01151     IF RK-OCCRS < RK004-PRI-ENTRIE                               EASYT007
#01152        COMPUTE RK-OCCRS =                                        EASYT007
#01152            RK-OCCRS + 1                                          EASYT007
#01153        GO TO A02390-RK-BUCKET-LOOP                               EASYT007
#01154     END-IF.                                                      EASYT007
#01154                                                                  EASYT007
#00993 A02400-GLCODES-SEARCH.                                           EASYT007
#00993     PERFORM C00000-GLCODES-POINT.                                TBSERV1
#00993     IF NOT (END-OF-GLCODES OR GLCODES-CROW = ZERO)               TBSERV1
#00993        MOVE GLCODES-QAREA-TBFIELDS (GLCODES-CROW) TO             TBSERV1
              GLCODES-QAREA                                             TBSERV1
#00993     END-IF.                                                      TBSERV1
#00993                                                                  EASYT007
#00789***************************************************************** EASYT007
#00789* JOB2 FILE OPEN ROUTINE                                        * EASYT007
#00789***************************************************************** EASYT007
#00789 A02410-JOB2-OPEN.                                                EASYT007
#01457     MOVE 'X' TO SYSPRINT-IOSW                                    EASYT007
#01457     PERFORM E01260-REPORT2-OPEN                                  EASYT007
#01457     MOVE 'C' TO SYSPRINT-IOSW.                                   EASYT007
#01467                                                                  FDYNIOR
#01467* M8104D OPEN ROUTINE                                             FDYNIOR
#01467     MOVE 'OPEN'  TO M8104D-IO-REQUEST                            FDYNIOR
#01467     MOVE 'INPUT'  TO M8104D-IO-REQTYPE                           FDYNIOR
#01467     CALL 'FSDYNIO1' USING M8104D-DYNAM-FIB                       FDYNIOR
#01467                           IM8104D-KSD-KEY                        FDYNIOR
#01467     IF M8104D-KEY-PTR = NULL                                     FDYNIOR
#01467        SET ADDRESS OF M8104D-IO-AREA TO M8104D-IOAREA-PTR        FDYNIOR
#01467        SET M8104D-KEY-PTR TO ADDRESS OF IM8104D-KSD-KEY          FDYNIOR
#01467     END-IF                                                       FDYNIOR
#01467     MOVE  M8104D-IO-ERCODE1 TO M8104D-STATUS                     FDYNIOR
#01467     MOVE 'O'     TO M8104D-IOSW                                  FDYNIOR
#01467     IF M8104D-STATUS = '35'                                      FDYNIOR
#01467        MOVE 'I-O'  TO M8104D-IO-REQTYPE                          FDYNIOR
#01467        MOVE 'OPEN'  TO M8104D-IO-REQUEST                         FDYNIOR
#01467        CALL 'FSDYNIO1' USING M8104D-DYNAM-FIB                    FDYNIOR
#01467                           IM8104D-KSD-KEY                        FDYNIOR
#01467        MOVE  M8104D-IO-ERCODE1 TO M8104D-STATUS                  FDYNIOR
#01467        IF M8104D-STATUS = ZERO                                   FDYNIOR
#01467           MOVE '10' TO M8104D-STATUS                             FDYNIOR
#01467           MOVE 'E' TO M8104D-IOSW                                FDYNIOR
#01467        END-IF                                                    FDYNIOR
#01467     END-IF                                                       FDYNIOR
#01467     MOVE 'Y'     TO M8104D-ACCEPT-FLAG                           FDYNIOR
#01467     MOVE ZERO    TO M8104D-IO-COUNT                              FDYNIOR
#01467     IF (NOT M8104D-GOOD-IO)                                      FDYNIOR
#01467       AND (M8104D-IOSW NOT = 'E')                                FDYNIOR
#01467        DISPLAY M8104D-MESSAGE                                    FDYNIOR
#01467        MOVE 3041 TO WS-PENGI-RETURN                              ABRCODE
#01467        MOVE M8104D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01467        DISPLAY M8104D-IOM-NAME ': ' M8104D-IO-VSMEMSG            FDYNIOR
#01467        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01467     END-IF.                                                      FDYNIOR
#01467     SET ADDRESS OF M8104D-IO-AREA TO M8104D-IOAREA-PTR           FDYNIOR
#01467     CALL 'FSDYNPTR' USING  M8104D-DYNAM-FIB                      FDYNIOR
#01467     SET ADDRESS OF M8104D-RECORD  TO M8104D-RECORD-PTR           FDYNIOR
#01467     MOVE SPACES TO M8104D-RECORD.                                FDYNIOR
#01467     INITIALIZE M8104D-GRECORD.                                   FDYNIOR
#01467                                                                  FDYNIOR
#01467* M8124D OPEN ROUTINE                                             FDYNIOR
#01467     MOVE 'OPEN'  TO M8124D-IO-REQUEST                            FDYNIOR
#01467     MOVE 'INPUT'  TO M8124D-IO-REQTYPE                           FDYNIOR
#01467     CALL 'FSDYNIO1' USING M8124D-DYNAM-FIB                       FDYNIOR
#01467                           IM8124D-KSD-KEY                        FDYNIOR
#01467     IF M8124D-KEY-PTR = NULL                                     FDYNIOR
#01467        SET ADDRESS OF M8124D-IO-AREA TO M8124D-IOAREA-PTR        FDYNIOR
#01467        SET M8124D-KEY-PTR TO ADDRESS OF IM8124D-KSD-KEY          FDYNIOR
#01467     END-IF                                                       FDYNIOR
#01467     MOVE  M8124D-IO-ERCODE1 TO M8124D-STATUS                     FDYNIOR
#01467     MOVE 'O'     TO M8124D-IOSW                                  FDYNIOR
#01467     IF M8124D-STATUS = '35'                                      FDYNIOR
#01467        MOVE 'I-O'  TO M8124D-IO-REQTYPE                          FDYNIOR
#01467        MOVE 'OPEN'  TO M8124D-IO-REQUEST                         FDYNIOR
#01467        CALL 'FSDYNIO1' USING M8124D-DYNAM-FIB                    FDYNIOR
#01467                           IM8124D-KSD-KEY                        FDYNIOR
#01467        MOVE  M8124D-IO-ERCODE1 TO M8124D-STATUS                  FDYNIOR
#01467        IF M8124D-STATUS = ZERO                                   FDYNIOR
#01467           MOVE '10' TO M8124D-STATUS                             FDYNIOR
#01467           MOVE 'E' TO M8124D-IOSW                                FDYNIOR
#01467        END-IF                                                    FDYNIOR
#01467     END-IF                                                       FDYNIOR
#01467     MOVE 'Y'     TO M8124D-ACCEPT-FLAG                           FDYNIOR
#01467     MOVE ZERO    TO M8124D-IO-COUNT                              FDYNIOR
#01467     IF (NOT M8124D-GOOD-IO)                                      FDYNIOR
#01467       AND (M8124D-IOSW NOT = 'E')                                FDYNIOR
#01467        DISPLAY M8124D-MESSAGE                                    FDYNIOR
#01467        MOVE 3042 TO WS-PENGI-RETURN                              ABRCODE
#01467        MOVE M8124D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01467        DISPLAY M8124D-IOM-NAME ': ' M8124D-IO-VSMEMSG            FDYNIOR
#01467        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01467     END-IF.                                                      FDYNIOR
#01467     SET ADDRESS OF M8124D-IO-AREA TO M8124D-IOAREA-PTR           FDYNIOR
#01467     CALL 'FSDYNPTR' USING  M8124D-DYNAM-FIB                      FDYNIOR
#01467     SET ADDRESS OF M8124D-RECORD  TO M8124D-RECORD-PTR           FDYNIOR
#01467     MOVE SPACES TO M8124D-RECORD.                                FDYNIOR
#01467     INITIALIZE M8124D-GRECORD.                                   FDYNIOR
#01467                                                                  FDYNIOR
#01467* M8134D OPEN ROUTINE                                             FDYNIOR
#01467     MOVE 'OPEN'  TO M8134D-IO-REQUEST                            FDYNIOR
#01467     MOVE 'INPUT'  TO M8134D-IO-REQTYPE                           FDYNIOR
#01467     CALL 'FSDYNIO1' USING M8134D-DYNAM-FIB                       FDYNIOR
#01467                           IM8134D-KSD-KEY                        FDYNIOR
#01467     IF M8134D-KEY-PTR = NULL                                     FDYNIOR
#01467        SET ADDRESS OF M8134D-IO-AREA TO M8134D-IOAREA-PTR        FDYNIOR
#01467        SET M8134D-KEY-PTR TO ADDRESS OF IM8134D-KSD-KEY          FDYNIOR
#01467     END-IF                                                       FDYNIOR
#01467     MOVE  M8134D-IO-ERCODE1 TO M8134D-STATUS                     FDYNIOR
#01467     MOVE 'O'     TO M8134D-IOSW                                  FDYNIOR
#01467     IF M8134D-STATUS = '35'                                      FDYNIOR
#01467        MOVE 'I-O'  TO M8134D-IO-REQTYPE                          FDYNIOR
#01467        MOVE 'OPEN'  TO M8134D-IO-REQUEST                         FDYNIOR
#01467        CALL 'FSDYNIO1' USING M8134D-DYNAM-FIB                    FDYNIOR
#01467                           IM8134D-KSD-KEY                        FDYNIOR
#01467        MOVE  M8134D-IO-ERCODE1 TO M8134D-STATUS                  FDYNIOR
#01467        IF M8134D-STATUS = ZERO                                   FDYNIOR
#01467           MOVE '10' TO M8134D-STATUS                             FDYNIOR
#01467           MOVE 'E' TO M8134D-IOSW                                FDYNIOR
#01467        END-IF                                                    FDYNIOR
#01467     END-IF                                                       FDYNIOR
#01467     MOVE 'Y'     TO M8134D-ACCEPT-FLAG                           FDYNIOR
#01467     MOVE ZERO    TO M8134D-IO-COUNT                              FDYNIOR
#01467     IF (NOT M8134D-GOOD-IO)                                      FDYNIOR
#01467       AND (M8134D-IOSW NOT = 'E')                                FDYNIOR
#01467        DISPLAY M8134D-MESSAGE                                    FDYNIOR
#01467        MOVE 3043 TO WS-PENGI-RETURN                              ABRCODE
#01467        MOVE M8134D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01467        DISPLAY M8134D-IOM-NAME ': ' M8134D-IO-VSMEMSG            FDYNIOR
#01467        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01467     END-IF.                                                      FDYNIOR
#01467     SET ADDRESS OF M8134D-IO-AREA TO M8134D-IOAREA-PTR           FDYNIOR
#01467     CALL 'FSDYNPTR' USING  M8134D-DYNAM-FIB                      FDYNIOR
#01467     SET ADDRESS OF M8134D-RECORD  TO M8134D-RECORD-PTR           FDYNIOR
#01467     MOVE SPACES TO M8134D-RECORD.                                FDYNIOR
#01467     INITIALIZE M8134D-GRECORD.                                   FDYNIOR
#01467                                                                  FDYNIOR
#01467* ME7232 OPEN ROUTINE                                             FDYNIOR
#01467     MOVE 'OPEN'  TO ME7232-IO-REQUEST                            FDYNIOR
#01467     MOVE 'OUTPUT'  TO ME7232-IO-REQTYPE                          FDYNIOR
#01467     CALL 'FSDYNIO1' USING ME7232-DYNAM-FIB                       FDYNIOR
#01467     MOVE  ME7232-IO-ERCODE1 TO ME7232-STATUS                     FDYNIOR
#01467     MOVE 'O'     TO ME7232-IOSW                                  FDYNIOR
#01467     MOVE 'Y'     TO ME7232-ACCEPT-FLAG                           FDYNIOR
#01467     MOVE ZERO    TO ME7232-IO-COUNT                              FDYNIOR
#01467     IF (NOT ME7232-GOOD-IO)                                      FDYNIOR
#01467        DISPLAY ME7232-MESSAGE                                    FDYNIOR
#01467        MOVE 3044 TO WS-PENGI-RETURN                              ABRCODE
#01467        MOVE ME7232-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01467        DISPLAY ME7232-IOM-NAME ': ' ME7232-IO-VSMEMSG            FDYNIOR
#01467        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01467     END-IF.                                                      FDYNIOR
#01467     SET ADDRESS OF ME7232-IO-AREA TO ME7232-IOAREA-PTR           FDYNIOR
#01467     CALL 'FSDYNPTR' USING  ME7232-DYNAM-FIB                      FDYNIOR
#01467     SET ADDRESS OF ME7232-RECORD  TO ME7232-RECORD-PTR           FDYNIOR
#01467     MOVE SPACES TO ME7232-RECORD.                                FDYNIOR
#01467     INITIALIZE ME7232-GRECORD.                                   FDYNIOR
#01467                                                                  FDYNIOR
#01467     MOVE 'ALLOC SMYFIL2' TO WS-PENGI-ALLOC-REQ                   EASYT007
#01467     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC              EASYT007
#01467                                                                  FDYNIOR
#01467* SMYFIL2 OPEN ROUTINE                                            FDYNIOR
#01467     MOVE  LENGTH OF ISMYFIL2-GRECORD                             FDYNIOR
#01467               TO SMYFIL2-RECORD-KEYE                             FDYNIOR
#01467     MOVE 'OPEN'  TO SMYFIL2-IO-REQUEST                           FDYNIOR
#01467     MOVE 'OUTPUT'  TO SMYFIL2-IO-REQTYPE                         FDYNIOR
#01467     CALL 'FSDYNIO1' USING SMYFIL2-DYNAM-FIB                      FDYNIOR
#01467     MOVE  SMYFIL2-IO-ERCODE1 TO SMYFIL2-STATUS                   FDYNIOR
#01467     MOVE 'O'     TO SMYFIL2-IOSW                                 FDYNIOR
#01467     MOVE 'Y'     TO SMYFIL2-ACCEPT-FLAG                          FDYNIOR
#01467     MOVE ZERO    TO SMYFIL2-IO-COUNT                             FDYNIOR
#01467     IF (NOT SMYFIL2-GOOD-IO)                                     FDYNIOR
#01467        DISPLAY SMYFIL2-MESSAGE                                   FDYNIOR
#01467        MOVE 3045 TO WS-PENGI-RETURN                              ABRCODE
#01467        MOVE SMYFIL2-MESSAGE TO ABEND-MESSAGE                     FDYNIOR
#01467        DISPLAY SMYFIL2-IOM-NAME ': ' SMYFIL2-IO-VSMEMSG          FDYNIOR
#01467        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01467     END-IF.                                                      FDYNIOR
#01467     SET ADDRESS OF SMYFIL2-IO-AREA2 TO SMYFIL2-IOAREA2-PTR       FDYNIOR
#01467     SET ADDRESS OF SMYFIL2-IO-AREA TO SMYFIL2-IOAREA-PTR         FDYNIOR
#01467     CALL 'FSDYNPTR' USING  SMYFIL2-DYNAM-FIB                     FDYNIOR
#01467     SET ADDRESS OF SMYFIL2-RECORD  TO SMYFIL2-RECORD-PTR         FDYNIOR
#01467     MOVE SPACES TO SMYFIL2-RECORD.                               FDYNIOR
#01467     INITIALIZE SMYFIL2-GRECORD.                                  FDYNIOR
#01467                                                                  FDYNIOR
#01467     PERFORM C00020-GLCODES-OPEN.                                 TBSERV1
#01457                                                                  EASYT007
#01457***************************************************************** EASYT007
#01457* JOB2 BAL-RPT SUMMARY EXIT:                                    * EASYT007
#01457* SUMMARY FILE BUILDING LOGIC.                                  * EASYT007
#01457***************************************************************** EASYT007
#01457 A02420-JOB2-BLD-SMYFIL2.                                         EASYT007
#01463     MOVE R02-SAV-CRITERIA TO G02-SAV-CRITERIA                    EASYT007
#01463     MOVE R02-SAV-W-BANK TO G02-SAV-W-BANK                        EASYT007
#01463     MOVE R02-SAV-W-ASSIGNMENT TO G02-SAV-W-ASSIGNMENT            EASYT007
#01464     MOVE R02-SAV-WORK-TYPE TO G02-SAV-WORK-TYPE                  EASYT007
#01464     MOVE R02-SAV-ACCR-DATE TO G02-SAV-ACCR-DATE                  EASYT007
#01464     MOVE R02-LV6-PENGI-COUNT TO G02-LV6-PENGI-COUNT              EASYT007
#01466     MOVE R02-LV6-W-AMOUNT TO G02-LV6-W-AMOUNT                    EASYT007
#01467     MOVE SMYFIL2-QAREA2 TO SMYFIL2-IO-AREA                       EASYT007
#01467     PERFORM A02480-SMYFIL2-6-WRITE.                              EASYT007
#00821                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * M8104D - READR I/O INTERFACE ROUTINE                          * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00821 A02430-M8104D-1-READR.                                           EASYT007
#00821                                                                  FDYNIOR
#00821     MOVE 'READR'  TO M8104D-IO-REQUEST                           FDYNIOR
#00821     CALL 'FSDYNIO2' USING M8104D-DYNAM-FIB                       FDYNIOR
#00821     MOVE  M8104D-IO-ERCODE1 TO M8104D-STATUS                     FDYNIOR
#00821     IF M8104D-GOOD-IO                                            FDYNIOR
#00821        MOVE M8104D-IO-AREA TO M8104D-RECORD                      FDYNIOR
#00821     END-IF                                                       FDYNIOR
#00821     ADD 1 TO M8104D-IO-COUNT.                                    FDYNIOR
#00821                                                                  FDYNIOR
#00821     MOVE M8104D-STATUS TO PENGI-CODE0                            EASYT007
#00821     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO M8104D-EZSTATUS.       EASYT007
#01064                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * M8124D - START I/O INTERFACE ROUTINE                          * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01064 A02440-M8124D-2-START.                                           EASYT007
#01064                                                                  FDYNIOR
#01064     MOVE 'NOT <' TO M8124D-KEY-REL                               FDYNIOR
#01064     MOVE 'START' TO M8124D-IO-REQUEST                            FDYNIOR
#01064     CALL 'FSDYNIO2' USING M8124D-DYNAM-FIB                       FDYNIOR
#01064     MOVE  M8124D-IO-ERCODE1 TO M8124D-STATUS.                    FDYNIOR
#01064     MOVE M8124D-STATUS TO PENGI-CODE0                            EASYT007
#01064     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO M8124D-EZSTATUS.       EASYT007
#01204                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * ME7232 - WRITE I/O INTERFACE ROUTINE                          * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01204 A02450-ME7232-3-WRITE.                                           EASYT007
#01204                                                                  FDYNIOR
#01204     COMPUTE ME7232-RECORD-TAIL =                                 FDYNIOR
#01204             ME7232-RECORD-SIZE  - ME7232-RECORD-KEYE             FDYNIOR
#01204     IF ME7232-RECORD-SIZE > ME7232-RECORD-GSIZ                   FDYNIOR
#01204        COMPUTE ME7232-RECORD-VEND =                              FDYNIOR
#01204                ME7232-RECORD-SIZE  - ME7232-RECORD-GSIZ          FDYNIOR
#01204     ELSE                                                         FDYNIOR
#01204        MOVE 0 TO ME7232-RECORD-VEND                              FDYNIOR
#01204     END-IF                                                       FDYNIOR
#01204     MOVE ME7232-RECORD TO ME7232-IO-AREA                         FDYNIOR
#01204     MOVE 'WRITE'  TO ME7232-IO-REQUEST                           FDYNIOR
#01204     CALL 'FSDYNIO2' USING ME7232-DYNAM-FIB                       FDYNIOR
#01204     MOVE  ME7232-IO-ERCODE1 TO ME7232-STATUS                     FDYNIOR
#01204     ADD 1 TO ME7232-IO-COUNT                                     FDYNIOR
#01204     IF (NOT ME7232-GOOD-IO)                                      FDYNIOR
#01204        DISPLAY ME7232-MESSAGE                                    FDYNIOR
#01204        MOVE 3046 TO WS-PENGI-RETURN                              ABRCODE
#01204        MOVE ME7232-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01204        DISPLAY ME7232-IOM-NAME ': ' ME7232-IO-VSMEMSG            FDYNIOR
#01204        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01204     END-IF.                                                      FDYNIOR
#01204                                                                  FDYNIOR
#01204     MOVE ME7232-STATUS TO PENGI-CODE0                            EASYT007
#01204     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO ME7232-EZSTATUS.       EASYT007
#01281                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * M8134D - START I/O INTERFACE ROUTINE                          * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01281 A02460-M8134D-4-START.                                           EASYT007
#01281                                                                  FDYNIOR
#01281     MOVE 'NOT <' TO M8134D-KEY-REL                               FDYNIOR
#01281     MOVE 'START' TO M8134D-IO-REQUEST                            FDYNIOR
#01281     CALL 'FSDYNIO2' USING M8134D-DYNAM-FIB                       FDYNIOR
#01281     MOVE  M8134D-IO-ERCODE1 TO M8134D-STATUS.                    FDYNIOR
#01281     MOVE M8134D-STATUS TO PENGI-CODE0                            EASYT007
#01281     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO M8134D-EZSTATUS.       EASYT007
#01291                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * M8134D - READ I/O INTERFACE ROUTINE                           * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01291 A02470-M8134D-5-READ.                                            EASYT007
#01291                                                                  FDYNIOR
#01291     MOVE 'READ'  TO M8134D-IO-REQUEST                            FDYNIOR
#01291     CALL 'FSDYNIO2' USING M8134D-DYNAM-FIB                       FDYNIOR
#01291     MOVE  M8134D-IO-ERCODE1 TO M8134D-STATUS                     FDYNIOR
#01291     IF M8134D-GOOD-IO                                            FDYNIOR
#01291        MOVE M8134D-IO-AREA TO M8134D-RECORD                      FDYNIOR
#01291     END-IF                                                       FDYNIOR
#01291     IF END-OF-M8134D                                             FDYNIOR
#01291        MOVE '10'    TO M8134D-STATUS                             FDYNIOR
#01291     ELSE                                                         FDYNIOR
#01291     IF NOT M8134D-GOOD-IO                                        FDYNIOR
#01291        DISPLAY M8134D-MESSAGE                                    FDYNIOR
#01291        MOVE 3047 TO WS-PENGI-RETURN                              ABRCODE
#01291        MOVE M8134D-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01291        DISPLAY M8134D-IOM-NAME ': ' M8134D-IO-VSMEMSG            FDYNIOR
#01291        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01291     ELSE                                                         FDYNIOR
#01291     ADD 1 TO M8134D-IO-COUNT.                                    FDYNIOR
#01291                                                                  FDYNIOR
#01291     MOVE M8134D-STATUS TO PENGI-CODE0                            EASYT007
#01291     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO M8134D-EZSTATUS.       EASYT007
#01467                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * SMYFIL2 - WRITE I/O INTERFACE ROUTINE                         * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01467 A02480-SMYFIL2-6-WRITE.                                          EASYT007
#01467                                                                  FDYNIOR
#01467     COMPUTE SMYFIL2-RECORD-TAIL =                                FDYNIOR
#01467             SMYFIL2-RECORD-SIZE  - SMYFIL2-RECORD-KEYE           FDYNIOR
#01467     MOVE 'WRITE'  TO SMYFIL2-IO-REQUEST                          FDYNIOR
#01467     CALL 'FSDYNIO2' USING SMYFIL2-DYNAM-FIB                      FDYNIOR
#01467     MOVE  SMYFIL2-IO-ERCODE1 TO SMYFIL2-STATUS                   FDYNIOR
#01467     ADD 1 TO SMYFIL2-IO-COUNT                                    FDYNIOR
#01467     IF (NOT SMYFIL2-GOOD-IO)                                     FDYNIOR
#01467        DISPLAY SMYFIL2-MESSAGE                                   FDYNIOR
#01467        MOVE 3048 TO WS-PENGI-RETURN                              ABRCODE
#01467        MOVE SMYFIL2-MESSAGE TO ABEND-MESSAGE                     FDYNIOR
#01467        DISPLAY SMYFIL2-IOM-NAME ': ' SMYFIL2-IO-VSMEMSG          FDYNIOR
#01467        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01467     END-IF.                                                      FDYNIOR
#01467                                                                  FDYNIOR
#01467     MOVE SMYFIL2-STATUS TO PENGI-CODE0                           EASYT007
#01467     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SMYFIL2-EZSTATUS.      EASYT007
#01457                                                                  EASYT007
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * BAL-RPT - INTERFACE ROUTINE AND GENERATE MACRO PARAMETERS     * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 A02490-GENERATE-BAL-RPT.                                         EASYT007
#01457     MOVE 'Y' TO WS-JOB2-REPORT2-SW.                              EASYT007
#01457                                                                  GENFILE
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI REPORT2 MAIN LINE INTERFACE ROUTINES.                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457     IF TEMPWK2-IOSW = 'C'                                        GENERATQ
#01457         MOVE 'ALLOC TEMPWK2' TO WS-PENGI-ALLOC-REQ               GENERATQ
#01457         CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC          GENERATQ
#01457         OPEN OUTPUT TEMPWK2                                      GENERATQ
#01457         MOVE 'O' TO TEMPWK2-IOSW                                 GENERATQ
#01457         MOVE ZERO TO TEMPWK2-IO-COUNT                            GENERATQ
#01457         IF NOT TEMPWK2-GOOD-IO                                   GENERATQ
#01457             DISPLAY TEMPWK2-MESSAGE                              GENERATQ
#01457             MOVE 3052 TO WS-PENGI-RETURN                         ABRCODE
#01457             MOVE TEMPWK2-MESSAGE TO ABEND-MESSAGE                GENERATQ
#01457             PERFORM F00000-ABEND-CALL-FSABEC16.                  ABEND00
#01457                                                                  GENERATQ
#01457     PERFORM E01280-REPORT2-BLD-TEMPWK2                           GENERATQ
#01457     ADD 1 TO TEMPWK2-IO-COUNT                                    GENERATQ
#01457     WRITE TEMPWK2-RECORD                                         GENERATQ
#01457     IF NOT TEMPWK2-GOOD-IO                                       GENERATQ
#01457        DISPLAY TEMPWK2-MESSAGE                                   GENERATQ
#01457        MOVE 3053 TO WS-PENGI-RETURN                              ABRCODE
#01457        MOVE TEMPWK2-MESSAGE TO ABEND-MESSAGE                     GENERATQ
#01457        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01457     END-IF.                                                      GENERATQ
#01467                                                                  EASYT007
#01467 A02500-GENERATE-BAL-RPT-EXIT. EXIT.                              EASYT007
#01472***************************************************************** EASYT007
#01472* JOB3 FILE MATCH: READ LOOP.                                   * EASYT007
#01472***************************************************************** EASYT007
#01472 A03010-JOB3-READ.                                                EASYT007
      *,EXIT IF STOP/STOP EXECUTE TO PREVENT AN EXTRA READ
#01472     IF (NOT JOB3-REQUEST-STOP)                                   EASYT007
#01472         PERFORM A03020-JOB3-READ-NEXT                            EASYT007
#01472     END-IF.                                                      EASYT007
#01472                                                                  EASYT007
#01472***************************************************************** EASYT007
#01472* JOB3 FILE MATCH:                                              * EASYT007
#01472* SYNCHRONIZED FILE PROCESSING LOGIC AND ROUTINES.              * EASYT007
#01472***************************************************************** EASYT007
#01472 A03020-JOB3-READ-NEXT.                                           EASYT007
#01472     IF JOB3-PENDING                                              EASYT007
#01472         MOVE SMYFIL-STATUS TO PENGI-CODE0                        EASYT007
#01472         MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SMYFIL-EZSTATUS    EASYT007
#01472         MOVE SMYFIL2-STATUS TO PENGI-CODE0                       EASYT007
#01472         MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SMYFIL2-EZSTATUS   EASYT007
#01472         GO TO A03030-JOB3-RUN                                    EASYT007
#01472     ELSE                                                         EASYT007
#01472     IF JOB3-STOP-JOB                                             EASYT007
#01472         MOVE ZERO TO WS-JOB3-FLAG                                EASYT007
#01472         MOVE LOW-VALUES TO MATCH1-FLAG-AREAS                     EASYT007
#01472     ELSE                                                         EASYT007
#01472         MOVE SPACES TO MATCH1-SELECT-FLAGS                       EASYT007
#01472         MOVE ZERO TO WS-JOB3-FLAG.                               EASYT007
#01472                                                                  EASYT007
#01472***************************************************************** EASYT007
#01472* JOB3 FILE MATCH:                                              * EASYT007
#01472* SYNCHRONIZED FILE JOB PROCESSING MAIN LOGIC ROUTINE.          * EASYT007
#01472***************************************************************** EASYT007
#01472 A03030-JOB3-RUN.                                                 EASYT007
#01474     IF MATCH1-ALL-MATCHED                                        EASYT007
#01475        IF SMY-CRITERIA = 00002                                   EASYT007
#01476           COMPUTE ACC-PER-TYPE =                                 EASYT007
#01476               ACC-PER-TYPE + ACC-PER-TYPE2                       EASYT007
#01477           PERFORM A03050-MOVE-SMYFIL                             EASYT007
#01477              THRU A03060-MOVE-SMYFIL-EXIT                        EASYT007
#01478        ELSE                                                      EASYT007
#01479           MOVE SMY-TYPE TO DLN-0029-SMY-TYPE                     EASYT007
#01479           MOVE SMY-BRANCH TO DLN-0029-SMY-BRANCH                 EASYT007
#01479           MOVE SMY-CRITERIA TO DLN-0029-SMY-CRITERIA             EASYT007
#01479           ADD 1 TO SYSPRINT-IO-COUNT                             EASYT007
#01479           WRITE SYSPRINT-RECORD  FROM DLN-0029                   EASYT007
#01479                   AFTER ADVANCING 1                              EASYT007
#01479           MOVE SYSPRINT-STATUS TO PENGI-CODE0                    EASYT007
#01479           MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUSEASYT007
#01480        END-IF                                                    EASYT007
#01481        MOVE 1 TO WS-JOB3-FLAG                                    EASYT007
#01481        GO TO A03010-JOB3-READ                                    EASYT007
#01482     END-IF                                                       EASYT007
#01484     IF MATCH1-SMYFIL-SELECTED                                    EASYT007
#01485        PERFORM A03050-MOVE-SMYFIL                                EASYT007
#01485           THRU A03060-MOVE-SMYFIL-EXIT                           EASYT007
#01486        MOVE 1 TO WS-JOB3-FLAG                                    EASYT007
#01486        GO TO A03010-JOB3-READ                                    EASYT007
#01487     END-IF                                                       EASYT007
#01489     IF MATCH1-SMYFIL2-SELECTED                                   EASYT007
#01490        PERFORM A03070-MOVE-SMYFIL2                               EASYT007
#01490           THRU A03080-MOVE-SMYFIL2-EXIT                          EASYT007
#01491        MOVE 1 TO WS-JOB3-FLAG                                    EASYT007
#01491        GO TO A03010-JOB3-READ                                    EASYT007
#01492     END-IF                                                       EASYT007
#01494     ADD 1 TO SYSPRINT-IO-COUNT                                   EASYT007
#01494     WRITE SYSPRINT-RECORD  FROM DLN-0030                         EASYT007
#01494             AFTER ADVANCING 1                                    EASYT007
#01494     MOVE SYSPRINT-STATUS TO PENGI-CODE0                          EASYT007
#01494     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO SYSPRINT-EZSTATUS.     EASYT007
#01494                                                                  EASYT007
#01496 A03040-AUTO-GENERATE-READ.                                       EASYT007
#01496     MOVE 1 TO WS-JOB3-FLAG                                       EASYT007
#01496     GO TO A03010-JOB3-READ.                                      EASYT007
#01496                                                                  EASYT007
#01496*-*************************************************************** EASYT007
#01496* JOB3 PROC NAME: MOVE-SMYFIL                                   * EASYT007
#01496***************************************************************** EASYT007
#01496 A03050-MOVE-SMYFIL.                                              EASYT007
#01497     MOVE SMY-CRITERIA (1: 5) TO WS-PENGI-MOVE-G                  EASYT007
#01497     IF (WS-PENGI-MOVE-G (1: 5) = SPACES)                         EASYT007
#01497        MOVE ZEROS TO EXT-CRITERIA                                EASYT007
#01497     ELSE                                                         EASYT007
#01497        MOVE SMY-CRITERIA  TO EXT-CRITERIA                        EASYT007
#01497     END-IF                                                       EASYT007
#01498     MOVE SMY-BANK (1: 2) TO WS-PENGI-MOVE-G                      EASYT007
#01498     IF (WS-PENGI-MOVE-G (1: 2) = SPACES)                         EASYT007
#01498        MOVE ZEROS TO EXT-BANK                                    EASYT007
#01498     ELSE                                                         EASYT007
#01498        MOVE SMY-BANK  TO EXT-BANK                                EASYT007
#01498     END-IF                                                       EASYT007
#01499     MOVE SMY-BRANCH (1: 5) TO WS-PENGI-MOVE-G                    EASYT007
#01499     IF (WS-PENGI-MOVE-G (1: 5) = SPACES)                         EASYT007
#01499        MOVE ZEROS TO EXT-BRANCH                                  EASYT007
#01499     ELSE                                                         EASYT007
#01499        MOVE SMY-BRANCH  TO EXT-BRANCH                            EASYT007
#01499     END-IF                                                       EASYT007
#01500     MOVE SMY-TYPE TO EXT-TYPE                                    EASYT007
#01501     MOVE SMY-DATE (1: 6) TO WS-PENGI-MOVE-G                      EASYT007
#01501     IF (WS-PENGI-MOVE-G (1: 6) = SPACES)                         EASYT007
#01501        MOVE ZEROS TO EXT-DATE                                    EASYT007
#01501     ELSE                                                         EASYT007
#01501        MOVE SMY-DATE  TO EXT-DATE                                EASYT007
#01501     END-IF                                                       EASYT007
#01502     MOVE ACC-PER-TYPE  TO EXT-COUNT                              EASYT007
#01504     IF (EXT-CRITERIA = 10058 OR 10041)                           EASYT007
#01505        MOVE SMY-AMOUNT  TO EXT-AMOUNT                            EASYT007
#01506     END-IF                                                       EASYT007
#01508     IF EXT-COUNT NOT = ZEROS                                     EASYT007
#01509        PERFORM A03100-ME7231-1-WRITE                             EASYT007
#01510     END-IF.                                                      EASYT007
#01510                                                                  EASYT007
#01511 A03060-MOVE-SMYFIL-EXIT. EXIT.                                   EASYT007
#01513                                                                  EASYT007
#01513*-*************************************************************** EASYT007
#01513* JOB3 PROC NAME: MOVE-SMYFIL2                                  * EASYT007
#01513***************************************************************** EASYT007
#01513 A03070-MOVE-SMYFIL2.                                             EASYT007
#01514     MOVE SMY2-CRITERIA (1: 5) TO WS-PENGI-MOVE-G                 EASYT007
#01514     IF (WS-PENGI-MOVE-G (1: 5) = SPACES)                         EASYT007
#01514        MOVE ZEROS TO EXT-CRITERIA                                EASYT007
#01514     ELSE                                                         EASYT007
#01514        MOVE SMY2-CRITERIA  TO EXT-CRITERIA                       EASYT007
#01514     END-IF                                                       EASYT007
#01515     MOVE SMY2-BANK (1: 2) TO WS-PENGI-MOVE-G                     EASYT007
#01515     IF (WS-PENGI-MOVE-G (1: 2) = SPACES)                         EASYT007
#01515        MOVE ZEROS TO EXT-BANK                                    EASYT007
#01515     ELSE                                                         EASYT007
#01515        MOVE SMY2-BANK  TO EXT-BANK                               EASYT007
#01515     END-IF                                                       EASYT007
#01516     MOVE SMY2-BRANCH (1: 5) TO WS-PENGI-MOVE-G                   EASYT007
#01516     IF (WS-PENGI-MOVE-G (1: 5) = SPACES)                         EASYT007
#01516        MOVE ZEROS TO EXT-BRANCH                                  EASYT007
#01516     ELSE                                                         EASYT007
#01516        MOVE SMY2-BRANCH  TO EXT-BRANCH                           EASYT007
#01516     END-IF                                                       EASYT007
#01517     MOVE SMY2-TYPE TO EXT-TYPE                                   EASYT007
#01518     MOVE SMY2-DATE (1: 6) TO WS-PENGI-MOVE-G                     EASYT007
#01518     IF (WS-PENGI-MOVE-G (1: 6) = SPACES)                         EASYT007
#01518        MOVE ZEROS TO EXT-DATE                                    EASYT007
#01518     ELSE                                                         EASYT007
#01518        MOVE SMY2-DATE  TO EXT-DATE                               EASYT007
#01518     END-IF                                                       EASYT007
#01519     MOVE ACC-PER-TYPE2  TO EXT-COUNT                             EASYT007
#01521     IF (EXT-CRITERIA = 10058 OR 10041)                           EASYT007
#01522        MOVE SMY2-AMOUNT  TO EXT-AMOUNT                           EASYT007
#01523     END-IF                                                       EASYT007
#01525     IF EXT-COUNT NOT = ZEROS                                     EASYT007
#01526        PERFORM A03100-ME7231-1-WRITE                             EASYT007
#01527     END-IF.                                                      EASYT007
#01527                                                                  EASYT007
#01528 A03080-MOVE-SMYFIL2-EXIT. EXIT.                                  EASYT007
#01472                                                                  EASYT007
#01472***************************************************************** EASYT007
#01472* JOB3 FILE OPEN ROUTINE                                        * EASYT007
#01472***************************************************************** EASYT007
#01472 A03090-JOB3-OPEN.                                                EASYT007
#01472     MOVE '00' TO SYNCF3-STATUS.                                  EASYT007
#01529     MOVE 'ALLOC SYSPRINT' TO WS-PENGI-SYSOUT-REQ                 EASYT007
#01529     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             EASYT007
#01529     COMPUTE SYSPRINT-RECORD-SIZE =                               EASYT007
#01529               (SYSPRINT-RECORD-GSIZ + 1)                         EASYT007
#01529     MOVE '00' TO SYSPRINT-STATUS                                 MCCGIOR
#01529     OPEN OUTPUT SYSPRINT                                         MCCGIOR
#01529     MOVE 'O'     TO SYSPRINT-IOSW                                MCCGIOR
#01529     MOVE 'Y'     TO SYSPRINT-ACCEPT-FLAG                         MCCGIOR
#01529     MOVE ZERO    TO SYSPRINT-IO-COUNT                            MCCGIOR
#01529     IF NOT SYSPRINT-GOOD-OPEN                                    MCCGIOR
#01529        DISPLAY SYSPRINT-MESSAGE                                  MCCGIOR
#01529        MOVE 3055 TO WS-PENGI-RETURN                              ABRCODE
#01529        MOVE SYSPRINT-MESSAGE TO ABEND-MESSAGE                    MCCGIOR
#01529        PERFORM F00000-ABEND-CALL-FSABEC16.                       ABEND00
#01529                                                                  MCCGIOR
#01529     MOVE SYSPRINT-RECORD-GSIZ TO SYSPRINT-RECORD-SIZE.           MCCGIOR
#01529                                                                  MCCGIOR
#01529* ME7231 OPEN ROUTINE                                             FDYNIOR
#01529     MOVE 'OPEN'  TO ME7231-IO-REQUEST                            FDYNIOR
#01529     MOVE 'OUTPUT'  TO ME7231-IO-REQTYPE                          FDYNIOR
#01529     CALL 'FSDYNIO1' USING ME7231-DYNAM-FIB                       FDYNIOR
#01529     MOVE  ME7231-IO-ERCODE1 TO ME7231-STATUS                     FDYNIOR
#01529     MOVE 'O'     TO ME7231-IOSW                                  FDYNIOR
#01529     MOVE 'Y'     TO ME7231-ACCEPT-FLAG                           FDYNIOR
#01529     MOVE ZERO    TO ME7231-IO-COUNT                              FDYNIOR
#01529     IF (NOT ME7231-GOOD-IO)                                      FDYNIOR
#01529        DISPLAY ME7231-MESSAGE                                    FDYNIOR
#01529        MOVE 3056 TO WS-PENGI-RETURN                              ABRCODE
#01529        MOVE ME7231-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01529        DISPLAY ME7231-IOM-NAME ': ' ME7231-IO-VSMEMSG            FDYNIOR
#01529        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01529     END-IF.                                                      FDYNIOR
#01529     SET ADDRESS OF ME7231-IO-AREA TO ME7231-IOAREA-PTR           FDYNIOR
#01529     CALL 'FSDYNPTR' USING  ME7231-DYNAM-FIB                      FDYNIOR
#01529     SET ADDRESS OF ME7231-RECORD  TO ME7231-RECORD-PTR           FDYNIOR
#01529     MOVE SPACES TO ME7231-RECORD.                                FDYNIOR
#01529     INITIALIZE ME7231-GRECORD.                                   FDYNIOR
#01529                                                                  FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * ME7231 - WRITE I/O INTERFACE ROUTINE                          * GENCTEXT
      *                                                               * GENCTEXT
      * USER FDYNIOR MACRO EXPANDED INTERFACE LOGIC                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01509 A03100-ME7231-1-WRITE.                                           EASYT007
#01509                                                                  FDYNIOR
#01509     COMPUTE ME7231-RECORD-TAIL =                                 FDYNIOR
#01509             ME7231-RECORD-SIZE  - ME7231-RECORD-KEYE             FDYNIOR
#01509     IF ME7231-RECORD-SIZE > ME7231-RECORD-GSIZ                   FDYNIOR
#01509        COMPUTE ME7231-RECORD-VEND =                              FDYNIOR
#01509                ME7231-RECORD-SIZE  - ME7231-RECORD-GSIZ          FDYNIOR
#01509     ELSE                                                         FDYNIOR
#01509        MOVE 0 TO ME7231-RECORD-VEND                              FDYNIOR
#01509     END-IF                                                       FDYNIOR
#01509     MOVE ME7231-RECORD TO ME7231-IO-AREA                         FDYNIOR
#01509     MOVE 'WRITE'  TO ME7231-IO-REQUEST                           FDYNIOR
#01509     CALL 'FSDYNIO2' USING ME7231-DYNAM-FIB                       FDYNIOR
#01509     MOVE  ME7231-IO-ERCODE1 TO ME7231-STATUS                     FDYNIOR
#01509     ADD 1 TO ME7231-IO-COUNT                                     FDYNIOR
#01509     IF (NOT ME7231-GOOD-IO)                                      FDYNIOR
#01509        DISPLAY ME7231-MESSAGE                                    FDYNIOR
#01509        MOVE 3057 TO WS-PENGI-RETURN                              ABRCODE
#01509        MOVE ME7231-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01509        DISPLAY ME7231-IOM-NAME ': ' ME7231-IO-VSMEMSG            FDYNIOR
#01509        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01509     END-IF.                                                      FDYNIOR
#01509                                                                  FDYNIOR
#01509     MOVE ME7231-STATUS TO PENGI-CODE0                            EASYT007
#01509     MOVE PENGI-CODES (PENGI-CODE0 + 1) TO ME7231-EZSTATUS.       EASYT007
                                                                        <4G#OOG>
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * FUNCTION   = CON-DLN-0013-CHR                                 * GENCTEXT
      * RETURN CODE: RC-CON-DLN-0013-CHR                              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00573 B00000-CON-DLN-0013-CHR.                                         FUNCTION
           MOVE 0 TO RC-CON-DLN-0013-CHR.                               CONSTRUC
                                                                        CONSTRUC
           IF DLN-0013-W-OBLIGOR-S NOT = SPACES                         REPCHR0
              MOVE '-' TO DLN-0013-W-OBLIGOR-S (4:1)                    REPCHR0
              MOVE '-' TO DLN-0013-W-OBLIGOR-S (8:1)                    REPCHR0
              MOVE '-' TO DLN-0013-W-OBLIGOR-S (12:1)                   REPCHR0
           END-IF                                                       REPCHR0
                                                                        REPCHR0
           ADD RC-REPCHR0 TO RC-CON-DLN-0013-CHR.                       CONSTRUC
                                                                        CONSTRUC
           IF DLN-0013-W-OBLIGAT-S NOT = SPACES                         REPCHR0
              MOVE '-' TO DLN-0013-W-OBLIGAT-S (6:1)                    REPCHR0
              MOVE '-' TO DLN-0013-W-OBLIGAT-S (11:1)                   REPCHR0
           END-IF                                                       REPCHR0
                                                                        REPCHR0
           ADD RC-REPCHR0 TO RC-CON-DLN-0013-CHR.                       CONSTRUC
                                                                        <4G#OOG>
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * FUNCTION   = CON-DLN-0023-CHR                                 * GENCTEXT
      * RETURN CODE: RC-CON-DLN-0023-CHR                              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00789 B00010-CON-DLN-0023-CHR.                                         FUNCTION
           MOVE 0 TO RC-CON-DLN-0023-CHR.                               CONSTRUC
                                                                        CONSTRUC
           IF DLN-0023-W-OBLIGOR-S NOT = SPACES                         REPCHR0
              MOVE '-' TO DLN-0023-W-OBLIGOR-S (4:1)                    REPCHR0
              MOVE '-' TO DLN-0023-W-OBLIGOR-S (8:1)                    REPCHR0
              MOVE '-' TO DLN-0023-W-OBLIGOR-S (12:1)                   REPCHR0
           END-IF                                                       REPCHR0
                                                                        REPCHR0
           ADD RC-REPCHR0 TO RC-CON-DLN-0023-CHR.                       CONSTRUC
                                                                        CONSTRUC
           IF DLN-0023-W-OBLIGAT-S NOT = SPACES                         REPCHR0
              MOVE '-' TO DLN-0023-W-OBLIGAT-S (6:1)                    REPCHR0
              MOVE '-' TO DLN-0023-W-OBLIGAT-S (11:1)                   REPCHR0
           END-IF                                                       REPCHR0
                                                                        REPCHR0
           ADD RC-REPCHR0 TO RC-CON-DLN-0023-CHR.                       CONSTRUC
                                                                        <4G#OOG>
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * FUNCTION   = CON-DLN-0026-CHR                                 * GENCTEXT
      * RETURN CODE: RC-CON-DLN-0026-CHR                              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       B00020-CON-DLN-0026-CHR.                                         FUNCTION
           MOVE 0 TO RC-CON-DLN-0026-CHR.                               CONSTRUC
                                                                        CONSTRUC
           IF DLN-0026-W-OBLIGOR-S NOT = SPACES                         REPCHR0
              MOVE '-' TO DLN-0026-W-OBLIGOR-S (4:1)                    REPCHR0
              MOVE '-' TO DLN-0026-W-OBLIGOR-S (8:1)                    REPCHR0
              MOVE '-' TO DLN-0026-W-OBLIGOR-S (12:1)                   REPCHR0
           END-IF                                                       REPCHR0
                                                                        REPCHR0
           ADD RC-REPCHR0 TO RC-CON-DLN-0026-CHR.                       CONSTRUC
                                                                        CONSTRUC
           IF DLN-0026-W-OBLIGAT-S NOT = SPACES                         REPCHR0
              MOVE '-' TO DLN-0026-W-OBLIGAT-S (6:1)                    REPCHR0
              MOVE '-' TO DLN-0026-W-OBLIGAT-S (11:1)                   REPCHR0
           END-IF                                                       REPCHR0
                                                                        REPCHR0
           ADD RC-REPCHR0 TO RC-CON-DLN-0026-CHR.                       CONSTRUC
                                                                        <4G#OOG>
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * FUNCTION   = CON-DLN-0028-CHR                                 * GENCTEXT
      * RETURN CODE: RC-CON-DLN-0028-CHR                              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       B00030-CON-DLN-0028-CHR.                                         FUNCTION
           MOVE 0 TO RC-CON-DLN-0028-CHR.                               CONSTRUC
                                                                        CONSTRUC
           IF DLN-0028-GREGORIAN-S NOT = SPACES                         REPCHR0
              MOVE '-' TO DLN-0028-GREGORIAN-S (3:1)                    REPCHR0
              MOVE '-' TO DLN-0028-GREGORIAN-S (6:1)                    REPCHR0
           END-IF                                                       REPCHR0
                                                                        REPCHR0
           ADD RC-REPCHR0 TO RC-CON-DLN-0028-CHR.                       CONSTRUC
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI - GLCODES COMMON POINT ROUTINE.                         * GENCTEXT
      * ROUTINE LOCATES GLCODES-QAREA IN THE TABLE, IDENTIFIED        * GENCTEXT
      * BY THE GLCODES-KEY FIELD.                                     * GENCTEXT
      *                                                               * GENCTEXT
      * THE ROW NUMBER IS RETURNED IN THE GLCODES-CROW.               * GENCTEXT
      * THE GLCODES-STATUS IS SET AS FOLLOWS:                         * GENCTEXT
      *   00 = GLCODES-KEY WAS FOUND                                  * GENCTEXT
      *        GLCODES-CROW IS SET TO CURRENT SLOT                    * GENCTEXT
      *   23 = GLCODES-KEY DOES NOT EXIST:                            * GENCTEXT
      *        GLCODES-CROW IS SET THE 1ST AVAILABLE ROW              * GENCTEXT
      *        FOR DIRECT AND SEQUENTIAL SEARCH, AND TO               * GENCTEXT
      *        GLCODES-FROW FOR BINARY SEARCH METHOD                  * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00731 C00000-GLCODES-POINT.                                            TBSERV1
#00731     MOVE '23' TO GLCODES-STATUS                                  TBSERV1
#00731     MOVE GLCODES-FROW TO GLCODES-CROW                            TBSERV1
#00731     SEARCH ALL GLCODES-QAREA-GPFIELDS                            TBSERV1
#00731         AT END CONTINUE                                          TBSERV1
#00731       WHEN WT1-ARG (GLCODES-INDEX0) = ARG                        TBSERV1
#00731            SET GLCODES-CROW TO GLCODES-INDEX0                    TBSERV1
#00731            MOVE '00' TO GLCODES-STATUS                           TBSERV1
#00731     END-SEARCH.                                                  TBSERV1
#00731                                                                  TBSERV1
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI - GLCODES OPEN ROUTINE.                                 * GENCTEXT
      *                                                               * GENCTEXT
      * THE GLCODES-STATUS IS SET AS FOLLOWS:                         * GENCTEXT
      *   93 = TABLE IS ALREADY OPENED                                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00787 C00010-GLCODES-TBCLR.                                            TBSERV1
#00787     IF GLCODES-IOSW NOT = 'O'                                    TBSERV1
#00787         PERFORM C00040-GLCODES-CLEAR.                            TBSERV1
#00787                                                                  TBSERV1
#00787 C00020-GLCODES-OPEN.                                             TBSERV1
#00787     IF GLCODES-IOSW = 'O'                                        TBSERV1
#00787         MOVE '93'    TO GLCODES-STATUS                           TBSERV1
#00787         MOVE 'OPEN'  TO  GLCODES-FUNCTION                        TBSERV1
#00787         PERFORM C00030-GLCODES-ERROR.                            TBSERV1
#00787                                                                  TBSERV1
#00787     MOVE 'O'     TO GLCODES-IOSW                                 TBSERV1
#00787     MOVE '00'    TO GLCODES-STATUS                               TBSERV1
#00787     MOVE ZEROS   TO GLCODES-IO-COUNT                             TBSERV1
#00787     MOVE ZEROS   TO GLCODES-CROW.                                TBSERV1
#00787                                                                  TBSERV1
#00787 C00030-GLCODES-ERROR.                                            TBSERV1
#00787     DISPLAY GLCODES-MESSAGE                                      TBSERV1
#00787     DISPLAY '    REQUEST: ' GLCODES-FUNCTION                     TBSERV1
#00787     DISPLAY 'CURRENT ROW: ' GLCODES-CROW                         TBSERV1
#00787     DISPLAY 'CURRENT KEY *'                                      TBSERV1
#00787     DISPLAY 'ARG: '  ARG                                         TBSERV1
#00787     MOVE 3029 TO WS-PENGI-RETURN                                 ABRCODE
#00787     MOVE SPACES TO ABEND-MESSAGE                                 TBSERV1
#00787     IF GLCODES-STATUS = '20'                                     TBSERV1
#00787        MOVE 'GLCODES TABLE IS FULL' TO ABEND-MESSAGE             TBSERV1
#00787     END-IF                                                       TBSERV1
#00787     IF GLCODES-STATUS = '93'                                     TBSERV1
#00787        MOVE 'RECURSIVE OPEN FOR GLCODES' TO ABEND-MESSAGE        TBSERV1
#00787     END-IF                                                       TBSERV1
#00787     PERFORM F00000-ABEND-CALL-FSABEC16.                          ABEND00
#00787                                                                  TBSERV1
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI - GLCODES CLEAR ROUTINE CLEARS THE ENTIRE TABLE         * GENCTEXT
      * AS DEFINED IN THE GLCODES-QAREA-DUMMY AREA.                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00787 C00040-GLCODES-CLEAR.                                            TBSERV1
#00787* NOTE: ALL FIELDS ARE OF STATIC NATURE THEREFORE WE DO NOT CLEAR TBSERV1
#00787     MOVE ZERO TO GLCODES-CROW.                                   TBSERV1
#01472                                                                  EXTRACT
#01472     EJECT                                                        EXTRACT
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 FILE-SCAN MAIN LINE LOGIC.                       * GENCTEXT
      *                                                               * GENCTEXT
      * SYNCHRONIZED FILE PROCESSING LOGIC.                           * GENCTEXT
      *                                                               * GENCTEXT
      * THIS LOGIC SELECTS ALL RECORDS FROM ALL FILES. THE            * GENCTEXT
      * FIELDS IN THE OUTPUT RECORD ARE CONSTRUCTED FROM ONE          * GENCTEXT
      * OR MORE FILES OF IDENTICAL (EQUAL) KEY.                       * GENCTEXT
      *                                                               * GENCTEXT
      * PLEASE NOTE: THE FILES ARE READ 1 RECORD IN ADVANCE           * GENCTEXT
      * IN ORDER TO DETERIMINE THE DUPLICATE STATUS FLAG.             * GENCTEXT
      *                                                               * GENCTEXT
      * THE FOLLOWING TESTS ARE AVAILABLE IN THE OUTPUT ROUTINE       * GENCTEXT
      * (DDNAME = FILE FILE DDNAME):                                  * GENCTEXT
      *                                                               * GENCTEXT
      *    END-OF-DDNAME =============> END OF FILE                   * GENCTEXT
      *    MATCH1-DDNAME-1ST =========> FIRST DUP RECORD              * GENCTEXT
      *    MATCH1-DDNAME-DUP =========> DUPLICATE RECORD              * GENCTEXT
      *    MATCH1-DDNAME-LAST ========> LAST DUP RECORD               * GENCTEXT
      *    MATCH1-DDNAME-SELECTED ====> RECORD IS PRESENT             * GENCTEXT
      *    MATCH1-DDNAME-ALL-MATCHED => ALL FILES MATCH               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00000-MATCH1-MAIN-LINE.                                         EXTRACT
#01472     MOVE SPACES TO MATCH1-FLAG-AREAS.                            EXTRACT
#01472*---------------------------------------------------------------* EXTRACT
#01472* THIS ROUTINE WILL DO THE FOLLOWING:                           * EXTRACT
#01472*                                                               * EXTRACT
#01472* A. DETERMINE THE OLD (LOWEST KEY OF ALL FILES IN PROCESS)     * EXTRACT
#01472* B. MARK EACH FILE RECORD AS "ACCEPTED" OR "NOT ACCEPTED".     * EXTRACT
#01472* C. SET ALL OTHER FLAGS AS PER FILE-SCAN REQ FOR EACH FILE.    * EXTRACT
#01472* D. INVOKE OUTPUT EXIT WITH PROCESSING LOGIC AS CODED.         * EXTRACT
#01472*                                                               * EXTRACT
#01472* NOTE: WE COME HERE ONLY 1ST TIME THRU AND WHEN SCAN IS        * EXTRACT
#01472*       TERMINATED DUE TO ALL RECORDS PROCESSED FOR THE         * EXTRACT
#01472*       CURRENT LOWEST KEY, I.E. THE EXISTING RECORDS OF        * EXTRACT
#01472*       ALL FILES ARE SCHEDULED FOR A NEW SCAN.                 * EXTRACT
#01472*---------------------------------------------------------------* EXTRACT
#01472     MOVE SPACES TO MATCH1-SMYFIL2-SYNCH                          EXTRACT
#01472     IF NOT END-OF-SMYFIL2                                        EXTRACT
#01472         PERFORM D00120-MATCH1-SMYFIL2-SETOLD                     EXTRACT
#01472         MOVE 'A' TO MATCH1-SMYFIL2-ACCEPT-FLAG                   EXTRACT
#01472     END-IF.                                                      EXTRACT
#01472                                                                  EXTRACT
#01472     MOVE SPACES TO MATCH1-SMYFIL-SYNCH                           EXTRACT
#01472     IF NOT END-OF-SMYFIL                                         EXTRACT
#01472        IF MATCH1-FLAG-AREAS = SPACES                             EXTRACT
#01472           PERFORM D00130-MATCH1-SMYFIL-SETOLD                    EXTRACT
#01472           MOVE 'A' TO MATCH1-SMYFIL-ACCEPT-FLAG                  EXTRACT
#01472        ELSE                                                      EXTRACT
#01472        PERFORM D00110-MATCH1-SMYFIL-SETNEW                       EXTRACT
#01472        PERFORM D00010-MATCH1-COMPARE-KEY                         EXTRACT
#01472        IF MATCH1-OLD-HIGH                                        EXTRACT
#01472           MOVE SPACES TO MATCH1-FLAG-AREAS                       EXTRACT
#01472           PERFORM D00130-MATCH1-SMYFIL-SETOLD                    EXTRACT
#01472           MOVE 'A' TO MATCH1-SMYFIL-ACCEPT-FLAG                  EXTRACT
#01472        ELSE                                                      EXTRACT
#01472        IF MATCH1-OLD-EQ-NEW                                      EXTRACT
#01472           MOVE 'A' TO MATCH1-SMYFIL-ACCEPT-FLAG.                 EXTRACT
#01472                                                                  EXTRACT
#01472     IF MATCH1-SMYFIL2-ACCEPTED                                   EXTRACT
#01472        MOVE MATCH1-SMYFIL2-SYNCH2 TO MATCH1-SMYFIL2-SYNCH        EXTRACT
#01472     END-IF.                                                      EXTRACT
#01472                                                                  EXTRACT
#01472     IF MATCH1-SMYFIL-ACCEPTED                                    EXTRACT
#01472        MOVE MATCH1-SMYFIL-SYNCH2 TO MATCH1-SMYFIL-SYNCH          EXTRACT
#01472     END-IF.                                                      EXTRACT
#01472                                                                  EXTRACT
#01472     MOVE SPACES TO MATCH1-ALL-MATCH-FLAG.                        EXTRACT
#01472                                                                  EXTRACT
#01472     IF MATCH1-FLAG-AREAS NOT = SPACES                            EXTRACT
#01472        IF MATCH1-SMYFIL2-ACCEPTED                                EXTRACT
#01472        AND MATCH1-SMYFIL-ACCEPTED                                EXTRACT
#01472           MOVE 'Y' TO MATCH1-ALL-MATCH-FLAG                      EXTRACT
#01472        END-IF                                                    EXTRACT
#01472        MOVE MATCH1-ALL-MATCH-FLAG  TO MATCH1-ALL-MATCH-SAVE      EXTRACT
#01472        PERFORM D00080-MATCH1-BUILD-OUTPUT                        EXTRACT
#01472     END-IF.                                                      EXTRACT
#01472                                                                  EXTRACT
#01472*---------------------------------------------------------------* EXTRACT
#01472* AT THIS TIME, THE SCAN WAS PROCESSED FOR THE FILE RECORDS     * EXTRACT
#01472* THAT MATCHED THE LOWEST FILE KEY.                             * EXTRACT
#01472*                                                               * EXTRACT
#01472* THE FOLLOWING ROUTINES WILL RUN OUT ALL DUPLICATES FOR EACH   * EXTRACT
#01472* FILE THAT WAS ACCEPTED IN THE PREVIOUS SATISFIED SCAN UNTIL   * EXTRACT
#01472* EOF OR A RECORD IS READ WITH THE KEY UNEQUAL TO THE OLD KEY.  * EXTRACT
#01472*                                                               * EXTRACT
#01472* AS EACH FILE IS PROCESSED, THE FLAGS FOR ALL OTHER FILES WILL * EXTRACT
#01472* REMAIN UNCHANGED AND PASSED TO THE OUTPUT SCAN ROUTINE.       * EXTRACT
#01472*                                                               * EXTRACT
#01472* THIS MEANS THAT RECORDS ON OTHER FILES MIGHT BE PASSED ON     * EXTRACT
#01472* TO THE SCAN ROUTINE MULTIPLE TIMES IF DUPLICATES EXIST.       * EXTRACT
#01472*---------------------------------------------------------------* EXTRACT
#01472                                                                  EXTRACT
#01472     SET MATCH1-OLD-EQ-NEW TO TRUE                                EXTRACT
#01472     IF MATCH1-SMYFIL2-ACCEPTED                                   EXTRACT
#01472     AND NOT END-OF-SMYFIL2                                       EXTRACT
#01472        PERFORM UNTIL END-OF-SMYFIL2                              EXTRACT
#01472                   OR NOT MATCH1-SMYFIL2-ACCEPTED                 EXTRACT
#01472           PERFORM D00020-MATCH1-READ-SMYFIL2                     EXTRACT
#01472           MOVE SPACE TO MATCH1-SMYFIL2-ACCEPT-FLAG               EXTRACT
#01472           IF NOT END-OF-SMYFIL2                                  EXTRACT
#01472              PERFORM D00100-MATCH1-SMYFIL2-SETNEW                EXTRACT
#01472              PERFORM D00010-MATCH1-COMPARE-KEY                   EXTRACT
#01472              IF MATCH1-OLD-EQ-NEW                                EXTRACT
#01472                 MOVE MATCH1-SMYFIL2-SYNCH2                       EXTRACT
#01472                      TO MATCH1-SMYFIL2-SYNCH                     EXTRACT
#01472                 MOVE 'A' TO MATCH1-SMYFIL2-ACCEPT-FLAG           EXTRACT
#01472                 MOVE MATCH1-ALL-MATCH-SAVE                       EXTRACT
#01472                   TO MATCH1-ALL-MATCH-FLAG                       EXTRACT
#01472                 PERFORM D00080-MATCH1-BUILD-OUTPUT               EXTRACT
#01472              ELSE                                                EXTRACT
#01472                 MOVE SPACES TO MATCH1-SMYFIL2-SYNCH              EXTRACT
#01472              END-IF                                              EXTRACT
#01472           END-IF                                                 EXTRACT
#01472        END-PERFORM                                               EXTRACT
#01472        MOVE SPACES TO MATCH1-ALL-MATCH-SAVE                      EXTRACT
#01472     END-IF.                                                      EXTRACT
#01472                                                                  EXTRACT
#01472* END OF FILE MUST ALWAYS BE TAGGED WITH CORRECT FLAGS.           EXTRACT
#01472     IF END-OF-SMYFIL2                                            EXTRACT
#01472         MOVE SPACES    TO MATCH1-SMYFIL2-SYNCH                   EXTRACT
#01472         MOVE SPACES    TO MATCH1-SMYFIL2-SYNCH2                  EXTRACT
#01472         MOVE LOW-VALUE TO MATCH1-SMYFIL2-ACCEPT-FLAG             EXTRACT
#01472     END-IF.                                                      EXTRACT
#01472                                                                  EXTRACT
#01472     SET MATCH1-OLD-EQ-NEW TO TRUE                                EXTRACT
#01472     IF MATCH1-SMYFIL-ACCEPTED                                    EXTRACT
#01472     AND NOT END-OF-SMYFIL                                        EXTRACT
#01472        PERFORM UNTIL END-OF-SMYFIL                               EXTRACT
#01472                   OR NOT MATCH1-SMYFIL-ACCEPTED                  EXTRACT
#01472           PERFORM D00040-MATCH1-READ-SMYFIL                      EXTRACT
#01472           MOVE SPACE TO MATCH1-SMYFIL-ACCEPT-FLAG                EXTRACT
#01472           IF NOT END-OF-SMYFIL                                   EXTRACT
#01472              PERFORM D00110-MATCH1-SMYFIL-SETNEW                 EXTRACT
#01472              PERFORM D00010-MATCH1-COMPARE-KEY                   EXTRACT
#01472              IF MATCH1-OLD-EQ-NEW                                EXTRACT
#01472                 MOVE MATCH1-SMYFIL-SYNCH2                        EXTRACT
#01472                      TO MATCH1-SMYFIL-SYNCH                      EXTRACT
#01472                 MOVE 'A' TO MATCH1-SMYFIL-ACCEPT-FLAG            EXTRACT
#01472                 MOVE MATCH1-ALL-MATCH-SAVE                       EXTRACT
#01472                   TO MATCH1-ALL-MATCH-FLAG                       EXTRACT
#01472                 PERFORM D00080-MATCH1-BUILD-OUTPUT               EXTRACT
#01472              ELSE                                                EXTRACT
#01472                 MOVE SPACES TO MATCH1-SMYFIL-SYNCH               EXTRACT
#01472              END-IF                                              EXTRACT
#01472           END-IF                                                 EXTRACT
#01472        END-PERFORM                                               EXTRACT
#01472        MOVE SPACES TO MATCH1-ALL-MATCH-SAVE                      EXTRACT
#01472     END-IF.                                                      EXTRACT
#01472                                                                  EXTRACT
#01472* END OF FILE MUST ALWAYS BE TAGGED WITH CORRECT FLAGS.           EXTRACT
#01472     IF END-OF-SMYFIL                                             EXTRACT
#01472         MOVE SPACES    TO MATCH1-SMYFIL-SYNCH                    EXTRACT
#01472         MOVE SPACES    TO MATCH1-SMYFIL-SYNCH2                   EXTRACT
#01472         MOVE LOW-VALUE TO MATCH1-SMYFIL-ACCEPT-FLAG              EXTRACT
#01472     END-IF.                                                      EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 MAIN COMPARE LOGIC, OLD KEY VS NEW KEY.          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00010-MATCH1-COMPARE-KEY.                                       EXTRACT
#01472     MOVE 'E' TO MATCH1-COMPARE-FLAG.                             EXTRACT
#01472                                                                  EXTRACT
#01472     IF MATCH1-OLD-EQ-NEW                                         EXTRACT
#01472         IF M01-OLD-SMY2-CRITERIA < M01-NEW-SMY2-CRITERIA         EXTRACT
#01472             MOVE 'L' TO MATCH1-COMPARE-FLAG                      EXTRACT
#01472         ELSE                                                     EXTRACT
#01472         IF M01-OLD-SMY2-CRITERIA > M01-NEW-SMY2-CRITERIA         EXTRACT
#01472             MOVE 'H' TO MATCH1-COMPARE-FLAG.                     EXTRACT
#01472                                                                  EXTRACT
#01472     IF MATCH1-OLD-EQ-NEW                                         EXTRACT
#01472         IF M01-OLD-SMY2-BANK < M01-NEW-SMY2-BANK                 EXTRACT
#01472             MOVE 'L' TO MATCH1-COMPARE-FLAG                      EXTRACT
#01472         ELSE                                                     EXTRACT
#01472         IF M01-OLD-SMY2-BANK > M01-NEW-SMY2-BANK                 EXTRACT
#01472             MOVE 'H' TO MATCH1-COMPARE-FLAG.                     EXTRACT
#01472                                                                  EXTRACT
#01472     IF MATCH1-OLD-EQ-NEW                                         EXTRACT
#01472         IF M01-OLD-SMY2-BRANCH < M01-NEW-SMY2-BRANCH             EXTRACT
#01472             MOVE 'L' TO MATCH1-COMPARE-FLAG                      EXTRACT
#01472         ELSE                                                     EXTRACT
#01472         IF M01-OLD-SMY2-BRANCH > M01-NEW-SMY2-BRANCH             EXTRACT
#01472             MOVE 'H' TO MATCH1-COMPARE-FLAG.                     EXTRACT
#01472                                                                  EXTRACT
#01472     IF MATCH1-OLD-EQ-NEW                                         EXTRACT
#01472         IF M01-OLD-SMY2-TYPE < M01-NEW-SMY2-TYPE                 EXTRACT
#01472             MOVE 'L' TO MATCH1-COMPARE-FLAG                      EXTRACT
#01472         ELSE                                                     EXTRACT
#01472         IF M01-OLD-SMY2-TYPE > M01-NEW-SMY2-TYPE                 EXTRACT
#01472             MOVE 'H' TO MATCH1-COMPARE-FLAG.                     EXTRACT
#01472                                                                  EXTRACT
#01472     IF MATCH1-OLD-EQ-NEW                                         EXTRACT
#01472         IF M01-OLD-SMY2-DATE < M01-NEW-SMY2-DATE                 EXTRACT
#01472             MOVE 'L' TO MATCH1-COMPARE-FLAG                      EXTRACT
#01472         ELSE                                                     EXTRACT
#01472         IF M01-OLD-SMY2-DATE > M01-NEW-SMY2-DATE                 EXTRACT
#01472             MOVE 'H' TO MATCH1-COMPARE-FLAG.                     EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 SMYFIL2 I/O PROCESSING LOGIC.                    * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00020-MATCH1-READ-SMYFIL2.                                      EXTRACT
#01472     IF MATCH1-SMYFIL2-LAST-W                                     EXTRACT
#01472         MOVE SPACES TO MATCH1-SMYFIL2-SYNCH2.                    EXTRACT
#01472                                                                  EXTRACT
#01472     IF SMYFIL2-IO-COUNT = 0                                      EXTRACT
#01472         MOVE 'F' TO SMYFIL2-IOSW                                 EXTRACT
#01472         PERFORM D00030-MATCH1-READ2-SMYFIL2                      EXTRACT
#01472         MOVE ZERO TO SMYFIL2-IO-COUNT                            EXTRACT
#01472         IF END-OF-SMYFIL2                                        EXTRACT
#01472             MOVE SPACES TO MATCH1-SMYFIL2-SYNCH2                 EXTRACT
#01472             MOVE SPACES TO MATCH1-SMYFIL2-STATUS.                EXTRACT
#01472                                                                  EXTRACT
#01472     IF END-OF-SMYFIL2                                            EXTRACT
#01472         MOVE SPACES TO MATCH1-SMYFIL2-STATUS                     EXTRACT
#01472         MOVE SPACES TO MATCH1-SMYFIL2-SYNCH2                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF MATCH1-SMYFIL2-STATUS = 'DE'                              EXTRACT
#01472         MOVE '10'   TO SMYFIL2-STATUS                            EXTRACT
#01472         MOVE SPACES TO MATCH1-SMYFIL2-SYNCH2                     EXTRACT
#01472         MOVE SPACES TO MATCH1-SMYFIL2-STATUS                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     MOVE MATCH1-SMYFIL2-IO-LRECL2 TO SMYFIL2-RECORD-SIZE         EXTRACT
#01472     MOVE MATCH1-SMYFIL2-IO-VEND2  TO SMYFIL2-RECORD-VEND         EXTRACT
#01472     MOVE MATCH1-SMYFIL2-IO-TAIL2  TO SMYFIL2-RECORD-TAIL         EXTRACT
#01472     MOVE SMYFIL2-IO-AREA TO SMYFIL2-RECORD                       EXTRACT
#01472     MOVE 1 TO MATCH1-SMYFIL2-IO-COUNT                            EXTRACT
#01472     PERFORM D00190-MATCH1-SMYFIL2-VALSEQ                         EXTRACT
#01472     PERFORM D00030-MATCH1-READ2-SMYFIL2                          EXTRACT
#01472     MOVE MATCH1-SMYFIL2-IO-LRECL1 TO SMYFIL2-RECORD-SIZE         EXTRACT
#01472     MOVE MATCH1-SMYFIL2-IO-VEND1  TO SMYFIL2-RECORD-VEND         EXTRACT
#01472     MOVE MATCH1-SMYFIL2-IO-TAIL1  TO SMYFIL2-RECORD-TAIL         EXTRACT
#01472     IF END-OF-SMYFIL2                                            EXTRACT
#01472         MOVE 'DE' TO MATCH1-SMYFIL2-STATUS                       EXTRACT
#01472         MOVE '00' TO SMYFIL2-STATUS                              EXTRACT
#01472         IF MATCH1-SMYFIL2-DUP-W                                  EXTRACT
#01472             MOVE 'Y' TO MATCH1-SMYFIL2-DUP-FLAG2                 EXTRACT
#01472             MOVE 'N' TO MATCH1-SMYFIL2-1ST-FLAG2                 EXTRACT
#01472             MOVE 'Y' TO MATCH1-SMYFIL2-LAST-FLAG2                EXTRACT
#01472         ELSE                                                     EXTRACT
#01472         MOVE SPACES TO MATCH1-SMYFIL2-SYNCH2                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     ADD -1 TO SMYFIL2-IO-COUNT                                   EXTRACT
#01472     IF SMY2-CRITERIA = ISMY2-CRITERIA                            EXTRACT
#01472     AND SMY2-BANK = ISMY2-BANK                                   EXTRACT
#01472     AND SMY2-BRANCH = ISMY2-BRANCH                               EXTRACT
#01472     AND SMY2-TYPE = ISMY2-TYPE                                   EXTRACT
#01472     AND SMY2-DATE = ISMY2-DATE                                   EXTRACT
#01472         IF NOT MATCH1-SMYFIL2-DUP-W                              EXTRACT
#01472             MOVE 'Y' TO MATCH1-SMYFIL2-DUP-FLAG2                 EXTRACT
#01472             MOVE 'Y' TO MATCH1-SMYFIL2-1ST-FLAG2                 EXTRACT
#01472             MOVE 'N' TO MATCH1-SMYFIL2-LAST-FLAG2                EXTRACT
#01472         ELSE                                                     EXTRACT
#01472         MOVE 'Y' TO MATCH1-SMYFIL2-DUP-FLAG2                     EXTRACT
#01472         MOVE 'N' TO MATCH1-SMYFIL2-1ST-FLAG2                     EXTRACT
#01472         MOVE 'N' TO MATCH1-SMYFIL2-LAST-FLAG2                    EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF MATCH1-SMYFIL2-DUP-W                                      EXTRACT
#01472         MOVE 'Y' TO MATCH1-SMYFIL2-DUP-FLAG2                     EXTRACT
#01472         MOVE 'N' TO MATCH1-SMYFIL2-1ST-FLAG2                     EXTRACT
#01472         MOVE 'Y' TO MATCH1-SMYFIL2-LAST-FLAG2                    EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     MOVE SPACES TO MATCH1-SMYFIL2-SYNCH2.                        EXTRACT
#01472                                                                  EXTRACT
#01472 D00030-MATCH1-READ2-SMYFIL2.                                     EXTRACT
#01472     MOVE MATCH1-SMYFIL2-IO-SAVE2 TO MATCH1-SMYFIL2-IO-SAVE1.     EXTRACT
#01472                                                                  FDYNIOR
#01472     MOVE 'READ'  TO SMYFIL2-IO-REQUEST                           FDYNIOR
#01472     CALL 'FSDYNIO2' USING SMYFIL2-DYNAM-FIB                      FDYNIOR
#01472     IF SMYFIL2-GOOD-IO                                           FDYNIOR
#01472        SET ADDRESS OF SMYFIL2-IO-AREA TO SMYFIL2-IOAREA-PTR      FDYNIOR
#01472     END-IF                                                       FDYNIOR
#01472     MOVE  SMYFIL2-IO-ERCODE1 TO SMYFIL2-STATUS                   FDYNIOR
#01472     IF END-OF-SMYFIL2                                            FDYNIOR
#01472        MOVE '10'    TO SMYFIL2-STATUS                            FDYNIOR
#01472     ELSE                                                         FDYNIOR
#01472     IF NOT SMYFIL2-GOOD-IO                                       FDYNIOR
#01472        DISPLAY SMYFIL2-MESSAGE                                   FDYNIOR
#01472        MOVE 3016 TO WS-PENGI-RETURN                              ABRCODE
#01472        MOVE SMYFIL2-MESSAGE TO ABEND-MESSAGE                     FDYNIOR
#01472        DISPLAY SMYFIL2-IOM-NAME ': ' SMYFIL2-IO-VSMEMSG          FDYNIOR
#01472        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01472     ELSE                                                         FDYNIOR
#01472     ADD 1 TO SMYFIL2-IO-COUNT.                                   FDYNIOR
#01472                                                                  FDYNIOR
#01472     MOVE SMYFIL2-RECORD-SIZE TO MATCH1-SMYFIL2-IO-LRECL2         EXTRACT
#01472     MOVE SMYFIL2-RECORD-VEND TO MATCH1-SMYFIL2-IO-VEND2          EXTRACT
#01472     MOVE SMYFIL2-RECORD-TAIL TO MATCH1-SMYFIL2-IO-TAIL2.         EXTRACT
#01472                                                                  EXTRACT
#01472     IF NOT END-OF-SMYFIL2                                        EXTRACT
#01472         IF SMYFIL2-IOSW = 'F'                                    EXTRACT
#01472            MOVE SMYFIL2-IO-AREA TO SMYFIL2-RECORD                EXTRACT
#01472            MOVE 'O' TO SMYFIL2-IOSW                              EXTRACT
#01472         END-IF                                                   EXTRACT
#01472         PERFORM D00140-MATCH1-SV-SMYFIL2-KEY.                    EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 SMYFIL I/O PROCESSING LOGIC.                     * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00040-MATCH1-READ-SMYFIL.                                       EXTRACT
#01472     IF MATCH1-SMYFIL-LAST-W                                      EXTRACT
#01472         MOVE SPACES TO MATCH1-SMYFIL-SYNCH2.                     EXTRACT
#01472                                                                  EXTRACT
#01472     IF SMYFIL-IO-COUNT = 0                                       EXTRACT
#01472         MOVE 'F' TO SMYFIL-IOSW                                  EXTRACT
#01472         PERFORM D00050-MATCH1-READ2-SMYFIL                       EXTRACT
#01472         MOVE ZERO TO SMYFIL-IO-COUNT                             EXTRACT
#01472         IF END-OF-SMYFIL                                         EXTRACT
#01472             MOVE SPACES TO MATCH1-SMYFIL-SYNCH2                  EXTRACT
#01472             MOVE SPACES TO MATCH1-SMYFIL-STATUS.                 EXTRACT
#01472                                                                  EXTRACT
#01472     IF END-OF-SMYFIL                                             EXTRACT
#01472         MOVE SPACES TO MATCH1-SMYFIL-STATUS                      EXTRACT
#01472         MOVE SPACES TO MATCH1-SMYFIL-SYNCH2                      EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF MATCH1-SMYFIL-STATUS = 'DE'                               EXTRACT
#01472         MOVE '10'   TO SMYFIL-STATUS                             EXTRACT
#01472         MOVE SPACES TO MATCH1-SMYFIL-SYNCH2                      EXTRACT
#01472         MOVE SPACES TO MATCH1-SMYFIL-STATUS                      EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     MOVE MATCH1-SMYFIL-IO-LRECL2 TO SMYFIL-RECORD-SIZE           EXTRACT
#01472     MOVE MATCH1-SMYFIL-IO-VEND2  TO SMYFIL-RECORD-VEND           EXTRACT
#01472     MOVE MATCH1-SMYFIL-IO-TAIL2  TO SMYFIL-RECORD-TAIL           EXTRACT
#01472     MOVE SMYFIL-IO-AREA TO SMYFIL-RECORD                         EXTRACT
#01472     MOVE 1 TO MATCH1-SMYFIL-IO-COUNT                             EXTRACT
#01472     PERFORM D00200-MATCH1-SMYFIL-VALSEQ                          EXTRACT
#01472     PERFORM D00050-MATCH1-READ2-SMYFIL                           EXTRACT
#01472     MOVE MATCH1-SMYFIL-IO-LRECL1 TO SMYFIL-RECORD-SIZE           EXTRACT
#01472     MOVE MATCH1-SMYFIL-IO-VEND1  TO SMYFIL-RECORD-VEND           EXTRACT
#01472     MOVE MATCH1-SMYFIL-IO-TAIL1  TO SMYFIL-RECORD-TAIL           EXTRACT
#01472     IF END-OF-SMYFIL                                             EXTRACT
#01472         MOVE 'DE' TO MATCH1-SMYFIL-STATUS                        EXTRACT
#01472         MOVE '00' TO SMYFIL-STATUS                               EXTRACT
#01472         IF MATCH1-SMYFIL-DUP-W                                   EXTRACT
#01472             MOVE 'Y' TO MATCH1-SMYFIL-DUP-FLAG2                  EXTRACT
#01472             MOVE 'N' TO MATCH1-SMYFIL-1ST-FLAG2                  EXTRACT
#01472             MOVE 'Y' TO MATCH1-SMYFIL-LAST-FLAG2                 EXTRACT
#01472         ELSE                                                     EXTRACT
#01472         MOVE SPACES TO MATCH1-SMYFIL-SYNCH2                      EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     ADD -1 TO SMYFIL-IO-COUNT                                    EXTRACT
#01472     IF SMY-CRITERIA = ISMY-CRITERIA                              EXTRACT
#01472     AND SMY-BANK = ISMY-BANK                                     EXTRACT
#01472     AND SMY-BRANCH = ISMY-BRANCH                                 EXTRACT
#01472     AND SMY-TYPE = ISMY-TYPE                                     EXTRACT
#01472     AND SMY-DATE = ISMY-DATE                                     EXTRACT
#01472         IF NOT MATCH1-SMYFIL-DUP-W                               EXTRACT
#01472             MOVE 'Y' TO MATCH1-SMYFIL-DUP-FLAG2                  EXTRACT
#01472             MOVE 'Y' TO MATCH1-SMYFIL-1ST-FLAG2                  EXTRACT
#01472             MOVE 'N' TO MATCH1-SMYFIL-LAST-FLAG2                 EXTRACT
#01472         ELSE                                                     EXTRACT
#01472         MOVE 'Y' TO MATCH1-SMYFIL-DUP-FLAG2                      EXTRACT
#01472         MOVE 'N' TO MATCH1-SMYFIL-1ST-FLAG2                      EXTRACT
#01472         MOVE 'N' TO MATCH1-SMYFIL-LAST-FLAG2                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF MATCH1-SMYFIL-DUP-W                                       EXTRACT
#01472         MOVE 'Y' TO MATCH1-SMYFIL-DUP-FLAG2                      EXTRACT
#01472         MOVE 'N' TO MATCH1-SMYFIL-1ST-FLAG2                      EXTRACT
#01472         MOVE 'Y' TO MATCH1-SMYFIL-LAST-FLAG2                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     MOVE SPACES TO MATCH1-SMYFIL-SYNCH2.                         EXTRACT
#01472                                                                  EXTRACT
#01472 D00050-MATCH1-READ2-SMYFIL.                                      EXTRACT
#01472     MOVE MATCH1-SMYFIL-IO-SAVE2 TO MATCH1-SMYFIL-IO-SAVE1.       EXTRACT
#01472                                                                  FDYNIOR
#01472     MOVE 'READ'  TO SMYFIL-IO-REQUEST                            FDYNIOR
#01472     CALL 'FSDYNIO2' USING SMYFIL-DYNAM-FIB                       FDYNIOR
#01472     IF SMYFIL-GOOD-IO                                            FDYNIOR
#01472        SET ADDRESS OF SMYFIL-IO-AREA TO SMYFIL-IOAREA-PTR        FDYNIOR
#01472     END-IF                                                       FDYNIOR
#01472     MOVE  SMYFIL-IO-ERCODE1 TO SMYFIL-STATUS                     FDYNIOR
#01472     IF END-OF-SMYFIL                                             FDYNIOR
#01472        MOVE '10'    TO SMYFIL-STATUS                             FDYNIOR
#01472     ELSE                                                         FDYNIOR
#01472     IF NOT SMYFIL-GOOD-IO                                        FDYNIOR
#01472        DISPLAY SMYFIL-MESSAGE                                    FDYNIOR
#01472        MOVE 3018 TO WS-PENGI-RETURN                              ABRCODE
#01472        MOVE SMYFIL-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01472        DISPLAY SMYFIL-IOM-NAME ': ' SMYFIL-IO-VSMEMSG            FDYNIOR
#01472        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01472     ELSE                                                         FDYNIOR
#01472     ADD 1 TO SMYFIL-IO-COUNT.                                    FDYNIOR
#01472                                                                  FDYNIOR
#01472     MOVE SMYFIL-RECORD-SIZE TO MATCH1-SMYFIL-IO-LRECL2           EXTRACT
#01472     MOVE SMYFIL-RECORD-VEND TO MATCH1-SMYFIL-IO-VEND2            EXTRACT
#01472     MOVE SMYFIL-RECORD-TAIL TO MATCH1-SMYFIL-IO-TAIL2.           EXTRACT
#01472                                                                  EXTRACT
#01472     IF NOT END-OF-SMYFIL                                         EXTRACT
#01472         IF SMYFIL-IOSW = 'F'                                     EXTRACT
#01472            MOVE SMYFIL-IO-AREA TO SMYFIL-RECORD                  EXTRACT
#01472            MOVE 'O' TO SMYFIL-IOSW                               EXTRACT
#01472         END-IF                                                   EXTRACT
#01472         PERFORM D00150-MATCH1-SV-SMYFIL-KEY.                     EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 SYNCF3 I/O WRITE PARAGRAPH.                      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00060-MATCH1-WRITE-SYNCF3.                                      EXTRACT
#01472     MOVE 'Y' TO SYNCF3-ACCEPT-FLAG                               NULLIOR
#01472     PERFORM A03010-JOB3-READ.                                    NULLIOR
#01472                                                                  NULLIOR
#01472     PERFORM D00070-MATCH1-CLEAR-OUTPUT.                          EXTRACT
#01472     MOVE SPACES TO MATCH1-ALL-MATCH-FLAG.                        EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 - CLEAR OUTPUT FILE RECORD FIELDS.               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00070-MATCH1-CLEAR-OUTPUT.                                      EXTRACT
#01472     MOVE SPACES TO G00-SPACES.                                   EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 BUILD OUTPUT RECORD FROM SELECTED ITEMS.         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00080-MATCH1-BUILD-OUTPUT.                                      EXTRACT
#01472     IF MATCH1-SMYFIL2-ACCEPTED                                   EXTRACT
#01472         MOVE 'Y' TO MATCH1-SMYFIL2-SELECT-FLAG                   EXTRACT
#01472         ADD MATCH1-SMYFIL2-IO-COUNT TO SMYFIL2-IO-COUNT          EXTRACT
#01472         MOVE ZERO TO MATCH1-SMYFIL2-IO-COUNT                     EXTRACT
#01472         MOVE 'A' TO MATCH1-SMYFIL2-ACCEPT-FLAG.                  EXTRACT
#01472                                                                  EXTRACT
#01472     IF MATCH1-SMYFIL-ACCEPTED                                    EXTRACT
#01472         MOVE 'Y' TO MATCH1-SMYFIL-SELECT-FLAG                    EXTRACT
#01472         ADD MATCH1-SMYFIL-IO-COUNT TO SMYFIL-IO-COUNT            EXTRACT
#01472         MOVE ZERO TO MATCH1-SMYFIL-IO-COUNT                      EXTRACT
#01472         MOVE 'A' TO MATCH1-SMYFIL-ACCEPT-FLAG.                   EXTRACT
#01472                                                                  EXTRACT
#01472     PERFORM D00090-MATCH1-SET-SYNCF3-KEY                         EXTRACT
#01472     PERFORM D00160-MATCH1-SYNCF3-OTHER                           EXTRACT
#01472     PERFORM D00060-MATCH1-WRITE-SYNCF3.                          EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 MOVE KEYS INTO SYNCF3.                           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00090-MATCH1-SET-SYNCF3-KEY.                                    EXTRACT
#01472     SET ACCEPT-SYNCF3-RECORD TO TRUE.                            EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 SET SMYFIL2 KEY INTO NEW KEY AREA.               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00100-MATCH1-SMYFIL2-SETNEW.                                    EXTRACT
#01472     MOVE SMY2-CRITERIA            TO M01-NEW-SMY2-CRITERIA.      EXTRACT
#01472     MOVE SMY2-BANK                TO M01-NEW-SMY2-BANK.          EXTRACT
#01472     MOVE SMY2-BRANCH              TO M01-NEW-SMY2-BRANCH.        EXTRACT
#01472     MOVE SMY2-TYPE                TO M01-NEW-SMY2-TYPE.          EXTRACT
#01472     MOVE SMY2-DATE                TO M01-NEW-SMY2-DATE.          EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 SET SMYFIL KEY INTO NEW KEY AREA.                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00110-MATCH1-SMYFIL-SETNEW.                                     EXTRACT
#01472     MOVE SMY-CRITERIA             TO M01-NEW-SMY2-CRITERIA.      EXTRACT
#01472     MOVE SMY-BANK                 TO M01-NEW-SMY2-BANK.          EXTRACT
#01472     MOVE SMY-BRANCH               TO M01-NEW-SMY2-BRANCH.        EXTRACT
#01472     MOVE SMY-TYPE                 TO M01-NEW-SMY2-TYPE.          EXTRACT
#01472     MOVE SMY-DATE                 TO M01-NEW-SMY2-DATE.          EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 SET SMYFIL2 KEY INTO OLD KEY AREA.               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00120-MATCH1-SMYFIL2-SETOLD.                                    EXTRACT
#01472     MOVE SMY2-CRITERIA            TO M01-OLD-SMY2-CRITERIA.      EXTRACT
#01472     MOVE SMY2-BANK                TO M01-OLD-SMY2-BANK.          EXTRACT
#01472     MOVE SMY2-BRANCH              TO M01-OLD-SMY2-BRANCH.        EXTRACT
#01472     MOVE SMY2-TYPE                TO M01-OLD-SMY2-TYPE.          EXTRACT
#01472     MOVE SMY2-DATE                TO M01-OLD-SMY2-DATE.          EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 SET SMYFIL KEY INTO OLD KEY AREA.                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00130-MATCH1-SMYFIL-SETOLD.                                     EXTRACT
#01472     MOVE SMY-CRITERIA             TO M01-OLD-SMY2-CRITERIA.      EXTRACT
#01472     MOVE SMY-BANK                 TO M01-OLD-SMY2-BANK.          EXTRACT
#01472     MOVE SMY-BRANCH               TO M01-OLD-SMY2-BRANCH.        EXTRACT
#01472     MOVE SMY-TYPE                 TO M01-OLD-SMY2-TYPE.          EXTRACT
#01472     MOVE SMY-DATE                 TO M01-OLD-SMY2-DATE.          EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 SAVES FOR SMYFIL2 KEYS.                          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00140-MATCH1-SV-SMYFIL2-KEY.                                    EXTRACT
#01472     MOVE SMY2-CRITERIA            TO M01-SAV-SMY2-CRITERIA.      EXTRACT
#01472     MOVE SMY2-BANK                TO M01-SAV-SMY2-BANK.          EXTRACT
#01472     MOVE SMY2-BRANCH              TO M01-SAV-SMY2-BRANCH.        EXTRACT
#01472     MOVE SMY2-TYPE                TO M01-SAV-SMY2-TYPE.          EXTRACT
#01472     MOVE SMY2-DATE                TO M01-SAV-SMY2-DATE.          EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 SAVES FOR SMYFIL KEYS.                           * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00150-MATCH1-SV-SMYFIL-KEY.                                     EXTRACT
#01472     MOVE SMY-CRITERIA             TO M01-SAV-SMY-CRITERIA.       EXTRACT
#01472     MOVE SMY-BANK                 TO M01-SAV-SMY-BANK.           EXTRACT
#01472     MOVE SMY-BRANCH               TO M01-SAV-SMY-BRANCH.         EXTRACT
#01472     MOVE SMY-TYPE                 TO M01-SAV-SMY-TYPE.           EXTRACT
#01472     MOVE SMY-DATE                 TO M01-SAV-SMY-DATE.           EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 - SYNCF3 MOVE OTHER FIELDS INTO OUTPUT           * GENCTEXT
      * THIS ROUTINE MOVES ALL FIELDS NOT IN ANY INPUT FILES.         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00160-MATCH1-SYNCF3-OTHER.                                      EXTRACT
#01472     MOVE SPACES                                   TO G00-SPACES. EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 SMYFIL2 SEQUENCE ERROR DISPLAY.                  * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00170-MATCH1-SMYFIL2-SEQERR.                                    EXTRACT
#01472     DISPLAY '** RECORD IN PROCESS=' SMYFIL2-IO-COUNT             EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '** PREVIOUS KEY:'      UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    M01-SAV-SMY2-CRITERIA=' M01-SAV-SMY2-CRITERIA   EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    M01-SAV-SMY2-BANK=' M01-SAV-SMY2-BANK           EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    M01-SAV-SMY2-BRANCH=' M01-SAV-SMY2-BRANCH       EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    M01-SAV-SMY2-TYPE=' M01-SAV-SMY2-TYPE           EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    M01-SAV-SMY2-DATE=' M01-SAV-SMY2-DATE           EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472                                                                  EXTRACT
#01472     DISPLAY '** CURRENT KEY:'      UPON CONSOLE                  EXTRACT
#01472     DISPLAY '    SMY2-CRITERIA=' SMY2-CRITERIA                   EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    SMY2-BANK=' SMY2-BANK                           EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    SMY2-BRANCH=' SMY2-BRANCH                       EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    SMY2-TYPE=' SMY2-TYPE                           EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    SMY2-DATE=' SMY2-DATE                           EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     MOVE 3017 TO WS-PENGI-RETURN                                 ABRCODE
#01472     MOVE SPACES TO ABEND-MESSAGE                                 EXTRACT
#01472     PERFORM F00000-ABEND-CALL-FSABEC16.                          ABEND00
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 SMYFIL SEQUENCE ERROR DISPLAY.                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00180-MATCH1-SMYFIL-SEQERR.                                     EXTRACT
#01472     DISPLAY '** RECORD IN PROCESS=' SMYFIL-IO-COUNT              EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '** PREVIOUS KEY:'      UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    M01-SAV-SMY-CRITERIA=' M01-SAV-SMY-CRITERIA     EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    M01-SAV-SMY-BANK=' M01-SAV-SMY-BANK             EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    M01-SAV-SMY-BRANCH=' M01-SAV-SMY-BRANCH         EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    M01-SAV-SMY-TYPE=' M01-SAV-SMY-TYPE             EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    M01-SAV-SMY-DATE=' M01-SAV-SMY-DATE             EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472                                                                  EXTRACT
#01472     DISPLAY '** CURRENT KEY:'      UPON CONSOLE                  EXTRACT
#01472     DISPLAY '    SMY-CRITERIA=' SMY-CRITERIA                     EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    SMY-BANK=' SMY-BANK                             EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    SMY-BRANCH=' SMY-BRANCH                         EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    SMY-TYPE=' SMY-TYPE                             EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     DISPLAY '    SMY-DATE=' SMY-DATE                             EXTRACT
#01472                                     UPON CONSOLE                 EXTRACT
#01472     MOVE 3019 TO WS-PENGI-RETURN                                 ABRCODE
#01472     MOVE SPACES TO ABEND-MESSAGE                                 EXTRACT
#01472     PERFORM F00000-ABEND-CALL-FSABEC16.                          ABEND00
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 SMYFIL2 SEQUENCE VALIDATION ROUTINE.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00190-MATCH1-SMYFIL2-VALSEQ.                                    EXTRACT
#01472     IF M01-SAV-SMY2-CRITERIA > SMY2-CRITERIA                     EXTRACT
#01472        DISPLAY 'MATCH1: PROCESSING ERROR' UPON CONSOLE           EXTRACT
#01472        DISPLAY 'SMYFIL2: ASCENDING SEQUENCE ERROR, '             EXTRACT
#01472            'SMY2-CRITERIA FIELD IS OUT OF SEQUENCE'              EXTRACT
#01472                                               UPON CONSOLE       EXTRACT
#01472            GO TO D00170-MATCH1-SMYFIL2-SEQERR                    EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY2-CRITERIA NOT = SMY2-CRITERIA                 EXTRACT
#01472         PERFORM D00140-MATCH1-SV-SMYFIL2-KEY                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY2-BANK > SMY2-BANK                             EXTRACT
#01472        DISPLAY 'MATCH1: PROCESSING ERROR' UPON CONSOLE           EXTRACT
#01472        DISPLAY 'SMYFIL2: ASCENDING SEQUENCE ERROR, '             EXTRACT
#01472            'SMY2-BANK FIELD IS OUT OF SEQUENCE'                  EXTRACT
#01472                                               UPON CONSOLE       EXTRACT
#01472            GO TO D00170-MATCH1-SMYFIL2-SEQERR                    EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY2-BANK NOT = SMY2-BANK                         EXTRACT
#01472         PERFORM D00140-MATCH1-SV-SMYFIL2-KEY                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY2-BRANCH > SMY2-BRANCH                         EXTRACT
#01472        DISPLAY 'MATCH1: PROCESSING ERROR' UPON CONSOLE           EXTRACT
#01472        DISPLAY 'SMYFIL2: ASCENDING SEQUENCE ERROR, '             EXTRACT
#01472            'SMY2-BRANCH FIELD IS OUT OF SEQUENCE'                EXTRACT
#01472                                               UPON CONSOLE       EXTRACT
#01472            GO TO D00170-MATCH1-SMYFIL2-SEQERR                    EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY2-BRANCH NOT = SMY2-BRANCH                     EXTRACT
#01472         PERFORM D00140-MATCH1-SV-SMYFIL2-KEY                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY2-TYPE > SMY2-TYPE                             EXTRACT
#01472        DISPLAY 'MATCH1: PROCESSING ERROR' UPON CONSOLE           EXTRACT
#01472        DISPLAY 'SMYFIL2: ASCENDING SEQUENCE ERROR, '             EXTRACT
#01472            'SMY2-TYPE FIELD IS OUT OF SEQUENCE'                  EXTRACT
#01472                                               UPON CONSOLE       EXTRACT
#01472            GO TO D00170-MATCH1-SMYFIL2-SEQERR                    EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY2-TYPE NOT = SMY2-TYPE                         EXTRACT
#01472         PERFORM D00140-MATCH1-SV-SMYFIL2-KEY                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY2-DATE > SMY2-DATE                             EXTRACT
#01472        DISPLAY 'MATCH1: PROCESSING ERROR' UPON CONSOLE           EXTRACT
#01472        DISPLAY 'SMYFIL2: ASCENDING SEQUENCE ERROR, '             EXTRACT
#01472            'SMY2-DATE FIELD IS OUT OF SEQUENCE'                  EXTRACT
#01472                                               UPON CONSOLE       EXTRACT
#01472            GO TO D00170-MATCH1-SMYFIL2-SEQERR                    EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY2-DATE NOT = SMY2-DATE                         EXTRACT
#01472         PERFORM D00140-MATCH1-SV-SMYFIL2-KEY                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472         NEXT SENTENCE.                                           EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 SMYFIL SEQUENCE VALIDATION ROUTINE.              * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00200-MATCH1-SMYFIL-VALSEQ.                                     EXTRACT
#01472     IF M01-SAV-SMY-CRITERIA > SMY-CRITERIA                       EXTRACT
#01472        DISPLAY 'MATCH1: PROCESSING ERROR' UPON CONSOLE           EXTRACT
#01472        DISPLAY 'SMYFIL: ASCENDING SEQUENCE ERROR, '              EXTRACT
#01472            'SMY-CRITERIA FIELD IS OUT OF SEQUENCE'               EXTRACT
#01472                                               UPON CONSOLE       EXTRACT
#01472            GO TO D00180-MATCH1-SMYFIL-SEQERR                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY-CRITERIA NOT = SMY-CRITERIA                   EXTRACT
#01472         PERFORM D00150-MATCH1-SV-SMYFIL-KEY                      EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY-BANK > SMY-BANK                               EXTRACT
#01472        DISPLAY 'MATCH1: PROCESSING ERROR' UPON CONSOLE           EXTRACT
#01472        DISPLAY 'SMYFIL: ASCENDING SEQUENCE ERROR, '              EXTRACT
#01472            'SMY-BANK FIELD IS OUT OF SEQUENCE'                   EXTRACT
#01472                                               UPON CONSOLE       EXTRACT
#01472            GO TO D00180-MATCH1-SMYFIL-SEQERR                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY-BANK NOT = SMY-BANK                           EXTRACT
#01472         PERFORM D00150-MATCH1-SV-SMYFIL-KEY                      EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY-BRANCH > SMY-BRANCH                           EXTRACT
#01472        DISPLAY 'MATCH1: PROCESSING ERROR' UPON CONSOLE           EXTRACT
#01472        DISPLAY 'SMYFIL: ASCENDING SEQUENCE ERROR, '              EXTRACT
#01472            'SMY-BRANCH FIELD IS OUT OF SEQUENCE'                 EXTRACT
#01472                                               UPON CONSOLE       EXTRACT
#01472            GO TO D00180-MATCH1-SMYFIL-SEQERR                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY-BRANCH NOT = SMY-BRANCH                       EXTRACT
#01472         PERFORM D00150-MATCH1-SV-SMYFIL-KEY                      EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY-TYPE > SMY-TYPE                               EXTRACT
#01472        DISPLAY 'MATCH1: PROCESSING ERROR' UPON CONSOLE           EXTRACT
#01472        DISPLAY 'SMYFIL: ASCENDING SEQUENCE ERROR, '              EXTRACT
#01472            'SMY-TYPE FIELD IS OUT OF SEQUENCE'                   EXTRACT
#01472                                               UPON CONSOLE       EXTRACT
#01472            GO TO D00180-MATCH1-SMYFIL-SEQERR                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY-TYPE NOT = SMY-TYPE                           EXTRACT
#01472         PERFORM D00150-MATCH1-SV-SMYFIL-KEY                      EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY-DATE > SMY-DATE                               EXTRACT
#01472        DISPLAY 'MATCH1: PROCESSING ERROR' UPON CONSOLE           EXTRACT
#01472        DISPLAY 'SMYFIL: ASCENDING SEQUENCE ERROR, '              EXTRACT
#01472            'SMY-DATE FIELD IS OUT OF SEQUENCE'                   EXTRACT
#01472                                               UPON CONSOLE       EXTRACT
#01472            GO TO D00180-MATCH1-SMYFIL-SEQERR                     EXTRACT
#01472     ELSE                                                         EXTRACT
#01472     IF M01-SAV-SMY-DATE NOT = SMY-DATE                           EXTRACT
#01472         PERFORM D00150-MATCH1-SV-SMYFIL-KEY                      EXTRACT
#01472     ELSE                                                         EXTRACT
#01472         NEXT SENTENCE.                                           EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 - THIS ROUTINE OPENS ALL INPUT FILES.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00210-MATCH1-OPEN-FILES.                                        EXTRACT
#01472                                                                  EXTRACT
#01472     MOVE ZEROS TO SMYFIL2-STATUS                                 EXTRACT
#01472     IF SMYFIL2-CLOSED                                            EXTRACT
#01472        PERFORM D00220-MATCH1-OPEN-SMYFIL2.                       EXTRACT
#01472     PERFORM D00020-MATCH1-READ-SMYFIL2.                          EXTRACT
#01472                                                                  EXTRACT
#01472     MOVE ZEROS TO SMYFIL-STATUS                                  EXTRACT
#01472     IF SMYFIL-CLOSED                                             EXTRACT
#01472        PERFORM D00230-MATCH1-OPEN-SMYFIL.                        EXTRACT
#01472     PERFORM D00040-MATCH1-READ-SMYFIL.                           EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MATCH1 OPEN SYNCF3 OUTPUT FILE.                         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472     MOVE '00' TO SYNCF3-STATUS.                                  NULLIOR
#01472* OPEN FOR SYNCF3 WAS NOT GENERATED DUE TO USER REQUEST.          NULLIOR
#01472     PERFORM D00070-MATCH1-CLEAR-OUTPUT.                          EXTRACT
#01472                                                                  EXTRACT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * CCG MATCH1 - THIS ROUTINE OPENS SMYFIL2 FILE.                 * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00220-MATCH1-OPEN-SMYFIL2.                                      EXTRACT
#01472                                                                  FDYNIOR
#01472* SMYFIL2 OPEN ROUTINE                                            FDYNIOR
#01472     MOVE  LENGTH OF ISMYFIL2-GRECORD                             FDYNIOR
#01472               TO SMYFIL2-RECORD-KEYE                             FDYNIOR
#01472     MOVE 'OPEN'  TO SMYFIL2-IO-REQUEST                           FDYNIOR
#01472     MOVE 'INPUT'  TO SMYFIL2-IO-REQTYPE                          FDYNIOR
#01472     CALL 'FSDYNIO1' USING SMYFIL2-DYNAM-FIB                      FDYNIOR
#01472     MOVE  SMYFIL2-IO-ERCODE1 TO SMYFIL2-STATUS                   FDYNIOR
#01472     MOVE 'O'     TO SMYFIL2-IOSW                                 FDYNIOR
#01472     MOVE 'Y'     TO SMYFIL2-ACCEPT-FLAG                          FDYNIOR
#01472     MOVE ZERO    TO SMYFIL2-IO-COUNT                             FDYNIOR
#01472     IF (NOT SMYFIL2-GOOD-IO)                                     FDYNIOR
#01472        DISPLAY SMYFIL2-MESSAGE                                   FDYNIOR
#01472        MOVE 3013 TO WS-PENGI-RETURN                              ABRCODE
#01472        MOVE SMYFIL2-MESSAGE TO ABEND-MESSAGE                     FDYNIOR
#01472        DISPLAY SMYFIL2-IOM-NAME ': ' SMYFIL2-IO-VSMEMSG          FDYNIOR
#01472        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01472     END-IF.                                                      FDYNIOR
#01472     SET ADDRESS OF SMYFIL2-IO-AREA2 TO SMYFIL2-IOAREA2-PTR       FDYNIOR
#01472     SET ADDRESS OF SMYFIL2-IO-AREA TO SMYFIL2-IOAREA-PTR         FDYNIOR
#01472     CALL 'FSDYNPTR' USING  SMYFIL2-DYNAM-FIB                     FDYNIOR
#01472     SET ADDRESS OF SMYFIL2-RECORD  TO SMYFIL2-RECORD-PTR         FDYNIOR
#01472     MOVE SPACES TO SMYFIL2-RECORD.                               FDYNIOR
#01472     INITIALIZE SMYFIL2-GRECORD.                                  FDYNIOR
#01472                                                                  FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * CCG MATCH1 - THIS ROUTINE OPENS SMYFIL FILE.                  * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00230-MATCH1-OPEN-SMYFIL.                                       EXTRACT
#01472                                                                  FDYNIOR
#01472* SMYFIL OPEN ROUTINE                                             FDYNIOR
#01472     MOVE  LENGTH OF ISMYFIL-GRECORD                              FDYNIOR
#01472               TO SMYFIL-RECORD-KEYE                              FDYNIOR
#01472     MOVE 'OPEN'  TO SMYFIL-IO-REQUEST                            FDYNIOR
#01472     MOVE 'INPUT'  TO SMYFIL-IO-REQTYPE                           FDYNIOR
#01472     CALL 'FSDYNIO1' USING SMYFIL-DYNAM-FIB                       FDYNIOR
#01472     MOVE  SMYFIL-IO-ERCODE1 TO SMYFIL-STATUS                     FDYNIOR
#01472     MOVE 'O'     TO SMYFIL-IOSW                                  FDYNIOR
#01472     MOVE 'Y'     TO SMYFIL-ACCEPT-FLAG                           FDYNIOR
#01472     MOVE ZERO    TO SMYFIL-IO-COUNT                              FDYNIOR
#01472     IF (NOT SMYFIL-GOOD-IO)                                      FDYNIOR
#01472        DISPLAY SMYFIL-MESSAGE                                    FDYNIOR
#01472        MOVE 3015 TO WS-PENGI-RETURN                              ABRCODE
#01472        MOVE SMYFIL-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01472        DISPLAY SMYFIL-IOM-NAME ': ' SMYFIL-IO-VSMEMSG            FDYNIOR
#01472        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01472     END-IF.                                                      FDYNIOR
#01472     SET ADDRESS OF SMYFIL-IO-AREA2 TO SMYFIL-IOAREA2-PTR         FDYNIOR
#01472     SET ADDRESS OF SMYFIL-IO-AREA TO SMYFIL-IOAREA-PTR           FDYNIOR
#01472     CALL 'FSDYNPTR' USING  SMYFIL-DYNAM-FIB                      FDYNIOR
#01472     SET ADDRESS OF SMYFIL-RECORD  TO SMYFIL-RECORD-PTR           FDYNIOR
#01472     MOVE SPACES TO SMYFIL-RECORD.                                FDYNIOR
#01472     INITIALIZE SMYFIL-GRECORD.                                   FDYNIOR
#01472                                                                  FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * CCG MATCH1 - THIS ROUTINE CLOSES SMYFIL2 FILE.                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00240-MATCH1-CLOSE-SMYFIL2.                                     EXTRACT
#01472                                                                  FDYNIOR
#01472* SMYFIL2 CLOSE ROUTINE                                           FDYNIOR
#01472     MOVE 'CLOSE'  TO SMYFIL2-IO-REQUEST                          FDYNIOR
#01472     MOVE ZERO TO SMYFIL2-STATUS                                  FDYNIOR
#01472     IF SMYFIL2-OPEN                                              FDYNIOR
#01472        CALL 'FSDYNIO1' USING SMYFIL2-DYNAM-FIB                   FDYNIOR
#01472        MOVE  SMYFIL2-IO-ERCODE1 TO SMYFIL2-STATUS                FDYNIOR
#01472     END-IF                                                       FDYNIOR
#01472     MOVE 'C'     TO SMYFIL2-IOSW                                 FDYNIOR
#01472     MOVE SPACE   TO SMYFIL2-ACCEPT-FLAG                          FDYNIOR
#01472     IF (NOT SMYFIL2-GOOD-IO)                                     FDYNIOR
#01472        DISPLAY SMYFIL2-MESSAGE                                   FDYNIOR
#01472        MOVE 3012 TO WS-PENGI-RETURN                              ABRCODE
#01472        MOVE SMYFIL2-MESSAGE TO ABEND-MESSAGE                     FDYNIOR
#01472        DISPLAY SMYFIL2-IOM-NAME ': ' SMYFIL2-IO-VSMEMSG          FDYNIOR
#01472        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01472     END-IF.                                                      FDYNIOR
#01472                                                                  FDYNIOR
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * CCG MATCH1 - THIS ROUTINE CLOSES SMYFIL FILE.                 * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01472 D00250-MATCH1-CLOSE-SMYFIL.                                      EXTRACT
#01472                                                                  FDYNIOR
#01472* SMYFIL CLOSE ROUTINE                                            FDYNIOR
#01472     MOVE 'CLOSE'  TO SMYFIL-IO-REQUEST                           FDYNIOR
#01472     MOVE ZERO TO SMYFIL-STATUS                                   FDYNIOR
#01472     IF SMYFIL-OPEN                                               FDYNIOR
#01472        CALL 'FSDYNIO1' USING SMYFIL-DYNAM-FIB                    FDYNIOR
#01472        MOVE  SMYFIL-IO-ERCODE1 TO SMYFIL-STATUS                  FDYNIOR
#01472     END-IF                                                       FDYNIOR
#01472     MOVE 'C'     TO SMYFIL-IOSW                                  FDYNIOR
#01472     MOVE SPACE   TO SMYFIL-ACCEPT-FLAG                           FDYNIOR
#01472     IF (NOT SMYFIL-GOOD-IO)                                      FDYNIOR
#01472        DISPLAY SMYFIL-MESSAGE                                    FDYNIOR
#01472        MOVE 3014 TO WS-PENGI-RETURN                              ABRCODE
#01472        MOVE SMYFIL-MESSAGE TO ABEND-MESSAGE                      FDYNIOR
#01472        DISPLAY SMYFIL-IOM-NAME ': ' SMYFIL-IO-VSMEMSG            FDYNIOR
#01472        PERFORM F00000-ABEND-CALL-FSABEC16                        ABEND00
#01472     END-IF.                                                      FDYNIOR
#01472                                                                  FDYNIOR
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      *     ++ END OF GENERATED CODE FOR MATCH1 ++                    * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
#01472                                                                  EXTRACT
#00777     EJECT                                                        GENERATQ
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 MAIN LINE.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00000-REPORT1-MAINLINE.                                         GENERATQ
#00777     MOVE 'N' TO REPORT1-FINL-CNTRL                               GENERATQ
#00777     MOVE ZERO TO REPORT1-CTL-LEVEL.                              GENERATQ
#00777     IF SYSPRINT-IOSW = 'C'                                       GENERATQ
#00777         PERFORM E00260-REPORT1-OPEN                              GENERATQ
#00777         PERFORM E00020-REPORT1-SAVE                              GENERATQ
#00777     ELSE                                                         GENERATQ
#00777     IF REPORT1-COUNT = 0                                         GENERATQ
#00777         PERFORM E00020-REPORT1-SAVE.                             GENERATQ
#00777                                                                  GENERATQ
#00777     IF R01-SAV-CRITERIA NOT = S1-CRITERIA                        GENERATQ
#00777         MOVE 5 TO REPORT1-BREAK-LEVL                             GENERATQ
#00777         MOVE 5 TO REPORT1-PFOOT-LEVL                             GENERATQ
#00777         PERFORM E00110-REPORT1-LV2-BREAK                         GENERATQ
#00777         PERFORM E00020-REPORT1-SAVE                              GENERATQ
#00777         MOVE ZERO TO REPORT1-BREAK-LEVL                          GENERATQ
#00777     ELSE                                                         GENERATQ
#00777     IF R01-SAV-T-BANK NOT = S1-T-BANK                            GENERATQ
#00777         MOVE 4 TO REPORT1-BREAK-LEVL                             GENERATQ
#00777         MOVE 4 TO REPORT1-PFOOT-LEVL                             GENERATQ
#00777         PERFORM E00120-REPORT1-LV3-BREAK                         GENERATQ
#00777         PERFORM E00020-REPORT1-SAVE                              GENERATQ
#00777         MOVE ZERO TO REPORT1-BREAK-LEVL                          GENERATQ
#00777     ELSE                                                         GENERATQ
#00777     IF R01-SAV-W-ASSIGNMENT NOT = S1-W-ASSIGNMENT                GENERATQ
#00777         MOVE 3 TO REPORT1-BREAK-LEVL                             GENERATQ
#00777         MOVE 3 TO REPORT1-PFOOT-LEVL                             GENERATQ
#00777         PERFORM E00130-REPORT1-LV4-BREAK                         GENERATQ
#00777         PERFORM E00020-REPORT1-SAVE                              GENERATQ
#00777         MOVE ZERO TO REPORT1-BREAK-LEVL                          GENERATQ
#00777     ELSE                                                         GENERATQ
#00777     IF R01-SAV-WORK-TYPE NOT = S1-WORK-TYPE                      GENERATQ
#00777         MOVE 2 TO REPORT1-BREAK-LEVL                             GENERATQ
#00777         MOVE 2 TO REPORT1-PFOOT-LEVL                             GENERATQ
#00777         PERFORM E00140-REPORT1-LV5-BREAK                         GENERATQ
#00777         PERFORM E00020-REPORT1-SAVE                              GENERATQ
#00777         MOVE ZERO TO REPORT1-BREAK-LEVL                          GENERATQ
#00777     ELSE                                                         GENERATQ
#00777     IF R01-SAV-ACCR-DATE NOT = S1-ACCR-DATE                      GENERATQ
#00777         MOVE 1 TO REPORT1-BREAK-LEVL                             GENERATQ
#00777         MOVE 1 TO REPORT1-PFOOT-LEVL                             GENERATQ
#00777         PERFORM E00150-REPORT1-LV6-BREAK                         GENERATQ
#00777         PERFORM E00020-REPORT1-SAVE                              GENERATQ
#00777         MOVE ZERO TO REPORT1-BREAK-LEVL.                         GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 DETAIL LOGIC.          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777     PERFORM E00090-REPORT1-DTL-FORMULAS.                         GENERATQ
#00777     ADD S1-W-AMOUNT TO R01-LV6-W-AMOUNT.                         GENERATQ
#00777 E00010-REPORT1-MAINLINE-EXIT. EXIT.                              GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR SAVING REPORT1 FIELDS.         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00020-REPORT1-SAVE.                                             GENERATQ
#00777     MOVE S1-CRITERIA TO R01-SAV-CRITERIA.                        GENERATQ
#00777     MOVE S1-T-BANK TO R01-SAV-T-BANK.                            GENERATQ
#00777     MOVE S1-W-ASSIGNMENT TO R01-SAV-W-ASSIGNMENT.                GENERATQ
#00777     MOVE S1-WORK-TYPE TO R01-SAV-WORK-TYPE.                      GENERATQ
#00777     MOVE S1-ACCR-DATE TO R01-SAV-ACCR-DATE.                      GENERATQ
#00777     MOVE 'ACCR-DATE TOTAL' TO PENGI-CTLID.                       GENERATQ
#00777     MOVE R01-SAV-ACCR-DATE                                       GENERATQ
#00777          TO R01-EDT-ACCR-DATE                                    GENERATQ
#00777     MOVE R01-TXT-ACCR-DATE TO PENGI-CTL.                         GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR FINAL CONTROL BREAK.                                      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00030-REPORT1-LV1-FORMULAS.                                     GENERATQ
#00777     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00777     MOVE 'FINAL TOTAL ' TO PENGI-CTLID                           GENERATQ
#00777     MOVE ALL '*'  TO PENGI-CTL.                                  GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR CRITERIA CONTROL BREAK.                                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00040-REPORT1-LV2-FORMULAS.                                     GENERATQ
#00777     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00777     MOVE 'CRITERIA TOTAL' TO PENGI-CTLID                         GENERATQ
#00777     MOVE R01-SAV-CRITERIA                                        GENERATQ
#00777          TO R01-EDT-CRITERIA                                     GENERATQ
#00777     MOVE R01-TXT-CRITERIA TO PENGI-CTL.                          GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR T-BANK CONTROL BREAK.                                     * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00050-REPORT1-LV3-FORMULAS.                                     GENERATQ
#00777     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00777     MOVE 'T-BANK TOTAL' TO PENGI-CTLID                           GENERATQ
#00777     MOVE R01-SAV-T-BANK                                          GENERATQ
#00777          TO R01-EDT-T-BANK                                       GENERATQ
#00777     MOVE R01-TXT-T-BANK TO PENGI-CTL.                            GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR W-ASSIGNMENT CONTROL BREAK.                               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00060-REPORT1-LV4-FORMULAS.                                     GENERATQ
#00777     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00777     MOVE 'W-ASSIGNMENT TOTAL' TO PENGI-CTLID                     GENERATQ
#00777     MOVE R01-SAV-W-ASSIGNMENT                                    GENERATQ
#00777          TO R01-EDT-W-ASSIGNMENT                                 GENERATQ
#00777     MOVE R01-TXT-W-ASSIGNMENT TO PENGI-CTL.                      GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR WORK-TYPE CONTROL BREAK.                                  * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00070-REPORT1-LV5-FORMULAS.                                     GENERATQ
#00777     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00777     MOVE 'WORK-TYPE TOTAL' TO PENGI-CTLID                        GENERATQ
#00777     MOVE R01-SAV-WORK-TYPE                                       GENERATQ
#00777          TO R01-EDT-WORK-TYPE                                    GENERATQ
#00777     MOVE R01-TXT-WORK-TYPE TO PENGI-CTL.                         GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT1 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR ACCR-DATE CONTROL BREAK.                                  * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00080-REPORT1-LV6-FORMULAS.                                     GENERATQ
#00777     MOVE 'ACCR-DATE TOTAL' TO PENGI-CTLID                        GENERATQ
#00777     MOVE R01-SAV-ACCR-DATE                                       GENERATQ
#00777          TO R01-EDT-ACCR-DATE                                    GENERATQ
#00777     MOVE R01-TXT-ACCR-DATE TO PENGI-CTL.                         GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR REPORT1 DETAIL FORMULAS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00090-REPORT1-DTL-FORMULAS.                                     GENERATQ
#00777     ADD 1 TO REPORT1-COUNT.                                      GENERATQ
#00777     ADD PENGI-COUNT TO R01-LV6-PENGI-COUNT.                      GENERATQ
#00777     MOVE ZERO TO REPORT1-CTL-LEVEL.                              GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT1               * GENCTEXT
      * FINAL CONTROL BREAK AMENITIES.                                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00100-REPORT1-LV1-BREAK.                                        GENERATQ
#00777     PERFORM E00110-REPORT1-LV2-BREAK.                            GENERATQ
#00777     PERFORM E00030-REPORT1-LV1-FORMULAS.                         GENERATQ
#00777     MOVE ZERO TO REPORT1-LSEQ-CNTRL                              GENERATQ
#00777     MOVE SPACES TO F01-CF01-ACCR-DATE-Z                          GENERATQ
#00777     MOVE SPACES TO F01-CF01-WORK-TYPE                            GENERATQ
#00777     MOVE SPACES TO F01-CF01-W-ASSIGNMENT-Z                       GENERATQ
#00777     MOVE SPACES TO F01-CF01-T-BANK-Z                             GENERATQ
#00777     MOVE SPACES TO F01-CF01-CRITERIA-Z                           GENERATQ
#00777     MOVE R01-LV1-PENGI-COUNT TO F01-CF01-PENGI-COUNT             GENERATQ
#00777     MOVE R01-LV1-W-AMOUNT TO F01-CF01-W-AMOUNT                   GENERATQ
#00777                                                                  CHKOVF0
#00777     IF (R01-LV1-PENGI-COUNT > 99999)                             CHKOVF0
#00777     OR (R01-LV1-PENGI-COUNT < -99999)                            CHKOVF0
#00777        MOVE R01-LV1-PENGI-COUNT TO WS-PENGI-EDIT-5-0-1           CHKOVF0
#00777        MOVE WS-PENGI-EDIT-5-0-1 TO F01-CF01-PENGI-COUNT          CHKOVF0
#00777        (1:LENGTH OF F01-CF01-PENGI-COUNT)                        CHKOVF0
#00777        MOVE '*' TO F01-CF01-PENGI-COUNT                          CHKOVF0
#00777        (LENGTH OF F01-CF01-PENGI-COUNT:1)                        CHKOVF0
#00777     END-IF                                                       CHKOVF0
#00777                                                                  CHKOVF0
#00777     MOVE 1 TO REPORT1-ADV-CNTRL                                  GENERATQ
#00777     ADD  1 TO REPORT1-LSEQ-CNTRL                                 GENERATQ
#00777     PERFORM E00350-REPORT1-TEST-LMAX1                            GENERATQ
#00777                                                                  GENERATQ
#00777     MOVE ZERO TO REPORT1-PSKP-CNTRL                              GENERATQ
#00777     MOVE F01-CF01 TO REPORT1-PENGI-RECORD                        GENERATQ
#00777     PERFORM E00300-REPORT1-DO-IO0                                GENERATQ
#00777                                                                  GENERATQ
#00777     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00777     ADD REPORT1-DSKP-CNTRL TO REPORT1-LNXT-CNTRL.                GENERATQ
#00777     ADD REPORT1-CSKP-CNTRL TO REPORT1-LNXT-CNTRL                 GENERATQ
#00777     ADD 1 TO REPORT1-LSEQ-CNTRL                                  GENERATQ
#00777     IF REPORT1-RSKP-CNTRL NOT < REPORT1-PAGE-SIZE                GENERATQ
#00777        MOVE REPORT1-CSKP-CNTRL TO REPORT1-PSKP-CNTRL             GENERATQ
#00777     END-IF.                                                      GENERATQ
#00777     PERFORM E00160-REPORT1-CLEAR-LV1.                            GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT1               * GENCTEXT
      * CRITERIA CONTROL BREAK AMENITIES.                             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00110-REPORT1-LV2-BREAK.                                        GENERATQ
#00777     PERFORM E00120-REPORT1-LV3-BREAK.                            GENERATQ
#00777     PERFORM E00040-REPORT1-LV2-FORMULAS.                         GENERATQ
#00777     MOVE ZERO TO REPORT1-LSEQ-CNTRL                              GENERATQ
#00777     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00777     PERFORM E00170-REPORT1-CLEAR-LV2.                            GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT1               * GENCTEXT
      * T-BANK CONTROL BREAK AMENITIES.                               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00120-REPORT1-LV3-BREAK.                                        GENERATQ
#00777     PERFORM E00130-REPORT1-LV4-BREAK.                            GENERATQ
#00777     PERFORM E00050-REPORT1-LV3-FORMULAS.                         GENERATQ
#00777     MOVE ZERO TO REPORT1-LSEQ-CNTRL                              GENERATQ
#00777     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00777     PERFORM E00180-REPORT1-CLEAR-LV3.                            GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT1               * GENCTEXT
      * W-ASSIGNMENT CONTROL BREAK AMENITIES.                         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00130-REPORT1-LV4-BREAK.                                        GENERATQ
#00777     PERFORM E00140-REPORT1-LV5-BREAK.                            GENERATQ
#00777     PERFORM E00060-REPORT1-LV4-FORMULAS.                         GENERATQ
#00777     MOVE ZERO TO REPORT1-LSEQ-CNTRL                              GENERATQ
#00777     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00777     PERFORM E00190-REPORT1-CLEAR-LV4.                            GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT1               * GENCTEXT
      * WORK-TYPE CONTROL BREAK AMENITIES.                            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00140-REPORT1-LV5-BREAK.                                        GENERATQ
#00777     PERFORM E00150-REPORT1-LV6-BREAK.                            GENERATQ
#00777     PERFORM E00070-REPORT1-LV5-FORMULAS.                         GENERATQ
#00777     MOVE ZERO TO REPORT1-LSEQ-CNTRL                              GENERATQ
#00777     MOVE 'S' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00777     PERFORM E00200-REPORT1-CLEAR-LV5.                            GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT1               * GENCTEXT
      * ACCR-DATE CONTROL BREAK AMENITIES.                            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00150-REPORT1-LV6-BREAK.                                        GENERATQ
#00777     PERFORM E00080-REPORT1-LV6-FORMULAS.                         GENERATQ
#00777     MOVE ZERO TO REPORT1-LSEQ-CNTRL                              GENERATQ
#00777     MOVE 6 TO REPORT1-CTL-LEVEL.                                 GENERATQ
#00777     MOVE REPORT1-LEVEL6-BUCKETS TO REPORT1-LEVEL0-BUCKETS        GENERATQ
#00777     PERFORM A01190-JOB1-BLD-SMYFIL                               GENERATQ
#00777     MOVE 'N' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00777     PERFORM E00210-REPORT1-CLEAR-LV6.                            GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT1 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00160-REPORT1-CLEAR-LV1.                                        GENERATQ
#00777     INITIALIZE REPORT1-LEVEL1-BUCKETS.                           GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT1 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00170-REPORT1-CLEAR-LV2.                                        GENERATQ
#00777     ADD  R01-LV2-PENGI-COUNT TO R01-LV1-PENGI-COUNT              GENERATQ
#00777     ADD  R01-LV2-W-AMOUNT TO R01-LV1-W-AMOUNT                    GENERATQ
#00777     INITIALIZE REPORT1-LEVEL2-BUCKETS.                           GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT1 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00180-REPORT1-CLEAR-LV3.                                        GENERATQ
#00777     ADD  R01-LV3-PENGI-COUNT TO R01-LV2-PENGI-COUNT              GENERATQ
#00777     ADD  R01-LV3-W-AMOUNT TO R01-LV2-W-AMOUNT                    GENERATQ
#00777     INITIALIZE REPORT1-LEVEL3-BUCKETS.                           GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT1 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00190-REPORT1-CLEAR-LV4.                                        GENERATQ
#00777     ADD  R01-LV4-PENGI-COUNT TO R01-LV3-PENGI-COUNT              GENERATQ
#00777     ADD  R01-LV4-W-AMOUNT TO R01-LV3-W-AMOUNT                    GENERATQ
#00777     INITIALIZE REPORT1-LEVEL4-BUCKETS.                           GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT1 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00200-REPORT1-CLEAR-LV5.                                        GENERATQ
#00777     ADD  R01-LV5-PENGI-COUNT TO R01-LV4-PENGI-COUNT              GENERATQ
#00777     ADD  R01-LV5-W-AMOUNT TO R01-LV4-W-AMOUNT                    GENERATQ
#00777     INITIALIZE REPORT1-LEVEL5-BUCKETS.                           GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT1 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00210-REPORT1-CLEAR-LV6.                                        GENERATQ
#00777     ADD  R01-LV6-PENGI-COUNT TO R01-LV5-PENGI-COUNT              GENERATQ
#00777     ADD  R01-LV6-W-AMOUNT TO R01-LV5-W-AMOUNT                    GENERATQ
#00777     INITIALIZE REPORT1-LEVEL6-BUCKETS.                           GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR PRINTING REPORT1 HEADERS.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00220-REPORT1-HDR.                                              GENERATQ
#00777     ACCEPT PENGI-DATE-2 FROM DATE.                               GENERATQ
#00777     ACCEPT PENGI-TIME-2 FROM TIME.                               GENERATQ
#00777     MOVE 'Y' TO REPORT1-FOOTSW.                                  GENERATQ
#00777     MOVE 0 TO REPORT1-LINE0                                      GENERATQ
#00777                                                                  GENERATQ
#00777     IF REPORT1-PAGE-RENUM                                        GENERATQ
#00777        MOVE ZEROS TO REPORT1-PAGE0                               GENERATQ
#00777        MOVE SPACE TO REPORT1-PAGE-RENUM-SW                       GENERATQ
#00777     END-IF                                                       GENERATQ
#00777     ADD  1 TO REPORT1-PAGE0                                      GENERATQ
#00777     MOVE REPORT1-PAGE0 TO PENGI-PAGE.                            GENERATQ
#00777     ADD 1 TO REPORT1-LINE0                                       GENERATQ
#00777     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#00777     WRITE SYSPRINT-RECORD                                        PRINTSRV
#00777            FROM HD2-F01-CF01 AFTER ADVANCING CH1.                PRINTSRV
#00777     ADD 1 TO REPORT1-LINE0                                       GENERATQ
#00777     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#00777     WRITE SYSPRINT-RECORD                                        PRINTSRV
#00777            FROM HD1-F01-CF01 AFTER ADVANCING 1.                  PRINTSRV
#00777     MOVE 'H' TO REPORT1-PENGI-FIRST-SW.                          GENERATQ
#00777     MOVE REPORT1-LINE0 TO REPORT1-HSKP-CNTRL                     GENERATQ
#00777     PERFORM E00370-REPORT1-ADJUST-PAGE                           GENERATQ
#00777     MOVE REPORT1-LINE0 TO REPORT1-RSKP-CNTRL                     GENERATQ
#00777     MOVE REPORT1-L1ST-CNTRL TO REPORT1-LNXT-CNTRL.               GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED REPORT1 SORT HANDLING ROUTINE.                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00230-REPORT1-OUTPUT.                                           GENERATQ
#00777     MOVE 0 TO SORTFL1-IO-COUNT.                                  GENERATQ
#00777                                                                  GENERATQ
#00777 E00240-READ-TEMPWK1-REPORT1.                                     GENERATQ
#00777     RETURN SORTFL1 RECORD                                        GENERATQ
#00777         AT END MOVE '10' TO SORTFL1-STATUS.                      GENERATQ
#00777     MOVE 'Y' TO SORTFL1-ACCEPT-FLAG.                             GENERATQ
#00777     IF NOT END-OF-SORTFL1                                        GENERATQ
#00777         ADD 1 TO SORTFL1-IO-COUNT                                GENERATQ
#00777         PERFORM E00290-PRINT-SORTFL1-REPORTS                     GENERATQ
#00777         GO TO E00240-READ-TEMPWK1-REPORT1.                       GENERATQ
#00777 E00250-REPORT1-OUTPUT-EXIT. EXIT.                                GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED REPORT1 OPEN ROUTINE.                         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00260-REPORT1-OPEN.                                             GENERATQ
#00777     MOVE 'H' TO REPORT1-PENGI-FIRST-SW                           GENERATQ
#00777     COMPUTE SYSPRINT-RECORD-SIZE =                               GENERATQ
#00777               (SYSPRINT-RECORD-GSIZ)                             GENERATQ
#00777     IF SYSPRINT-IOSW = 'X'                                       GENERATQ
#00777     MOVE 'ALLOC SYSPRINT' TO WS-PENGI-SYSOUT-REQ                 GENERATQ
#00777     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             GENERATQ
#00777     OPEN OUTPUT SYSPRINT.                                        PRINTSRV
#00777     MOVE 'O' TO SYSPRINT-IOSW                                    GENERATQ
#00777     IF NOT SYSPRINT-GOOD-IO                                      GENERATQ
#00777         DISPLAY SYSPRINT-MESSAGE                                 GENERATQ
#00777         MOVE 3034 TO WS-PENGI-RETURN                             ABRCODE
#00777         MOVE SYSPRINT-MESSAGE TO ABEND-MESSAGE                   GENERATQ
#00777         PERFORM F00000-ABEND-CALL-FSABEC16.                      ABEND00
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED REPORT1 TERMINATION ROUTINES.                 * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00270-REPORT1-TERMINATE.                                        GENERATQ
#00777     IF TEMPWK1-IOSW = 'C'                                        GENERATQ
#00777         MOVE 'ALLOC TEMPWK1' TO WS-PENGI-ALLOC-REQ               GENERATQ
#00777         CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC          GENERATQ
#00777         OPEN OUTPUT TEMPWK1                                      GENERATQ
#00777         MOVE 'O' TO TEMPWK1-IOSW                                 GENERATQ
#00777         IF NOT TEMPWK1-GOOD-IO                                   GENERATQ
#00777             DISPLAY TEMPWK1-MESSAGE                              GENERATQ
#00777             MOVE 3035 TO WS-PENGI-RETURN                         ABRCODE
#00777             MOVE TEMPWK1-MESSAGE TO ABEND-MESSAGE                GENERATQ
#00777             PERFORM F00000-ABEND-CALL-FSABEC16.                  ABEND00
#00777                                                                  GENERATQ
#00777     MOVE 'C' TO TEMPWK1-IOSW                                     GENERATQ
#00777     CLOSE TEMPWK1.                                               GENERATQ
#00777     MOVE 'ALLOC SORTFL1' TO WS-PENGI-ALLOC-REQ                   GENERATQ
#00777     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC              GENERATQ
#00777     MOVE '00' TO SORTFL1-STATUS.                                 GENERATQ
#00777     SORT SORTFL1                                                 GENERATQ
#00777          ASCENDING  KEY S1-CRITERIA                              GENERATQ
#00777          ASCENDING  KEY S1-T-BANK                                GENERATQ
#00777          ASCENDING  KEY S1-W-ASSIGNMENT                          GENERATQ
#00777          ASCENDING  KEY S1-WORK-TYPE                             GENERATQ
#00777          ASCENDING  KEY S1-ACCR-DATE                             GENERATQ
#00777              USING TEMPWK1                                       GENERATQ
#00777          OUTPUT PROCEDURE IS                                     GENERATQ
#00777              E00230-REPORT1-OUTPUT                               GENERATQ
#00777                    THRU                                          GENERATQ
#00777              E00250-REPORT1-OUTPUT-EXIT.                         GENERATQ
#00777                                                                  GENERATQ
#00777     IF SORT-RETURN NOT EQUAL ZERO                                GENERATQ
#00777         MOVE SORT-RETURN TO WS-PENGI-SORT-RETURN                 GENERATQ
#00777         STRING 'REPORT1: SORT ERROR, SORT-RETURN='               GENERATQ
#00777                                      DELIMITED BY SIZE           GENERATQ
#00777                 WS-PENGI-SORT-RETURN DELIMITED BY SIZE           GENERATQ
#00777            INTO ABEND-MESSAGE                                    GENERATQ
#00777         MOVE 3036 TO WS-PENGI-RETURN                             ABRCODE
#00777         PERFORM F00000-ABEND-CALL-FSABEC16                       ABEND00
#00777     END-IF.                                                      GENERATQ
#00777                                                                  GENERATQ
#00777     MOVE 'DEALLOC SORTFL1' TO WS-PENGI-DEALLOC-REQ               GENERATQ
#00777     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-DEALLOC            GENERATQ
#00777     MOVE 'DEALLOC TEMPWK1' TO WS-PENGI-DEALLOC-REQ               GENERATQ
#00777     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-DEALLOC            GENERATQ
#00777     IF SYSPRINT-IOSW NOT = 'O'                                   GENERATQ
#00777         PERFORM E00260-REPORT1-OPEN.                             GENERATQ
#00777     MOVE 6 TO REPORT1-BREAK-LEVL                                 GENERATQ
#00777     MOVE 'Y' TO REPORT1-FINL-CNTRL                               GENERATQ
#00777     MOVE REPORT1-BREAK-LEVL TO REPORT1-PFOOT-LEVL                GENERATQ
#00777                                                                  GENERATQ
#00777     PERFORM E00100-REPORT1-LV1-BREAK                             GENERATQ
#00777     MOVE ZERO TO REPORT1-CTL-LEVEL                               GENERATQ
#00777     IF REPORT1-LNXT-CNTRL NOT = ZERO                             GENERATQ
#00777        MOVE SPACES TO REPORT1-PENGI-RECORD                       GENERATQ
#00777        PERFORM E00310-REPORT1-DO-IO1-A                           GENERATQ
#00777        PERFORM E00320-REPORT1-DO-IO2-A                           GENERATQ
#00777        MOVE ZERO TO REPORT1-ADV-CNTRL                            GENERATQ
#00777        MOVE ZERO TO REPORT1-LNXT-CNTRL                           GENERATQ
#00777     END-IF                                                       GENERATQ
#00777     MOVE 0 TO REPORT1-COUNT, REPORT1-PAGE0.                      GENERATQ
#00777     MOVE SPACE TO REPORT1-PAGE-RENUM-SW.                         GENERATQ
#00777     MOVE REPORT1-LMAX0 TO REPORT1-LINE0.                         GENERATQ
#00777     IF SYSPRINT-IO-COUNT < ZERO                                  GENERATQ
#00777        PERFORM E00330-REPORT1-DO-IO-CH1                          GENERATQ
#00777     END-IF.                                                      GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR BUILDING TEMPWK1               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00280-REPORT1-BLD-TEMPWK1.                                      GENERATQ
#00777     MOVE CRITERIA             TO T1-CRITERIA.                    GENERATQ
#00777     MOVE T-BANK               TO T1-T-BANK.                      GENERATQ
#00777     MOVE W-ASSIGNMENT         TO T1-W-ASSIGNMENT.                GENERATQ
#00777     MOVE WORK-TYPE            TO T1-WORK-TYPE.                   GENERATQ
#00777     MOVE ACCR-DATE            TO T1-ACCR-DATE.                   GENERATQ
#00777     MOVE W-AMOUNT             TO T1-W-AMOUNT.                    GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR PRINTING REPORTS USING         * GENCTEXT
      * SORTED DATA ON SORTFL1 FILE.                                  * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00290-PRINT-SORTFL1-REPORTS.                                    GENERATQ
#00777     PERFORM E00000-REPORT1-MAINLINE                              GENERATQ
#00777         THRU E00010-REPORT1-MAINLINE-EXIT.                       GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI COMMON I/O LOGIC FOR HANDLING REPORT1                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00777 E00300-REPORT1-DO-IO0.                                           GENERATQ
#00777     IF REPORT1-PENGI-RECORD = SPACES                             GENERATQ
#00777        ADD REPORT1-ADV-CNTRL TO REPORT1-LNXT-CNTRL               GENERATQ
#00777        MOVE ZERO TO REPORT1-ADV-CNTRL                            GENERATQ
#00777     ELSE                                                         GENERATQ
#00777        ADD REPORT1-ADV-CNTRL TO REPORT1-LNXT-CNTRL               GENERATQ
#00777        PERFORM E00310-REPORT1-DO-IO1-A                           GENERATQ
#00777        PERFORM E00320-REPORT1-DO-IO2-A                           GENERATQ
#00777        MOVE ZERO TO REPORT1-LNXT-CNTRL                           GENERATQ
#00777        MOVE ZERO TO REPORT1-ADV-CNTRL                            GENERATQ
#00777     END-IF.                                                      GENERATQ
#00777                                                                  GENERATQ
#00777* THIS ROUTINE ADVANCES PRINTING TO MAKE SURE THAT THERE IS NO    GENERATQ
#00777* MORE THAN 3 OUTSTANDING BLANK LINES TO PRINT.                   GENERATQ
#00777*                                                                 GENERATQ
#00777* INPUT : REPORT1-NXT-CNTRL FOR NUMBER OF LINES TO ADVANCE.       GENERATQ
#00777* OUTPUT: REPORT1-ADV-CNTRL FOR THE REMAINING # OF LINES.         GENERATQ
#00777                                                                  GENERATQ
#00777 E00310-REPORT1-DO-IO1-A.                                         GENERATQ
#00777     PERFORM TEST BEFORE UNTIL REPORT1-LNXT-CNTRL <= 3            GENERATQ
#00777        SUBTRACT 3 FROM REPORT1-LNXT-CNTRL                        GENERATQ
#00777        MOVE SPACES TO SYSPRINT-RECORD                            GENERATQ
#00777        ADD 1 TO SYSPRINT-IO-COUNT                                GENERATQ
#00777        WRITE SYSPRINT-RECORD                                     PRINTSRV
#00777               AFTER ADVANCING 3                                  PRINTSRV
#00777        PERFORM E00360-REPORT1-TEST-IO-ERR                        GENERATQ
#00777        ADD 3 TO REPORT1-LINE0                                    GENERATQ
#00777        ADD 3 TO REPORT1-RSKP-CNTRL                               GENERATQ
#00777     END-PERFORM.                                                 GENERATQ
#00777     MOVE REPORT1-LNXT-CNTRL TO REPORT1-ADV-CNTRL.                GENERATQ
#00777* I/O ROUTINE FOR PRINTING FROM THE REPORT WORK AREA.             GENERATQ
#00777* INPUT : REPORT1-ADV-CNTRL FOR #OF LINES TO ADVANCE              GENERATQ
#00777*         REPORT1-PENGI-RECORD CONTAINS DATA TO PRINT             GENERATQ
#00777                                                                  GENERATQ
#00777 E00320-REPORT1-DO-IO2-A.                                         GENERATQ
#00777     ADD REPORT1-ADV-CNTRL TO REPORT1-LINE0                       GENERATQ
#00777     ADD REPORT1-ADV-CNTRL TO REPORT1-RSKP-CNTRL                  GENERATQ
#00777     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#00777     WRITE SYSPRINT-RECORD                                        PRINTSRV
#00777            FROM REPORT1-PENGI-RECORD AFTER ADVANCING             PRINTSRV
                  REPORT1-ADV-CNTRL.                                    PRINTSRV
#00777     PERFORM E00360-REPORT1-TEST-IO-ERR.                          GENERATQ
#00777                                                                  GENERATQ
#00777* I/O ROUTINE FOR PRINTING TO CH1.                                GENERATQ
#00777* INPUT : REPORT1-ADV-CNTRL FOR #OF LINES TO COUNT                GENERATQ
#00777*         SYSPRINT-RECORD CONTAINS DATA TO PRINT.                 GENERATQ
#00777                                                                  GENERATQ
#00777 E00330-REPORT1-DO-IO-CH1.                                        GENERATQ
#00777     ADD REPORT1-ADV-CNTRL TO REPORT1-LINE0                       GENERATQ
#00777     ADD REPORT1-ADV-CNTRL TO REPORT1-RSKP-CNTRL                  GENERATQ
#00777     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#00777     WRITE SYSPRINT-RECORD                                        PRINTSRV
#00777            AFTER ADVANCING CH1                                   PRINTSRV
#00777                                                                  GENERATQ
#00777     PERFORM E00360-REPORT1-TEST-IO-ERR.                          GENERATQ
#00777                                                                  GENERATQ
#00777* MAIN OVERFLOW ROUTINE FOR DETAIL AND TOTAL PRINTING.            GENERATQ
#00777* INPUT : REPORT1-LNXT-CNTRL CONTAINS #OF OUTSTANDING LINES.      GENERATQ
#00777*         REPORT1-ADV-CNTRL #OF LINES TO ADVANCE FOR THIS I/O.    GENERATQ
#00777                                                                  GENERATQ
#00777 E00350-REPORT1-TEST-LMAX1.                                       GENERATQ
#00777     IF REPORT1-LSEQ-CNTRL < 2                                    GENERATQ
#00777        COMPUTE REPORT1-WSKP-CNTRL = REPORT1-LINE0 +              GENERATQ
#00777                REPORT1-ADV-CNTRL + REPORT1-LNXT-CNTRL            GENERATQ
#00777        IF REPORT1-WSKP-CNTRL > REPORT1-LMAX1                     GENERATQ
#00777           ADD REPORT1-ADV-CNTRL TO REPORT1-LNXT-CNTRL            GENERATQ
#00777           MOVE ZERO TO REPORT1-ADV-CNTRL                         GENERATQ
#00777           PERFORM E00220-REPORT1-HDR                             GENERATQ
#00777           MOVE 1 TO REPORT1-ADV-CNTRL                            GENERATQ
#00777           MOVE ZERO TO REPORT1-LNXT-CNTRL                        GENERATQ
#00777           ADD REPORT1-HOFF-CNTRL TO REPORT1-ADV-CNTRL            GENERATQ
#00777        END-IF                                                    GENERATQ
#00777     ELSE                                                         GENERATQ
#00777        COMPUTE REPORT1-WSKP-CNTRL = REPORT1-LINE0 +              GENERATQ
#00777                REPORT1-ADV-CNTRL + REPORT1-LNXT-CNTRL            GENERATQ
#00777        IF REPORT1-WSKP-CNTRL > REPORT1-LMAX1                     GENERATQ
#00777           COMPUTE REPORT1-ADV-CNTRL =                            GENERATQ
#00777                   REPORT1-WSKP-CNTRL - REPORT1-LMAX1             GENERATQ
#00777           MOVE ZERO TO REPORT1-LNXT-CNTRL                        GENERATQ
#00777           IF REPORT1-LINE0 > REPORT1-LMAX1                       GENERATQ
#00777              MOVE 1 TO REPORT1-ADV-CNTRL                         GENERATQ
#00777           END-IF                                                 GENERATQ
#00777           PERFORM E00220-REPORT1-HDR                             GENERATQ
#00777           ADD REPORT1-LNXT-CNTRL TO REPORT1-ADV-CNTRL            GENERATQ
#00777           MOVE ZERO TO REPORT1-LNXT-CNTRL                        GENERATQ
#00777        END-IF                                                    GENERATQ
#00777     END-IF.                                                      GENERATQ
#00777                                                                  GENERATQ
#00777* PRINTER I/O ERROR HANDLING ROUTINE.                             GENERATQ
#00777                                                                  GENERATQ
#00777 E00360-REPORT1-TEST-IO-ERR.                                      GENERATQ
#00777     IF NOT SYSPRINT-GOOD-IO                                      GENERATQ
#00777         DISPLAY SYSPRINT-MESSAGE                                 GENERATQ
#00777         MOVE 3039 TO WS-PENGI-RETURN                             ABRCODE
#00777         MOVE SYSPRINT-MESSAGE TO ABEND-MESSAGE                   GENERATQ
#00777         PERFORM F00000-ABEND-CALL-FSABEC16.                      ABEND00
#00777                                                                  GENERATQ
#00777* COMPUTE MAXIMUM PAGE LINES THAT CAN FIT IN THE PAGESIZE AREA    GENERATQ
#00777* ROUTINE IS INVOKED FROM THE REPORT HEADER PROCESSING ROUTINE.   GENERATQ
#00777                                                                  GENERATQ
#00777 E00370-REPORT1-ADJUST-PAGE.                                      GENERATQ
#00777     COMPUTE REPORT1-LMAX0 = REPORT1-LMAX1                        GENERATQ
#00777     COMPUTE REPORT1-LMAX2 = REPORT1-LMAX1 - 1                    GENERATQ
#00777     COMPUTE REPORT1-LMAX3 = REPORT1-LMAX1 - 2.                   GENERATQ
#00777                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      *           ++ END OF GENERATED CODE FOR REPORT1 ++             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457                                                                  GENERATQ
#01457     EJECT                                                        GENERATQ
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT2 MAIN LINE.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01000-REPORT2-MAINLINE.                                         GENERATQ
#01457     MOVE 'N' TO REPORT2-FINL-CNTRL                               GENERATQ
#01457     MOVE ZERO TO REPORT2-CTL-LEVEL.                              GENERATQ
#01457     IF SYSPRINT-IOSW = 'C'                                       GENERATQ
#01457         PERFORM E01260-REPORT2-OPEN                              GENERATQ
#01457         PERFORM E01020-REPORT2-SAVE                              GENERATQ
#01457     ELSE                                                         GENERATQ
#01457     IF REPORT2-COUNT = 0                                         GENERATQ
#01457         PERFORM E01020-REPORT2-SAVE.                             GENERATQ
#01457                                                                  GENERATQ
#01457     IF R02-SAV-CRITERIA NOT = S2-CRITERIA                        GENERATQ
#01457         MOVE 5 TO REPORT2-BREAK-LEVL                             GENERATQ
#01457         MOVE 5 TO REPORT2-PFOOT-LEVL                             GENERATQ
#01457         PERFORM E01110-REPORT2-LV2-BREAK                         GENERATQ
#01457         PERFORM E01020-REPORT2-SAVE                              GENERATQ
#01457         MOVE ZERO TO REPORT2-BREAK-LEVL                          GENERATQ
#01457     ELSE                                                         GENERATQ
#01457     IF R02-SAV-W-BANK NOT = S2-W-BANK                            GENERATQ
#01457         MOVE 4 TO REPORT2-BREAK-LEVL                             GENERATQ
#01457         MOVE 4 TO REPORT2-PFOOT-LEVL                             GENERATQ
#01457         PERFORM E01120-REPORT2-LV3-BREAK                         GENERATQ
#01457         PERFORM E01020-REPORT2-SAVE                              GENERATQ
#01457         MOVE ZERO TO REPORT2-BREAK-LEVL                          GENERATQ
#01457     ELSE                                                         GENERATQ
#01457     IF R02-SAV-W-ASSIGNMENT NOT = S2-W-ASSIGNMENT                GENERATQ
#01457         MOVE 3 TO REPORT2-BREAK-LEVL                             GENERATQ
#01457         MOVE 3 TO REPORT2-PFOOT-LEVL                             GENERATQ
#01457         PERFORM E01130-REPORT2-LV4-BREAK                         GENERATQ
#01457         PERFORM E01020-REPORT2-SAVE                              GENERATQ
#01457         MOVE ZERO TO REPORT2-BREAK-LEVL                          GENERATQ
#01457     ELSE                                                         GENERATQ
#01457     IF R02-SAV-WORK-TYPE NOT = S2-WORK-TYPE                      GENERATQ
#01457         MOVE 2 TO REPORT2-BREAK-LEVL                             GENERATQ
#01457         MOVE 2 TO REPORT2-PFOOT-LEVL                             GENERATQ
#01457         PERFORM E01140-REPORT2-LV5-BREAK                         GENERATQ
#01457         PERFORM E01020-REPORT2-SAVE                              GENERATQ
#01457         MOVE ZERO TO REPORT2-BREAK-LEVL                          GENERATQ
#01457     ELSE                                                         GENERATQ
#01457     IF R02-SAV-ACCR-DATE NOT = S2-ACCR-DATE                      GENERATQ
#01457         MOVE 1 TO REPORT2-BREAK-LEVL                             GENERATQ
#01457         MOVE 1 TO REPORT2-PFOOT-LEVL                             GENERATQ
#01457         PERFORM E01150-REPORT2-LV6-BREAK                         GENERATQ
#01457         PERFORM E01020-REPORT2-SAVE                              GENERATQ
#01457         MOVE ZERO TO REPORT2-BREAK-LEVL.                         GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT2 DETAIL LOGIC.          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457     PERFORM E01090-REPORT2-DTL-FORMULAS.                         GENERATQ
#01457     ADD S2-W-AMOUNT TO R02-LV6-W-AMOUNT.                         GENERATQ
#01457 E01010-REPORT2-MAINLINE-EXIT. EXIT.                              GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR SAVING REPORT2 FIELDS.         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01020-REPORT2-SAVE.                                             GENERATQ
#01457     MOVE S2-CRITERIA TO R02-SAV-CRITERIA.                        GENERATQ
#01457     MOVE S2-W-BANK TO R02-SAV-W-BANK.                            GENERATQ
#01457     MOVE S2-W-ASSIGNMENT TO R02-SAV-W-ASSIGNMENT.                GENERATQ
#01457     MOVE S2-WORK-TYPE TO R02-SAV-WORK-TYPE.                      GENERATQ
#01457     MOVE S2-ACCR-DATE TO R02-SAV-ACCR-DATE.                      GENERATQ
#01457     MOVE 'ACCR-DATE TOTAL' TO PENGI-CTLID.                       GENERATQ
#01457     MOVE R02-SAV-ACCR-DATE                                       GENERATQ
#01457          TO R02-EDT-ACCR-DATE                                    GENERATQ
#01457     MOVE R02-TXT-ACCR-DATE TO PENGI-CTL.                         GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT2 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR FINAL CONTROL BREAK.                                      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01030-REPORT2-LV1-FORMULAS.                                     GENERATQ
#01457     MOVE 'S' TO REPORT2-PENGI-FIRST-SW.                          GENERATQ
#01457     MOVE 'FINAL TOTAL ' TO PENGI-CTLID                           GENERATQ
#01457     MOVE ALL '*'  TO PENGI-CTL.                                  GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT2 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR CRITERIA CONTROL BREAK.                                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01040-REPORT2-LV2-FORMULAS.                                     GENERATQ
#01457     MOVE 'S' TO REPORT2-PENGI-FIRST-SW.                          GENERATQ
#01457     MOVE 'CRITERIA TOTAL' TO PENGI-CTLID                         GENERATQ
#01457     MOVE R02-SAV-CRITERIA                                        GENERATQ
#01457          TO R02-EDT-CRITERIA                                     GENERATQ
#01457     MOVE R02-TXT-CRITERIA TO PENGI-CTL.                          GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT2 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR W-BANK CONTROL BREAK.                                     * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01050-REPORT2-LV3-FORMULAS.                                     GENERATQ
#01457     MOVE 'S' TO REPORT2-PENGI-FIRST-SW.                          GENERATQ
#01457     MOVE 'W-BANK TOTAL' TO PENGI-CTLID                           GENERATQ
#01457     MOVE R02-SAV-W-BANK                                          GENERATQ
#01457          TO R02-EDT-W-BANK                                       GENERATQ
#01457     MOVE R02-TXT-W-BANK TO PENGI-CTL.                            GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT2 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR W-ASSIGNMENT CONTROL BREAK.                               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01060-REPORT2-LV4-FORMULAS.                                     GENERATQ
#01457     MOVE 'S' TO REPORT2-PENGI-FIRST-SW.                          GENERATQ
#01457     MOVE 'W-ASSIGNMENT TOTAL' TO PENGI-CTLID                     GENERATQ
#01457     MOVE R02-SAV-W-ASSIGNMENT                                    GENERATQ
#01457          TO R02-EDT-W-ASSIGNMENT                                 GENERATQ
#01457     MOVE R02-TXT-W-ASSIGNMENT TO PENGI-CTL.                      GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT2 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR WORK-TYPE CONTROL BREAK.                                  * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01070-REPORT2-LV5-FORMULAS.                                     GENERATQ
#01457     MOVE 'S' TO REPORT2-PENGI-FIRST-SW.                          GENERATQ
#01457     MOVE 'WORK-TYPE TOTAL' TO PENGI-CTLID                        GENERATQ
#01457     MOVE R02-SAV-WORK-TYPE                                       GENERATQ
#01457          TO R02-EDT-WORK-TYPE                                    GENERATQ
#01457     MOVE R02-TXT-WORK-TYPE TO PENGI-CTL.                         GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR REPORT2 CONTROL BREAK FORMULAS * GENCTEXT
      * FOR ACCR-DATE CONTROL BREAK.                                  * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01080-REPORT2-LV6-FORMULAS.                                     GENERATQ
#01457     MOVE 'ACCR-DATE TOTAL' TO PENGI-CTLID                        GENERATQ
#01457     MOVE R02-SAV-ACCR-DATE                                       GENERATQ
#01457          TO R02-EDT-ACCR-DATE                                    GENERATQ
#01457     MOVE R02-TXT-ACCR-DATE TO PENGI-CTL.                         GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR REPORT2 DETAIL FORMULAS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01090-REPORT2-DTL-FORMULAS.                                     GENERATQ
#01457     ADD 1 TO REPORT2-COUNT.                                      GENERATQ
#01457     ADD PENGI-COUNT TO R02-LV6-PENGI-COUNT.                      GENERATQ
#01457     MOVE ZERO TO REPORT2-CTL-LEVEL.                              GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT2               * GENCTEXT
      * FINAL CONTROL BREAK AMENITIES.                                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01100-REPORT2-LV1-BREAK.                                        GENERATQ
#01457     PERFORM E01110-REPORT2-LV2-BREAK.                            GENERATQ
#01457     PERFORM E01030-REPORT2-LV1-FORMULAS.                         GENERATQ
#01457     MOVE ZERO TO REPORT2-LSEQ-CNTRL                              GENERATQ
#01457     MOVE SPACES TO F02-CF01-ACCR-DATE-Z                          GENERATQ
#01457     MOVE SPACES TO F02-CF01-WORK-TYPE                            GENERATQ
#01457     MOVE SPACES TO F02-CF01-W-ASSIGNMENT-Z                       GENERATQ
#01457     MOVE SPACES TO F02-CF01-W-BANK-Z                             GENERATQ
#01457     MOVE SPACES TO F02-CF01-CRITERIA-Z                           GENERATQ
#01457     MOVE R02-LV1-PENGI-COUNT TO F02-CF01-PENGI-COUNT             GENERATQ
#01457     MOVE R02-LV1-W-AMOUNT TO F02-CF01-W-AMOUNT                   GENERATQ
#01457                                                                  CHKOVF0
#01457     IF (R02-LV1-PENGI-COUNT > 99999)                             CHKOVF0
#01457     OR (R02-LV1-PENGI-COUNT < -99999)                            CHKOVF0
#01457        MOVE R02-LV1-PENGI-COUNT TO WS-PENGI-EDIT-5-0-1           CHKOVF0
#01457        MOVE WS-PENGI-EDIT-5-0-1 TO F02-CF01-PENGI-COUNT          CHKOVF0
#01457        (1:LENGTH OF F02-CF01-PENGI-COUNT)                        CHKOVF0
#01457        MOVE '*' TO F02-CF01-PENGI-COUNT                          CHKOVF0
#01457        (LENGTH OF F02-CF01-PENGI-COUNT:1)                        CHKOVF0
#01457     END-IF                                                       CHKOVF0
#01457                                                                  CHKOVF0
#01457     MOVE 1 TO REPORT2-ADV-CNTRL                                  GENERATQ
#01457     ADD  1 TO REPORT2-LSEQ-CNTRL                                 GENERATQ
#01457     PERFORM E01350-REPORT2-TEST-LMAX1                            GENERATQ
#01457                                                                  GENERATQ
#01457     MOVE ZERO TO REPORT2-PSKP-CNTRL                              GENERATQ
#01457     MOVE F02-CF01 TO REPORT2-PENGI-RECORD                        GENERATQ
#01457     PERFORM E01300-REPORT2-DO-IO0                                GENERATQ
#01457                                                                  GENERATQ
#01457     MOVE 'S' TO REPORT2-PENGI-FIRST-SW.                          GENERATQ
#01457     ADD REPORT2-DSKP-CNTRL TO REPORT2-LNXT-CNTRL.                GENERATQ
#01457     ADD REPORT2-CSKP-CNTRL TO REPORT2-LNXT-CNTRL                 GENERATQ
#01457     ADD 1 TO REPORT2-LSEQ-CNTRL                                  GENERATQ
#01457     IF REPORT2-RSKP-CNTRL NOT < REPORT2-PAGE-SIZE                GENERATQ
#01457        MOVE REPORT2-CSKP-CNTRL TO REPORT2-PSKP-CNTRL             GENERATQ
#01457     END-IF.                                                      GENERATQ
#01457     PERFORM E01160-REPORT2-CLEAR-LV1.                            GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT2               * GENCTEXT
      * CRITERIA CONTROL BREAK AMENITIES.                             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01110-REPORT2-LV2-BREAK.                                        GENERATQ
#01457     PERFORM E01120-REPORT2-LV3-BREAK.                            GENERATQ
#01457     PERFORM E01040-REPORT2-LV2-FORMULAS.                         GENERATQ
#01457     MOVE ZERO TO REPORT2-LSEQ-CNTRL                              GENERATQ
#01457     MOVE 'S' TO REPORT2-PENGI-FIRST-SW.                          GENERATQ
#01457     PERFORM E01170-REPORT2-CLEAR-LV2.                            GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT2               * GENCTEXT
      * W-BANK CONTROL BREAK AMENITIES.                               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01120-REPORT2-LV3-BREAK.                                        GENERATQ
#01457     PERFORM E01130-REPORT2-LV4-BREAK.                            GENERATQ
#01457     PERFORM E01050-REPORT2-LV3-FORMULAS.                         GENERATQ
#01457     MOVE ZERO TO REPORT2-LSEQ-CNTRL                              GENERATQ
#01457     MOVE 'S' TO REPORT2-PENGI-FIRST-SW.                          GENERATQ
#01457     PERFORM E01180-REPORT2-CLEAR-LV3.                            GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT2               * GENCTEXT
      * W-ASSIGNMENT CONTROL BREAK AMENITIES.                         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01130-REPORT2-LV4-BREAK.                                        GENERATQ
#01457     PERFORM E01140-REPORT2-LV5-BREAK.                            GENERATQ
#01457     PERFORM E01060-REPORT2-LV4-FORMULAS.                         GENERATQ
#01457     MOVE ZERO TO REPORT2-LSEQ-CNTRL                              GENERATQ
#01457     MOVE 'S' TO REPORT2-PENGI-FIRST-SW.                          GENERATQ
#01457     PERFORM E01190-REPORT2-CLEAR-LV4.                            GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT2               * GENCTEXT
      * WORK-TYPE CONTROL BREAK AMENITIES.                            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01140-REPORT2-LV5-BREAK.                                        GENERATQ
#01457     PERFORM E01150-REPORT2-LV6-BREAK.                            GENERATQ
#01457     PERFORM E01070-REPORT2-LV5-FORMULAS.                         GENERATQ
#01457     MOVE ZERO TO REPORT2-LSEQ-CNTRL                              GENERATQ
#01457     MOVE 'S' TO REPORT2-PENGI-FIRST-SW.                          GENERATQ
#01457     PERFORM E01200-REPORT2-CLEAR-LV5.                            GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR HANDLING REPORT2               * GENCTEXT
      * ACCR-DATE CONTROL BREAK AMENITIES.                            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01150-REPORT2-LV6-BREAK.                                        GENERATQ
#01457     PERFORM E01080-REPORT2-LV6-FORMULAS.                         GENERATQ
#01457     MOVE ZERO TO REPORT2-LSEQ-CNTRL                              GENERATQ
#01457     MOVE 6 TO REPORT2-CTL-LEVEL.                                 GENERATQ
#01457     MOVE REPORT2-LEVEL6-BUCKETS TO REPORT2-LEVEL0-BUCKETS        GENERATQ
#01457     PERFORM A02420-JOB2-BLD-SMYFIL2                              GENERATQ
#01457     MOVE 'N' TO REPORT2-PENGI-FIRST-SW.                          GENERATQ
#01457     PERFORM E01210-REPORT2-CLEAR-LV6.                            GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT2 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01160-REPORT2-CLEAR-LV1.                                        GENERATQ
#01457     INITIALIZE REPORT2-LEVEL1-BUCKETS.                           GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT2 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01170-REPORT2-CLEAR-LV2.                                        GENERATQ
#01457     ADD  R02-LV2-PENGI-COUNT TO R02-LV1-PENGI-COUNT              GENERATQ
#01457     ADD  R02-LV2-W-AMOUNT TO R02-LV1-W-AMOUNT                    GENERATQ
#01457     INITIALIZE REPORT2-LEVEL2-BUCKETS.                           GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT2 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01180-REPORT2-CLEAR-LV3.                                        GENERATQ
#01457     ADD  R02-LV3-PENGI-COUNT TO R02-LV2-PENGI-COUNT              GENERATQ
#01457     ADD  R02-LV3-W-AMOUNT TO R02-LV2-W-AMOUNT                    GENERATQ
#01457     INITIALIZE REPORT2-LEVEL3-BUCKETS.                           GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT2 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01190-REPORT2-CLEAR-LV4.                                        GENERATQ
#01457     ADD  R02-LV4-PENGI-COUNT TO R02-LV3-PENGI-COUNT              GENERATQ
#01457     ADD  R02-LV4-W-AMOUNT TO R02-LV3-W-AMOUNT                    GENERATQ
#01457     INITIALIZE REPORT2-LEVEL4-BUCKETS.                           GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT2 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01200-REPORT2-CLEAR-LV5.                                        GENERATQ
#01457     ADD  R02-LV5-PENGI-COUNT TO R02-LV4-PENGI-COUNT              GENERATQ
#01457     ADD  R02-LV5-W-AMOUNT TO R02-LV4-W-AMOUNT                    GENERATQ
#01457     INITIALIZE REPORT2-LEVEL5-BUCKETS.                           GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED CODE FOR CLEARING REPORT2 FIELDS.             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01210-REPORT2-CLEAR-LV6.                                        GENERATQ
#01457     ADD  R02-LV6-PENGI-COUNT TO R02-LV5-PENGI-COUNT              GENERATQ
#01457     ADD  R02-LV6-W-AMOUNT TO R02-LV5-W-AMOUNT                    GENERATQ
#01457     INITIALIZE REPORT2-LEVEL6-BUCKETS.                           GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR PRINTING REPORT2 HEADERS.      * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01220-REPORT2-HDR.                                              GENERATQ
#01457     ACCEPT PENGI-DATE-2 FROM DATE.                               GENERATQ
#01457     ACCEPT PENGI-TIME-2 FROM TIME.                               GENERATQ
#01457     MOVE 'Y' TO REPORT2-FOOTSW.                                  GENERATQ
#01457     MOVE 0 TO REPORT2-LINE0                                      GENERATQ
#01457                                                                  GENERATQ
#01457     IF REPORT2-PAGE-RENUM                                        GENERATQ
#01457        MOVE ZEROS TO REPORT2-PAGE0                               GENERATQ
#01457        MOVE SPACE TO REPORT2-PAGE-RENUM-SW                       GENERATQ
#01457     END-IF                                                       GENERATQ
#01457     ADD  1 TO REPORT2-PAGE0                                      GENERATQ
#01457     MOVE REPORT2-PAGE0 TO PENGI-PAGE.                            GENERATQ
#01457     ADD 1 TO REPORT2-LINE0                                       GENERATQ
#01457     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#01457     WRITE SYSPRINT-RECORD                                        PRINTSRV
#01457            FROM HD2-F02-CF01 AFTER ADVANCING CH1.                PRINTSRV
#01457     ADD 1 TO REPORT2-LINE0                                       GENERATQ
#01457     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#01457     WRITE SYSPRINT-RECORD                                        PRINTSRV
#01457            FROM HD1-F02-CF01 AFTER ADVANCING 1.                  PRINTSRV
#01457     MOVE 'H' TO REPORT2-PENGI-FIRST-SW.                          GENERATQ
#01457     MOVE REPORT2-LINE0 TO REPORT2-HSKP-CNTRL                     GENERATQ
#01457     PERFORM E01370-REPORT2-ADJUST-PAGE                           GENERATQ
#01457     MOVE REPORT2-LINE0 TO REPORT2-RSKP-CNTRL                     GENERATQ
#01457     MOVE REPORT2-L1ST-CNTRL TO REPORT2-LNXT-CNTRL.               GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED REPORT2 SORT HANDLING ROUTINE.                * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01230-REPORT2-OUTPUT.                                           GENERATQ
#01457     MOVE 0 TO SORTFL2-IO-COUNT.                                  GENERATQ
#01457                                                                  GENERATQ
#01457 E01240-READ-TEMPWK2-REPORT2.                                     GENERATQ
#01457     RETURN SORTFL2 RECORD                                        GENERATQ
#01457         AT END MOVE '10' TO SORTFL2-STATUS.                      GENERATQ
#01457     MOVE 'Y' TO SORTFL2-ACCEPT-FLAG.                             GENERATQ
#01457     IF NOT END-OF-SORTFL2                                        GENERATQ
#01457         ADD 1 TO SORTFL2-IO-COUNT                                GENERATQ
#01457         PERFORM E01290-PRINT-SORTFL2-REPORTS                     GENERATQ
#01457         GO TO E01240-READ-TEMPWK2-REPORT2.                       GENERATQ
#01457 E01250-REPORT2-OUTPUT-EXIT. EXIT.                                GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED REPORT2 OPEN ROUTINE.                         * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01260-REPORT2-OPEN.                                             GENERATQ
#01457     MOVE 'H' TO REPORT2-PENGI-FIRST-SW                           GENERATQ
#01457     COMPUTE SYSPRINT-RECORD-SIZE =                               GENERATQ
#01457               (SYSPRINT-RECORD-GSIZ)                             GENERATQ
#01457     IF SYSPRINT-IOSW = 'X'                                       GENERATQ
#01457     MOVE 'ALLOC SYSPRINT' TO WS-PENGI-SYSOUT-REQ                 GENERATQ
#01457     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             GENERATQ
#01457     OPEN OUTPUT SYSPRINT.                                        PRINTSRV
#01457     MOVE 'O' TO SYSPRINT-IOSW                                    GENERATQ
#01457     IF NOT SYSPRINT-GOOD-IO                                      GENERATQ
#01457         DISPLAY SYSPRINT-MESSAGE                                 GENERATQ
#01457         MOVE 3049 TO WS-PENGI-RETURN                             ABRCODE
#01457         MOVE SYSPRINT-MESSAGE TO ABEND-MESSAGE                   GENERATQ
#01457         PERFORM F00000-ABEND-CALL-FSABEC16.                      ABEND00
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI GENERATED REPORT2 TERMINATION ROUTINES.                 * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01270-REPORT2-TERMINATE.                                        GENERATQ
#01457     IF TEMPWK2-IOSW = 'C'                                        GENERATQ
#01457         MOVE 'ALLOC TEMPWK2' TO WS-PENGI-ALLOC-REQ               GENERATQ
#01457         CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC          GENERATQ
#01457         OPEN OUTPUT TEMPWK2                                      GENERATQ
#01457         MOVE 'O' TO TEMPWK2-IOSW                                 GENERATQ
#01457         IF NOT TEMPWK2-GOOD-IO                                   GENERATQ
#01457             DISPLAY TEMPWK2-MESSAGE                              GENERATQ
#01457             MOVE 3050 TO WS-PENGI-RETURN                         ABRCODE
#01457             MOVE TEMPWK2-MESSAGE TO ABEND-MESSAGE                GENERATQ
#01457             PERFORM F00000-ABEND-CALL-FSABEC16.                  ABEND00
#01457                                                                  GENERATQ
#01457     MOVE 'C' TO TEMPWK2-IOSW                                     GENERATQ
#01457     CLOSE TEMPWK2.                                               GENERATQ
#01457     MOVE 'ALLOC SORTFL2' TO WS-PENGI-ALLOC-REQ                   GENERATQ
#01457     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-ALLOC              GENERATQ
#01457     MOVE '00' TO SORTFL2-STATUS.                                 GENERATQ
#01457     SORT SORTFL2                                                 GENERATQ
#01457          ASCENDING  KEY S2-CRITERIA                              GENERATQ
#01457          ASCENDING  KEY S2-W-BANK                                GENERATQ
#01457          ASCENDING  KEY S2-W-ASSIGNMENT                          GENERATQ
#01457          ASCENDING  KEY S2-WORK-TYPE                             GENERATQ
#01457          ASCENDING  KEY S2-ACCR-DATE                             GENERATQ
#01457              USING TEMPWK2                                       GENERATQ
#01457          OUTPUT PROCEDURE IS                                     GENERATQ
#01457              E01230-REPORT2-OUTPUT                               GENERATQ
#01457                    THRU                                          GENERATQ
#01457              E01250-REPORT2-OUTPUT-EXIT.                         GENERATQ
#01457                                                                  GENERATQ
#01457     IF SORT-RETURN NOT EQUAL ZERO                                GENERATQ
#01457         MOVE SORT-RETURN TO WS-PENGI-SORT-RETURN                 GENERATQ
#01457         STRING 'REPORT2: SORT ERROR, SORT-RETURN='               GENERATQ
#01457                                      DELIMITED BY SIZE           GENERATQ
#01457                 WS-PENGI-SORT-RETURN DELIMITED BY SIZE           GENERATQ
#01457            INTO ABEND-MESSAGE                                    GENERATQ
#01457         MOVE 3051 TO WS-PENGI-RETURN                             ABRCODE
#01457         PERFORM F00000-ABEND-CALL-FSABEC16                       ABEND00
#01457     END-IF.                                                      GENERATQ
#01457                                                                  GENERATQ
#01457     MOVE 'DEALLOC SORTFL2' TO WS-PENGI-DEALLOC-REQ               GENERATQ
#01457     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-DEALLOC            GENERATQ
#01457     MOVE 'DEALLOC TEMPWK2' TO WS-PENGI-DEALLOC-REQ               GENERATQ
#01457     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-DEALLOC            GENERATQ
#01457     IF SYSPRINT-IOSW NOT = 'O'                                   GENERATQ
#01457         PERFORM E01260-REPORT2-OPEN.                             GENERATQ
#01457     MOVE 6 TO REPORT2-BREAK-LEVL                                 GENERATQ
#01457     MOVE 'Y' TO REPORT2-FINL-CNTRL                               GENERATQ
#01457     MOVE REPORT2-BREAK-LEVL TO REPORT2-PFOOT-LEVL                GENERATQ
#01457                                                                  GENERATQ
#01457     PERFORM E01100-REPORT2-LV1-BREAK                             GENERATQ
#01457     MOVE ZERO TO REPORT2-CTL-LEVEL                               GENERATQ
#01457     IF REPORT2-LNXT-CNTRL NOT = ZERO                             GENERATQ
#01457        MOVE SPACES TO REPORT2-PENGI-RECORD                       GENERATQ
#01457        PERFORM E01310-REPORT2-DO-IO1-A                           GENERATQ
#01457        PERFORM E01320-REPORT2-DO-IO2-A                           GENERATQ
#01457        MOVE ZERO TO REPORT2-ADV-CNTRL                            GENERATQ
#01457        MOVE ZERO TO REPORT2-LNXT-CNTRL                           GENERATQ
#01457     END-IF                                                       GENERATQ
#01457     MOVE 0 TO REPORT2-COUNT, REPORT2-PAGE0.                      GENERATQ
#01457     MOVE SPACE TO REPORT2-PAGE-RENUM-SW.                         GENERATQ
#01457     MOVE REPORT2-LMAX0 TO REPORT2-LINE0.                         GENERATQ
#01457     IF SYSPRINT-IO-COUNT < ZERO                                  GENERATQ
#01457        PERFORM E01330-REPORT2-DO-IO-CH1                          GENERATQ
#01457     END-IF.                                                      GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR BUILDING TEMPWK2               * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01280-REPORT2-BLD-TEMPWK2.                                      GENERATQ
#01457     MOVE CRITERIA             TO T2-CRITERIA.                    GENERATQ
#01457     MOVE W-BANK               TO T2-W-BANK.                      GENERATQ
#01457     MOVE W-ASSIGNMENT         TO T2-W-ASSIGNMENT.                GENERATQ
#01457     MOVE WORK-TYPE            TO T2-WORK-TYPE.                   GENERATQ
#01457     MOVE ACCR-DATE            TO T2-ACCR-DATE.                   GENERATQ
#01457     MOVE W-AMOUNT             TO T2-W-AMOUNT.                    GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI MACRO GENERATED CODE FOR PRINTING REPORTS USING         * GENCTEXT
      * SORTED DATA ON SORTFL2 FILE.                                  * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01290-PRINT-SORTFL2-REPORTS.                                    GENERATQ
#01457     PERFORM E01000-REPORT2-MAINLINE                              GENERATQ
#01457         THRU E01010-REPORT2-MAINLINE-EXIT.                       GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI COMMON I/O LOGIC FOR HANDLING REPORT2                   * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#01457 E01300-REPORT2-DO-IO0.                                           GENERATQ
#01457     IF REPORT2-PENGI-RECORD = SPACES                             GENERATQ
#01457        ADD REPORT2-ADV-CNTRL TO REPORT2-LNXT-CNTRL               GENERATQ
#01457        MOVE ZERO TO REPORT2-ADV-CNTRL                            GENERATQ
#01457     ELSE                                                         GENERATQ
#01457        ADD REPORT2-ADV-CNTRL TO REPORT2-LNXT-CNTRL               GENERATQ
#01457        PERFORM E01310-REPORT2-DO-IO1-A                           GENERATQ
#01457        PERFORM E01320-REPORT2-DO-IO2-A                           GENERATQ
#01457        MOVE ZERO TO REPORT2-LNXT-CNTRL                           GENERATQ
#01457        MOVE ZERO TO REPORT2-ADV-CNTRL                            GENERATQ
#01457     END-IF.                                                      GENERATQ
#01457                                                                  GENERATQ
#01457* THIS ROUTINE ADVANCES PRINTING TO MAKE SURE THAT THERE IS NO    GENERATQ
#01457* MORE THAN 3 OUTSTANDING BLANK LINES TO PRINT.                   GENERATQ
#01457*                                                                 GENERATQ
#01457* INPUT : REPORT2-NXT-CNTRL FOR NUMBER OF LINES TO ADVANCE.       GENERATQ
#01457* OUTPUT: REPORT2-ADV-CNTRL FOR THE REMAINING # OF LINES.         GENERATQ
#01457                                                                  GENERATQ
#01457 E01310-REPORT2-DO-IO1-A.                                         GENERATQ
#01457     PERFORM TEST BEFORE UNTIL REPORT2-LNXT-CNTRL <= 3            GENERATQ
#01457        SUBTRACT 3 FROM REPORT2-LNXT-CNTRL                        GENERATQ
#01457        MOVE SPACES TO SYSPRINT-RECORD                            GENERATQ
#01457        ADD 1 TO SYSPRINT-IO-COUNT                                GENERATQ
#01457        WRITE SYSPRINT-RECORD                                     PRINTSRV
#01457               AFTER ADVANCING 3                                  PRINTSRV
#01457        PERFORM E01360-REPORT2-TEST-IO-ERR                        GENERATQ
#01457        ADD 3 TO REPORT2-LINE0                                    GENERATQ
#01457        ADD 3 TO REPORT2-RSKP-CNTRL                               GENERATQ
#01457     END-PERFORM.                                                 GENERATQ
#01457     MOVE REPORT2-LNXT-CNTRL TO REPORT2-ADV-CNTRL.                GENERATQ
#01457* I/O ROUTINE FOR PRINTING FROM THE REPORT WORK AREA.             GENERATQ
#01457* INPUT : REPORT2-ADV-CNTRL FOR #OF LINES TO ADVANCE              GENERATQ
#01457*         REPORT2-PENGI-RECORD CONTAINS DATA TO PRINT             GENERATQ
#01457                                                                  GENERATQ
#01457 E01320-REPORT2-DO-IO2-A.                                         GENERATQ
#01457     ADD REPORT2-ADV-CNTRL TO REPORT2-LINE0                       GENERATQ
#01457     ADD REPORT2-ADV-CNTRL TO REPORT2-RSKP-CNTRL                  GENERATQ
#01457     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#01457     WRITE SYSPRINT-RECORD                                        PRINTSRV
#01457            FROM REPORT2-PENGI-RECORD AFTER ADVANCING             PRINTSRV
                  REPORT2-ADV-CNTRL.                                    PRINTSRV
#01457     PERFORM E01360-REPORT2-TEST-IO-ERR.                          GENERATQ
#01457                                                                  GENERATQ
#01457* I/O ROUTINE FOR PRINTING TO CH1.                                GENERATQ
#01457* INPUT : REPORT2-ADV-CNTRL FOR #OF LINES TO COUNT                GENERATQ
#01457*         SYSPRINT-RECORD CONTAINS DATA TO PRINT.                 GENERATQ
#01457                                                                  GENERATQ
#01457 E01330-REPORT2-DO-IO-CH1.                                        GENERATQ
#01457     ADD REPORT2-ADV-CNTRL TO REPORT2-LINE0                       GENERATQ
#01457     ADD REPORT2-ADV-CNTRL TO REPORT2-RSKP-CNTRL                  GENERATQ
#01457     ADD 1 TO SYSPRINT-IO-COUNT                                   GENERATQ
#01457     WRITE SYSPRINT-RECORD                                        PRINTSRV
#01457            AFTER ADVANCING CH1                                   PRINTSRV
#01457                                                                  GENERATQ
#01457     PERFORM E01360-REPORT2-TEST-IO-ERR.                          GENERATQ
#01457                                                                  GENERATQ
#01457* MAIN OVERFLOW ROUTINE FOR DETAIL AND TOTAL PRINTING.            GENERATQ
#01457* INPUT : REPORT2-LNXT-CNTRL CONTAINS #OF OUTSTANDING LINES.      GENERATQ
#01457*         REPORT2-ADV-CNTRL #OF LINES TO ADVANCE FOR THIS I/O.    GENERATQ
#01457                                                                  GENERATQ
#01457 E01350-REPORT2-TEST-LMAX1.                                       GENERATQ
#01457     IF REPORT2-LSEQ-CNTRL < 2                                    GENERATQ
#01457        COMPUTE REPORT2-WSKP-CNTRL = REPORT2-LINE0 +              GENERATQ
#01457                REPORT2-ADV-CNTRL + REPORT2-LNXT-CNTRL            GENERATQ
#01457        IF REPORT2-WSKP-CNTRL > REPORT2-LMAX1                     GENERATQ
#01457           ADD REPORT2-ADV-CNTRL TO REPORT2-LNXT-CNTRL            GENERATQ
#01457           MOVE ZERO TO REPORT2-ADV-CNTRL                         GENERATQ
#01457           PERFORM E01220-REPORT2-HDR                             GENERATQ
#01457           MOVE 1 TO REPORT2-ADV-CNTRL                            GENERATQ
#01457           MOVE ZERO TO REPORT2-LNXT-CNTRL                        GENERATQ
#01457           ADD REPORT2-HOFF-CNTRL TO REPORT2-ADV-CNTRL            GENERATQ
#01457        END-IF                                                    GENERATQ
#01457     ELSE                                                         GENERATQ
#01457        COMPUTE REPORT2-WSKP-CNTRL = REPORT2-LINE0 +              GENERATQ
#01457                REPORT2-ADV-CNTRL + REPORT2-LNXT-CNTRL            GENERATQ
#01457        IF REPORT2-WSKP-CNTRL > REPORT2-LMAX1                     GENERATQ
#01457           COMPUTE REPORT2-ADV-CNTRL =                            GENERATQ
#01457                   REPORT2-WSKP-CNTRL - REPORT2-LMAX1             GENERATQ
#01457           MOVE ZERO TO REPORT2-LNXT-CNTRL                        GENERATQ
#01457           IF REPORT2-LINE0 > REPORT2-LMAX1                       GENERATQ
#01457              MOVE 1 TO REPORT2-ADV-CNTRL                         GENERATQ
#01457           END-IF                                                 GENERATQ
#01457           PERFORM E01220-REPORT2-HDR                             GENERATQ
#01457           ADD REPORT2-LNXT-CNTRL TO REPORT2-ADV-CNTRL            GENERATQ
#01457           MOVE ZERO TO REPORT2-LNXT-CNTRL                        GENERATQ
#01457        END-IF                                                    GENERATQ
#01457     END-IF.                                                      GENERATQ
#01457                                                                  GENERATQ
#01457* PRINTER I/O ERROR HANDLING ROUTINE.                             GENERATQ
#01457                                                                  GENERATQ
#01457 E01360-REPORT2-TEST-IO-ERR.                                      GENERATQ
#01457     IF NOT SYSPRINT-GOOD-IO                                      GENERATQ
#01457         DISPLAY SYSPRINT-MESSAGE                                 GENERATQ
#01457         MOVE 3054 TO WS-PENGI-RETURN                             ABRCODE
#01457         MOVE SYSPRINT-MESSAGE TO ABEND-MESSAGE                   GENERATQ
#01457         PERFORM F00000-ABEND-CALL-FSABEC16.                      ABEND00
#01457                                                                  GENERATQ
#01457* COMPUTE MAXIMUM PAGE LINES THAT CAN FIT IN THE PAGESIZE AREA    GENERATQ
#01457* ROUTINE IS INVOKED FROM THE REPORT HEADER PROCESSING ROUTINE.   GENERATQ
#01457                                                                  GENERATQ
#01457 E01370-REPORT2-ADJUST-PAGE.                                      GENERATQ
#01457     COMPUTE REPORT2-LMAX0 = REPORT2-LMAX1                        GENERATQ
#01457     COMPUTE REPORT2-LMAX2 = REPORT2-LMAX1 - 1                    GENERATQ
#01457     COMPUTE REPORT2-LMAX3 = REPORT2-LMAX1 - 2.                   GENERATQ
#01457                                                                  GENERATQ
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      *           ++ END OF GENERATED CODE FOR REPORT2 ++             * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00787                                                                  ABEND00
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * FSABEC16: PROGRAM ABNORMALLY TERMINATES PROCESSING            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
#00787 F00000-ABEND-CALL-FSABEC16.                                      ABEND00
#00787     MOVE WS-PENGI-RETURN TO ABEND-REQUEST                        ABEND00
#00787     MOVE 'ALLOC FJSYABE' TO WS-PENGI-SYSOUT-REQ                  ABEND00
#00787     CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             ABEND00
#00787     CALL 'FSABEC16' USING PROGRAM-INFO-TABLE.                    ABEND00
#00787* THIS IF BELOW PREVENTS COBOL COMPILER WARNING MESSAGES          ABEND00
#00787     IF (RETURN-CODE > 0 OR RETURN-CODE < 0 OR RETURN-CODE = 0)   ABEND00
#00787        GOBACK                                                    ABEND00
#00787     END-IF.                                                      ABEND00
                                                                        PENGIEND
      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * ESTABLISH ESPIE TRAP VIA CALL TO FSYESPI1 PROGRAM.            * GENCTEXT
      * NOTE: !!!! THIS CALL MUST REMAIN AS A STATIC CALL.            * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
       G00000-SET-FSYESPI1-TRAP.                                        PENGIEND
           MOVE 'ALLOC FJSYABE' TO WS-PENGI-SYSOUT-REQ                  PENGIEND
           CALL WS-PENGI-FSYSVC99 USING WS-PENGI-DYN-SYSOUT             PENGIEND
           CALL 'FSYESPI1' USING                                        PENGIEND
                 PROGRAM-INFO-TABLE WS-PENGI-ESPI-INFO.                 PENGIEND
                                                                        PENGIEND

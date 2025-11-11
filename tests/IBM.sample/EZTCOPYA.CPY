      ***************************************************************** GENCTEXT
      *                                                               * GENCTEXT
      * PENGI RECORD STORAGE DEFINITION FOR EZTCOPYA-RECORD.          * GENCTEXT
      *                                                               * GENCTEXT
      ***************************************************************** GENCTEXT
      *01  EZTCOPYA-RECORD.                                             DEFINE
           02 :AA:EZTCOPYA-GRECORD.                                     DEFINE
              03 :AA:COBCOPYA.                                          DEFINE
                 04 :AA:COMPANY            PIC X(2).                    DEFINE
                 04 :AA:BRANCH             PIC X(3).                    DEFINE
                 04 :AA:OFFICER            PIC X(4).                    DEFINE
                 04 :AA:WAGE               PIC S9(6)V9(2).              DEFINE
                 04 :AA:WAGE-9U REDEFINES :AA:WAGE                      DEFINE
                                           PIC 9(6)V9(2).               DEFINE
                 04 :AA:RATE               PIC S9(2)V9(3).              DEFINE
                 04 :AA:RATE-9U REDEFINES :AA:RATE                      DEFINE
                                           PIC 9(2)V9(3).               DEFINE
                 04 FILLER                 PIC X(58).                   DEFINE
      *,PENGI - THE COMPUTED LENGTH FOR EZTCOPYA-RECORD IS 80

       IDENTIFICATION DIVISION.
       PROGRAM-ID.  InputSort.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT Trade-File ASSIGN TO "TRADE.DAT"
                 ORGANIZATION IS LINE SEQUENTIAL.

           SELECT Labor-File ASSIGN TO "LABOR.TMP".

           SELECT Summary-Report ASSIGN TO "AROMASALES.RPT"
                 ORGANIZATION IS LINE SEQUENTIAL.

           SELECT Categorized-File ASSIGN TO "CATEGORIZEDSALE.DAT"
                 ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD Trade-File.
       01 Trade-Record.
           88 End-Of-Trade-File    VALUE HIGH-VALUES.
           02  TF-Customer-Id              PIC X(5).
           02  TF-Customer-Name            PIC X(20).
           02  TF-Oil-Id.
               03  FILLER              PIC X.
                   88 Essential-Oil   VALUE "E".
               03  TF-Oil-Name         PIC 99.
           02 TF-Unit-Size             PIC 99.
           02 TF-Units-Sold            PIC 999.

       SD Labor-File.
       01 Labor-Record.
           88 End-Of-Labor-File VALUE HIGH-VALUES.
               02  LF-Customer-Id          PIC X(5).
               02  LF-Customer-Name        PIC X(20).
               02  LF-Oil-Id.
                   03 FILLER               PIC X.
                   03 LF-Oil-Number        PIC 99.
               02 LF-Unit-Size             PIC 99.
               02 LF-Units-Sold            PIC 999.

       FD Summary-Report.
       01 Print-Line                       PIC X(64).

       FD Categorized-File.
       01 Categorized-Rec                  PIC X(33).



       WORKING-STORAGE SECTION.
       01  Oils-Table.
           02  Oil-Cost-Values.
               03 FILLER               PIC X(40)
                   VALUE "0041003200450050002910250055003900650075".
               03 FILLER               PIC X(40)
                   VALUE "0080004400500063006500550085004812500065".
               03 FILLER               PIC X(40)
                   VALUE "0060005500670072006501250085006511150105".
           02  FILLER REDEFINES Oil-Cost-VALUES.
               03 OIL-COST           PIC 99V99 OCCURS 30 TIMES.

       01  Report-Heading-Line        PIC X(44)
            VALUE "              AROMAMORA SUMMARY TRADE REPORT".

       01  Report-Heading-Underline.
           02  FILLER                 PIC X(13) VALUE SPACES.
           02  FILLER                 PIC X(32) VALUE ALL "-".

       01  Topic-Heading-Line.
           02  FILLER                 PIC BX(13) VALUE "CUSTOMER NAME".
           02  FILLER                 PIC X(8) VALUE SPACES.
           02  FILLER                 PIC X(10) VALUE "CUST-ID   ".
           02  FILLER                 PIC X(8) VALUE "TRADE   ".
           02  FILLER                 PIC X(11) VALUE "QTY SOLD   ".
           02  FILLER                 PIC X(11) VALUE "TRADE VALUE".

       01  Cust-Trade-Line.
           02  Prn-Cust-Name           PIC X(20).
           02  Prn-Cust-Id             PIC BBB9(5).
           02  Prn-Cust-Trade          PIC BBBBBZZ9.
           02  Prn-Qty-Sold            PIC BBBBBZZ,ZZ9.
           02  Prn-Trade-Value         PIC BBBB$$$,$$9.99.

       01  Total-Trade-Line.
           02  FILLER               PIC X(33) VALUE SPACES.
           02  FILLER               PIC X(19) VALUE "TOTAL TRADE  :".
           02  Prn-Total-Trade      PIC BBBBBBZZ,ZZ9.

       01  Total-Qty-Sold-Line.
           02  FILLER                  PIC X(33) VALUE SPACES.
           02  FILLER                  PIC X(19) VALUE "TOTAL QTY SOLD
                                                   :".
           02  Prn-Total-Qty-Sold      PIC BBBBBZZZ,ZZ9.

       01  Total-Trade-Value-Line.
           02  FILLER                  PIC X(33) VALUE SPACES.
           02  FILLER                  PIC X(19) VALUE "TOTAL
                                       TRADE VALUE :".
           02  Prn-Total-Trade-Value   PIC B$$$$,$$9.99.

       01  Cust-Totals.
           02  Cust-Trade              PIC 999.
           02  Cust-Qty-Sold           PIC 9(5).
           02  Cust-Trade-Value        PIC 9(5)V99.

       01  Final-Totals.
           02  Total-Trade             PIC 9(5)    VALUE ZEROS.
           02  Total-Qty-Sold          PIC 9(6)    VALUE ZEROS.
           02  Total-Trade-Value       PIC 9(6)V99 VALUE ZEROS.

       01  Temp-Variables.
           02  Trade-Qty-Sold          PIC 99999.
           02  Value-Of-Trade          PIC 999999V99.
           02  Prev-Cust-Id            PIC X(5).

       PROCEDURE DIVISION.
       Produce-Summary-Report.
           SORT Labor-File ON ASCENDING LF-Customer-Name
               INPUT PROCEDURE IS Select-Essential-Oils
               OUTPUT PROCEDURE IS Print-Summary-Report.

           STOP RUN.

       Select-Essential-Oils.
           OPEN INPUT Trade-File.
           READ Trade-File
               AT END SET End-Of-Trade-File TO TRUE
           END-READ.

           PERFORM UNTIL End-Of-Trade-File
               IF Essential-Oil
                   RELEASE Labor-Record FROM Trade-Record
               END-IF
               READ Trade-File
                   AT END SET End-Of-Trade-File TO TRUE
               END-READ
           END-PERFORM.

           CLOSE Trade-File.

       Print-Summary-Report.
           OPEN OUTPUT Summary-Report.
           OPEN OUTPUT Categorized-File.
           WRITE Print-Line FROM Report-Heading-Line AFTER ADVANCING 1
                                               LINE.
           WRITE Print-Line FROM Report-Heading-Underline AFTER
                       ADVANCING 1 LINE.
           WRITE Print-Line FROM Topic-Heading-Line AFTER ADVANCING 3
                                                LINES.

           Return Labor-File.
               AT END SET End-Of-Trade-File TO TRUE
           END RETURN.

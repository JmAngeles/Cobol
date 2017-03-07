       IDENTIFICATION DIVISION.
       PROGRAM-ID.  InputSort.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT Transaction-File ASSIGN TO "TRANSACTION.DAT"
                 ORGANIZATION IS LINE SEQUENTIAL.

           SELECT Labor-File ASSIGN TO "LABOR.TMP".

           SELECT Overview-Report ASSIGN TO "AROMASALES.RPT"
                 ORGANIZATION IS LINE SEQUENTIAL.

           SELECT Categorized-File ASSIGN TO "CATEGORIZEDSALE.DAT"
                 ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD Transaction-File.
       01 Transaction-Record.
           88 End-Of-Sales-File    VALUE HIGH-VALUES.
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
               02  LF-Cust-Id              PIC X(5).
               02  LF-Cust-Name            PIC X(20).
               02  LF-Oil-Id.
                   03 FILLER               PIC X.
                   03 LF-Oil-Number           PIC 99.
               02 LF-Unit-Size             PIC 99.
               02 LF-Units-Sold            PIC 999.

       FD Overview-Report.
       01 Print-Line                   PIC X(64).

       FD Categorized-File.
       01 Categorized-Rec                   PIC X(33).



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



       PROCEDURE DIVISION.

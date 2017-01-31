      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 TAX PIC 9(4) VALUE 250.
       01 GROSSPAY PIC 9(4) VALUE 1000.
       01 TOTAL PIC 9(4) VALUE 2554.
       01 PRSI PIC 9(4) VALUE 0175.
       01 PENSION PIC 9(4) VALUE 0125.
       01 PAY PIC 9(4) VALUE 2750.
       01 DEDUCTIONS PIC 9(4) VALUE 1050.
       01 NETPAY PIC 9(4) VALUE 2750.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "TAX: ", TAX.
            DISPLAY "GROSSPAY: ", GROSSPAY.
            DISPLAY "TOTAL: ", TOTAL.
            DISPLAY "PRSI: ", PRSI.
            DISPLAY "PENSION: ", PENSION.
            DISPLAY "PAY: ", PAY.
            DISPLAY "SUBTRACT TAX FROM GROSSPAY, TOTAL".
            SUBTRACT TAX FROM GROSSPAY, TOTAL.
            DISPLAY GROSSPAY," " TOTAL.
            DISPLAY " ".

            MOVE 750 TO TAX.
            DISPLAY "SUBTRACT TAX, PRSI, PENSION FROM PAY".
            SUBTRACT TAX, PRSI, PENSION FROM PAY.
            DISPLAY TAX, " " PRSI, " " PENSION," " PAY.
            DISPLAY " ".

            MOVE 2750 TO PAY
            DISPLAY "SUBTRACT DEDUCTIONS FROM PAY GIVING NETPAY".
            SUBTRACT DEDUCTIONS FROM PAY GIVING NETPAY.
            DISPLAY DEDUCTIONS, " " PAY, " " NETPAY.
            DISPLAY " ".

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.

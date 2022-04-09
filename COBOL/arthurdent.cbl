       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARTHUR-DENT.
       AUTHOR. CALLUM BEANEY.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.

       01 IDEAL-TEA      PIC 9(4)V9(2) VALUE 2400.05.
       01 RESTOCK-COUNT  PIC 9(2)      VALUE 0.
      
       01 PERSON.
         05 WHO                PIC A(15).
         05 AGE                PIC 9(2).
         05 LOCATION           PIC X(30).
         05 HYPOTHETICAL-AGE   PIC 9(4).
         05 TEA                PIC 9(4)V9(2)   VALUE  387.55.
         05 TEA-TEMP           PIC S9(3)V9(2)  VALUE +100.00.


       PROCEDURE DIVISION.
       A000-FIRST-PARA.

           MOVE "Arthur Dent" TO WHO.
           MOVE "Somewhere In Sector 3, Space" TO LOCATION.
           MOVE 30 TO AGE.
        
           DISPLAY "HELLO " WHO.           
           DISPLAY  "Your age is " AGE
                    " and your location is: " LOCATION.   
             
       A001-2ND-PARA.

           COMPUTE HYPOTHETICAL-AGE = AGE + 1000.
           DISPLAY "If you were 1000 years older, you would be: "
                    HYPOTHETICAL-AGE " years old! Isn't that smashing?".      
           DISPLAY "At present you have " TEA "ml of tea remaining.".     
        
       A003-3RD-PARA.

        TEA-CHECK.   
           IF IDEAL-TEA > TEA THEN
              DISPLAY "*** OH LORD, THERE ISN'T ENOUGH TEA! ***"
              DISPLAY "... adding tea ..."
              PERFORM TEA-RESTOCK UNTIL TEA > IDEAL-TEA
           ELSE
              DISPLAY "It looks like we have enough tea for a while"
           END-IF.
         
           IF RESTOCK-COUNT IS GREATER THAN OR EQUAL TO 5 THEN
              DISPLAY "We nearly ran out of tea!"
           END-IF.
         
           STOP RUN.

        TEA-RESTOCK.
           COMPUTE TEA = TEA + 500.
           COMPUTE RESTOCK-COUNT = RESTOCK-COUNT + 1.
           DISPLAY "Our tea stock is now: " TEA "ml".

      /TERMINAL COMMANDS:
      *    cobc -x filename.cbl      
      *    ./filename
      
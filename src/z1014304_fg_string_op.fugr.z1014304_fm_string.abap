FUNCTION Z1014304_FM_STRING.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(STRING1) TYPE  STRING
*"     REFERENCE(STRING2) TYPE  STRING
*"     REFERENCE(OPERATION) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(FINAL) TYPE  STRING
*"     REFERENCE(FINAL1) TYPE  STRING
*"----------------------------------------------------------------------
case OPERATION.
   when 'CONCATENATE'.
     CONCATENATE string1 string2 INTO final SEPARATED BY space.
   when 'SPLIT'.
     SPLIT string1 at ' ' INTO final1 final.
   when 'STRING LENGTH'.
     FINAL = strlen( string1 ).
   when 'OFFSET'.
     WRITE : string1+0(2),
             string1+2(2),
             string1+4(2).
   when 'SHIFT'.
     final1  = string1.
     shift final1 LEFT DELETING LEADING '0'.
   WHEN OTHERS.
     MESSAGE 'Invalid Operation' TYPE 'E'.
   ENDCASE.

ENDFUNCTION.

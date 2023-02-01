FUNCTION Z1014304_FM_ARTHEMATIC.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(OPERAND1) TYPE  I
*"     REFERENCE(OPERAND2) TYPE  I
*"     REFERENCE(OPERATION) TYPE  C OPTIONAL
*"  EXPORTING
*"     REFERENCE(RESULT) TYPE  I
*"----------------------------------------------------------------------

CASE operation.
  WHEN 'ADD'.
    result = operand1 + operand2.
  WHEN 'SUB'.
     result = operand1 - operand2.
  WHEN 'MUL'.
    result = operand1 * operand2.
  WHEN 'DIV'.
     result = operand1 / operand2.
  WHEN 'MOD'.
     result = operand1 mod operand2.
  WHEN OTHERS.
    MESSAGE 'Invalid Operation' TYPE 'E'.
ENDCASE.



ENDFUNCTION.

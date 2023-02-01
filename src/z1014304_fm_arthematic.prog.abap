*&---------------------------------------------------------------------*
*& Report Z1014304_FM_ARTHEMATIC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

REPORT Z1014304_FM_ARTHEMATIC.
PARAMETERS: input1 TYPE i,
            input2 TYPE i,
            optn
              TYPE char3.
data : res TYPE i.
CALL FUNCTION 'Z1014304_FM_ARTHEMATIC'
  EXPORTING
    operand1        = input1
    operand2        = input2
    operation       = optn
 IMPORTING

   RESULT          = res.

   WRITE :  res.

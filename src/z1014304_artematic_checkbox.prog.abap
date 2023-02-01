*&---------------------------------------------------------------------*
*& Report Z1014304_ARTEMATIC_CHECKBOX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_ARTEMATIC_CHECKBOX.

DATA : g_result  TYPE i,
       g_message TYPE string,
       g_var1    TYPE string,
       g_var2    TYPE string.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.

  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 5(20) in1.
    PARAMETERS p_num1 TYPE i DEFAULT 01 OBLIGATORY.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 5(20) in2.
    PARAMETERS p_num2 TYPE i DEFAULT 01 OBLIGATORY.
  SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE t2.
  PARAMETERS : p_add  As checkbox,
               p_sub  As checkbox,
               p_mul  AS CHECKBOX,
               p_div  AS CHECKBOX,
               p_mod  AS CHECKBOX,
               p_none AS CHECKBOX.
SELECTION-SCREEN END OF BLOCK b2.


INITIALIZATION .
  t1 =  'Enter Input Values'.
  t2 =  'Arthematic Operations'.
  in1 = 'Enter First Value'.
  in2 = 'Enter Second Value'.


START-OF-SELECTION.
  IF p_add = 'X'.
    g_result = p_num1 + p_num2.
    WRITE : / 'Sum is -',g_result.
    clear g_result.
    endif.
  IF p_sub = 'X'.
    g_result = p_num1 - p_num2.
    WRITE : / 'Difference is -',g_result.
    clear g_result.
    ENDIF.
  IF p_mul = 'X'.
    g_result = p_num1 * p_num2.
    WRITE : / 'Multiplication -',g_result.
    clear g_result.
    ENDIF.
  IF p_div = 'X'.
    g_result = p_num1 / p_num2.
    WRITE : / 'division -',g_result.
    clear g_result.
    ENDIF.
  IF p_mod = 'X'.
    g_result = p_num1 MOD p_num2.
    WRITE : / 'modulus is -',g_result.
    clear g_result.
    ENDIF.


END-OF-SELECTION.

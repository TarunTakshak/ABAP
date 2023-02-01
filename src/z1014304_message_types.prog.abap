*&---------------------------------------------------------------------*
*& Report Z1014304_MESSAGE_TYPES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_MESSAGE_TYPES.

DATA : g_result  TYPE i,
       g_message TYPE string,
       g_var1    TYPE string,
       g_var2    TYPE string.
load-OF-PROGRAM.
"MESSAGE 'info' TYPE 'I'.
"MESSAGE 'error' TYPE 'E'.
*MESSAGE 'exit' TYPE 'X'.
"MESSAGE 'warining' TYPE 'W'.
*MESSAGE 'terminate' TYPE 'A'.
*MESSAGE 'success' TYPE 'S'.


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
  PARAMETERS : p_add  RADIOBUTTON GROUP rad1 USER-COMMAND ab1,
               p_sub  RADIOBUTTON GROUP rad1,
               p_mul  RADIOBUTTON GROUP rad1,
               p_div  RADIOBUTTON GROUP rad1,
               p_mod  RADIOBUTTON GROUP rad1,
               p_none RADIOBUTTON GROUP rad1 DEFAULT 'X'.
SELECTION-SCREEN END OF BLOCK b2.


*AT SELECTION-SCREEN ON RADIOBUTTON GROUP rad1.
*  CASE sy-ucomm.
*    WHEN 'AB1'.
*      IF p_add = 'X'.
*        g_result = p_num1 + p_num2.
*        g_var1 = 'sum is'.
*        g_var2 = g_result.
*        CONCATENATE g_var1 g_var2 INTO g_message SEPARATED BY space.
*        MESSAGE g_message TYPE 'I'.
*      ELSEIF p_sub = 'X'.
*        g_result = p_num1 - p_num2.
*        g_var1 = 'difference is'.
*        g_var2 = g_result.
*        CLEAR g_message.
*        CONCATENATE g_var1 g_var2 INTO g_message SEPARATED BY space.
*        MESSAGE g_message TYPE 'A'.
*      ELSEIF p_mul = 'X'.
*        g_result = p_num1 * p_num2.
*        g_var1 = 'Multiplication is'.
*        g_var2 = g_result.
*        CONCATENATE g_var1 g_var2 INTO g_message SEPARATED BY space.
*        MESSAGE g_message TYPE 'E'.
*      ELSEIF p_div = 'X'.
*        g_result = p_num1 / p_num2.
*        g_var1 = 'divison is'.
*        g_var2 = g_result.
*        CONCATENATE g_var1 g_var2 INTO g_message SEPARATED BY space.
*        MESSAGE g_message TYPE 'S'.
*      ELSEIF p_sub = 'X'.
*        g_result = p_num1 MOD p_num2.
*        g_var1 = 'modulus is'.
*        g_var2 = g_result.
*        CONCATENATE g_var1 g_var2 INTO g_message SEPARATED BY space.
*        MESSAGE g_message TYPE 'W'.
*       " MESSAGE g_message TYPE 'X'.
*      ENDIF.
*
*
*  ENDCASE.
"MESSAGE 'info' TYPE 'I'.
"MESSAGE 'error' TYPE 'E'.
*MESSAGE 'exit' TYPE 'X'.
"MESSAGE 'warining' TYPE 'W'.
*MESSAGE 'terminate' TYPE 'A'.
*MESSAGE 'success' TYPE 'S'.


INITIALIZATION .
  t1 =  'Enter Input Values'.
  t2 =  'Arthematic Operations'.
  in1 = 'Enter First Value'.
  in2 = 'Enter Second Value'.

"MESSAGE 'info' TYPE 'I'.
"MESSAGE 'error' TYPE 'E'.
*MESSAGE 'exit' TYPE 'X'.
"MESSAGE 'warining' TYPE 'W'.
*MESSAGE 'terminate' TYPE 'A'.
*MESSAGE 'success' TYPE 'S'.


START-OF-SELECTION.
  IF p_add = 'X'.
    g_result = p_num1 + p_num2.
    g_var2 = g_result.
    MESSAGE g_var2 TYPE 'I'.
   " WRITE : / 'Sum is -',g_result.
  ELSEIF p_sub = 'X'.
    g_result = p_num1 - p_num2.
     g_var2 = g_result.
    MESSAGE g_var2 TYPE 'A'.
   " WRITE : / 'Difference is -',g_result.
  ELSEIF p_mul = 'X'.
    g_result = p_num1 * p_num2.
     g_var2 = g_result.
    MESSAGE g_var2 TYPE 'W'.
   " WRITE : / 'Multiplication -',g_result.
  ELSEIF p_div = 'X'.
    g_result = p_num1 / p_num2.
     g_var2 = g_result.
    MESSAGE g_var2 TYPE 'X'.
    "WRITE : / 'division -',g_result.
  ELSEIF p_mod = 'X'.
    g_result = p_num1 MOD p_num2.
     g_var2 = g_result.
    MESSAGE g_var2 TYPE 'S'.
   " WRITE : / 'modulus is -',g_result.
  ENDIF.
  "MESSAGE 'info' TYPE 'I'.
"MESSAGE 'error' TYPE 'E'.
*MESSAGE 'exit' TYPE 'X'.
"MESSAGE 'warining' TYPE 'W'.
*MESSAGE 'terminate' TYPE 'A'.
*MESSAGE 'success' TYPE 'S'.

END-OF-SELECTION.


TOP-OF-PAGE.
  WRITE :/ 'Output'.
"MESSAGE 'info' TYPE 'I'.
"MESSAGE 'error' TYPE 'E'.
*MESSAGE 'exit' TYPE 'X'.
"MESSAGE 'warining' TYPE 'W'.
*MESSAGE 'terminate' TYPE 'A'.
*MESSAGE 'success' TYPE 'S'.

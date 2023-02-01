*&---------------------------------------------------------------------*
*& Report Z1014304_ARTEMATIC_RADIO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_artematic_radio.
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
  PARAMETERS : p_add  RADIOBUTTON GROUP rad1 USER-COMMAND ab1,
               p_sub  RADIOBUTTON GROUP rad1,
               p_mul  RADIOBUTTON GROUP rad1,
               p_div  RADIOBUTTON GROUP rad1,
               p_mod  RADIOBUTTON GROUP rad1,
               p_none RADIOBUTTON GROUP rad1.
SELECTION-SCREEN END OF BLOCK b2.


AT SELECTION-SCREEN ON RADIOBUTTON GROUP rad1.
  CASE sy-ucomm.
    WHEN 'AB1'.
      IF p_add = 'X'.
        g_result = p_num1 + p_num2.
        g_var1 = 'sum is'.
        g_var2 = g_result.
        CONCATENATE g_var1 g_var2 INTO g_message SEPARATED BY space.
        MESSAGE g_message TYPE 'I'.
      ELSEIF p_sub = 'X'.
        g_result = p_num1 - p_num2.
        g_var1 = 'difference is'.
        g_var2 = g_result.
        CLEAR g_message.
        CONCATENATE g_var1 g_var2 INTO g_message SEPARATED BY space.
        MESSAGE g_message TYPE 'I'.
      ELSEIF p_mul = 'X'.
        g_result = p_num1 * p_num2.
        g_var1 = 'Multiplication is'.
        g_var2 = g_result.
        CONCATENATE g_var1 g_var2 INTO g_message SEPARATED BY space.
        MESSAGE g_message TYPE 'I'.
      ELSEIF p_div = 'X'.
        g_result = p_num1 / p_num2.
        g_var1 = 'divison is'.
        g_var2 = g_result.
        CONCATENATE g_var1 g_var2 INTO g_message SEPARATED BY space.
        MESSAGE g_message TYPE 'I'.
      ELSEIF p_sub = 'X'.
        g_result = p_num1 MOD p_num2.
        g_var1 = 'modulus is'.
        g_var2 = g_result.
        CONCATENATE g_var1 g_var2 INTO g_message SEPARATED BY space.
        MESSAGE g_message TYPE 'I'.
      ENDIF.


  ENDCASE.


INITIALIZATION .
  t1 =  'Enter Input Values'.
  t2 =  'Arthematic Operations'.
  in1 = 'Enter First Value'.
  in2 = 'Enter Second Value'.


*START-OF-SELECTION.
*  IF p_add = 'X'.
*    g_result = p_num1 + p_num2.
*    WRITE : / 'Sum is -',g_result.
*  ELSEIF p_sub = 'X'.
*    g_result = p_num1 - p_num2.
*    WRITE : / 'Difference is -',g_result.
*  ELSEIF p_mul = 'X'.
*    g_result = p_num1 * p_num2.
*    WRITE : / 'Multiplication -',g_result.
*  ELSEIF p_div = 'X'.
*    g_result = p_num1 / p_num2.
*    WRITE : / 'division -',g_result.
*  ELSEIF p_mod = 'X'.
*    g_result = p_num1 MOD p_num2.
*    WRITE : / 'modulus is -',g_result.
*  ENDIF.
*
*END-OF-SELECTION.


TOP-OF-PAGE.
  WRITE :/ 'Output'.

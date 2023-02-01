*&---------------------------------------------------------------------*
*& Report Z1014304_ARTEMATIC_PUSHBOX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_artematic_pushbox.
TABLES: sscrfields.

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

  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON : 1(5) p_add USER-COMMAND tap1,
                                  10(5) p_sub USER-COMMAND tap2,
                                  20(5) p_mul USER-COMMAND tap3,
                                  30(5) p_div USER-COMMAND tap4,
                                  40(5) p_mod USER-COMMAND tap5.


  SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK b2.

INITIALIZATION .
  t1 =  'Enter Input Values'.
  t2 =  'Arthematic Operations'.
  in1 = 'Enter First Value'.
  in2 = 'Enter Second Value'.
  p_add = 'Add'.
  p_sub = 'sub'.
  p_mul = 'mul'.
  p_div = 'div'.
  p_mod = 'mod'.



START-OF-SELECTION.

AT SELECTION-SCREEN.
  CASE sscrfields-ucomm.
    WHEN 'TAP1'.
      g_result = p_num1 + p_num2.
      g_var1 = g_result.
      MESSAGE g_var1 TYPE 'I'.
      CLEAR g_result.
    WHEN 'TAP2'.
      g_result = p_num1 - p_num2.
      g_var1 = g_result.
      MESSAGE g_var1 TYPE 'I'.
      CLEAR g_result.
    WHEN 'TAP3'.
      g_result = p_num1 * p_num2.
      g_var1 = g_result.
      MESSAGE g_var1 TYPE 'I'.
      CLEAR g_result.
    WHEN 'TAP4'.
      g_result = p_num1 / p_num2.
      g_var1 = g_result.
      MESSAGE g_var1 TYPE 'I'.
      CLEAR g_result.

    WHEN 'TAP5'.
      g_result = p_num1 MOD p_num2.
      g_var1 = g_result.
      MESSAGE g_var1 TYPE 'I'.
      CLEAR g_result.

  ENDCASE.

END-OF-SELECTION.

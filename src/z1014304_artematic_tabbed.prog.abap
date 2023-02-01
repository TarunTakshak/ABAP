*&---------------------------------------------------------------------*
*& Report Z1014304_ARTEMATIC_TABBED
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_artematic_tabbed.
DATA : g_result TYPE i,
       g_conc TYPE string,
       g_final TYPE string,
       g_temp   TYPE string.

SELECTION-SCREEN BEGIN OF TABBED BLOCK b1 FOR 10 LINES.
  SELECTION-SCREEN TAB (10) t1 USER-COMMAND uc1.
  SELECTION-SCREEN TAB (20) t2 USER-COMMAND uc2.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF SCREEN 100 AS SUBSCREEN.
  SELECTION-SCREEN COMMENT 5(22) ab1.
  PARAMETERS : p_input1 TYPE i DEFAULT 01 OBLIGATORY,
               p_input2 TYPE i DEFAULT 01 OBLIGATORY,
               p_add    RADIOBUTTON GROUP rad1 USER-COMMAND r1,
               p_sub    RADIOBUTTON GROUP rad1,
               p_none   RADIOBUTTON GROUP rad1 DEFAULT 'X'.
SELECTION-SCREEN END OF SCREEN 100.

SELECTION-SCREEN BEGIN OF SCREEN 200 AS SUBSCREEN.
  SELECTION-SCREEN COMMENT 5(22) ab2.
  PARAMETERS : p_var1  TYPE i DEFAULT 01 OBLIGATORY,
               p_var2  TYPE i DEFAULT 01 OBLIGATORY,
               p_mul   RADIOBUTTON GROUP rad2 USER-COMMAND r2,
               p_div   RADIOBUTTON GROUP rad2,
               p_mod   RADIOBUTTON GROUP rad2,
               p_none1 RADIOBUTTON GROUP rad2 DEFAULT 'X'.
SELECTION-SCREEN END OF SCREEN 200.

INITIALIZATION.
  b1-activetab = 'UC1'.
  b1-dynnr = '100'.
  b1-prog = sy-repid.


  t1 = 'Add - Sub'.
  t2 = 'Mul - Div - Mod'.

  ab1 = 'Arthematic Operations-'.
  ab2 = 'Arthematic Operations-'.


AT SELECTION-SCREEN.
  CASE sy-ucomm.
    WHEN 'UC1'.
      b1-activetab = 'UC1'.
      b1-dynnr = '100'.
      b1-prog = sy-repid.
    WHEN 'UC2'.
      b1-activetab = 'UC2'.
      b1-dynnr = '200'.
      b1-prog = sy-repid.
  ENDCASE.


AT SELECTION-SCREEN ON RADIOBUTTON GROUP rad1.
  IF b1-dynnr = '100'.
    IF p_add = 'X'.
      g_result = p_input1 + p_input2.
      g_temp = g_result.
      g_conc = 'Sum is '.
      CONCATENATE g_conc g_temp INTO g_final SEPARATED BY space.
      MESSAGE g_final TYPE 'I'.
      CLEAR g_temp.
    ENDIF.
    IF p_sub = 'X'.
      g_result = p_input1 - p_input2.
      g_temp = g_result.
       g_conc = 'differnece is '.
      CONCATENATE g_conc g_temp INTO g_final SEPARATED BY space.
      MESSAGE g_final TYPE 'I'.
      CLEAR g_temp.
    ENDIF.
  ENDIF.



AT SELECTION-SCREEN ON RADIOBUTTON GROUP rad2.
  IF b1-dynnr = '200'.
    IF p_mul = 'X'.
      g_result = p_var1 * p_var2.
      g_temp = g_result.
       g_conc = 'Multiplication = '.
      CONCATENATE g_conc g_temp INTO g_final SEPARATED BY space.
      MESSAGE g_final TYPE 'I'.
      CLEAR g_temp.
    ENDIF.
    IF p_div = 'X'.
      g_result = p_var1 / p_var2.
      g_temp = g_result.
       g_conc = 'Divison = '.
      CONCATENATE g_conc g_temp INTO g_final SEPARATED BY space.
      MESSAGE g_final TYPE 'I'.
       CLEAR g_temp.
    ENDIF.
    IF p_mod = 'X'.
      g_result = p_var1 MOD p_var2.
      g_temp = g_result.
       g_conc = 'Modulud = '.
      CONCATENATE g_conc g_temp INTO g_final SEPARATED BY space.
      MESSAGE g_final TYPE 'I'.
       CLEAR g_temp.
    ENDIF.
  ENDIF.

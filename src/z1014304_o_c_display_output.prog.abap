*&---------------------------------------------------------------------*
*& Include          Z1014304_O_C_DISPLAY_OUTPUT
*&---------------------------------------------------------------------*
AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF p_cust = 'X' AND screen-group1 = 'MO1'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_vend = 'X' AND screen-group1 = 'MO2'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_cust = ' ' AND screen-group1 = 'MO1'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_vend = ' ' AND screen-group1 = 'MO2'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.

    ENDIF.
  ENDLOOP.

*&---------------------------------------------------------------------*
*& Include          Z1014304_DISPLAY_OUTPUT
*&---------------------------------------------------------------------*

 PERFORM display_output.

*&---------------------------------------------------------------------*
*& Form display_output
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_output .
LOOP AT SCREEN.
    IF p_sales = 'X' AND screen-group1 = 'MO1'.
      screen-active = 1.
      MODIFY SCREEN.
      "clear screen.
      CONTINUE.
    ELSEIF p_deliv = 'X' AND screen-group1 = 'MO2'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_sales = ' ' AND screen-group1 = 'MO1'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_deliv = ' ' AND screen-group1 = 'MO2'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.
  ENDLOOP.
ENDFORM.

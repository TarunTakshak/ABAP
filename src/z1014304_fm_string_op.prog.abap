*&---------------------------------------------------------------------*
*& Report Z1014304_FM_STRING_OP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_fm_string_op.
********pass by reference****************
PARAMETERS : p_input1 TYPE string,
             p_input2 TYPE string,
             p_opt    TYPE string.
DATA : g_finAL TYPE string.


PERFORM string USING p_input1 p_input2 p_opt CHANGING g_final.


WRITE : g_FINAL.
*&---------------------------------------------------------------------*
*& Form string
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> P_INPUT1
*&      --> P_INPUT2
*&      --> P_OPT
*&      <-- G_FINAL
*&---------------------------------------------------------------------*
FORM string  USING    p_p_input1
                      p_p_input2
                      p_p_opt
             CHANGING p_g_final.
  PERFORM display_message.
  CALL FUNCTION 'Z1014304_FM_STRING'
    EXPORTING
      string1   = p_p_input1
      string2   = p_p_input2
      operation = p_p_opt
    IMPORTING
      final     = p_g_finAL.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form display_message
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_message .
  MESSAGE 'Invlaid Output' TYPE 'E'.
ENDFORM.




********pass by value**********

*PARAMETERS : p_input1 TYPE string,
*             p_input2 TYPE string,
*             p_opt    TYPE string.
*DATA : g_finAL TYPE string.
*
*
*PERFORM string USING p_input1 p_input2 p_opt CHANGING g_final.
*
*
*WRITE : g_FINAL.
**&---------------------------------------------------------------------*
**& Form string
**&---------------------------------------------------------------------*
**& text
**&---------------------------------------------------------------------*
**&      --> P_INPUT1
**&      --> P_INPUT2
**&      --> P_OPT
**&      <-- G_FINAL
**&---------------------------------------------------------------------*
*FORM string  USING    value(p_p_input1)
*                      VALUE(p_p_input2)
*                      VALUE(p_p_opt)
*             CHANGING p_g_final.
*CALL FUNCTION 'Z1014304_FM_STRING'
*  EXPORTING
*    string1   = p_p_input1
*    string2   = p_p_input2
*    operation = p_p_opt
*  IMPORTING
*    final     = p_g_finAL.
*ENDFORM.

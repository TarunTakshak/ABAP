*&---------------------------------------------------------------------*
*& Report Z1014304_STRING_RADIO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_string_radio.

DATA : g_result  TYPE string,
       g_message TYPE string,
       g_var     TYPE string.
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE in1.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 5(20) a1.
    PARAMETERS : p_num1 TYPE string DEFAULT 'enter a string' OBLIGATORY.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 5(20) a2.
    PARAMETERS : p_num2 TYPE string DEFAULT 'enter a string' OBLIGATORY.
  SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE in2.
  PARAMETERS : p_co   RADIOBUTTON GROUP rad1 USER-COMMAND ab1,
               p_nc   RADIOBUTTON GROUP rad1,
               p_ca   RADIOBUTTON GROUP rad1,
               p_na   RADIOBUTTON GROUP rad1,
               p_cs   RADIOBUTTON GROUP rad1,
               p_ns   RADIOBUTTON GROUP rad1,
               p_cp   RADIOBUTTON GROUP rad1,
               p_np   RADIOBUTTON GROUP rad1,
               p_none RADIOBUTTON GROUP rad1 DEFAULT 'X'.
SELECTION-SCREEN END OF BLOCK b2.

AT SELECTION-SCREEN ON RADIOBUTTON GROUP rad1.
  CASE sy-ucomm.
    WHEN 'AB1'.
      IF p_co = 'X'.
        IF p_num1 CO p_num2.
          g_result = 'contains only'.
          WRITE : / g_result.
        ELSEIF p_num1 CN p_num2.
          g_result = 'contains Not'.
          WRITE : / g_result.
        ENDIF.
        MESSAGE g_result TYPE 'I'.

      ELSEIF p_ca = 'X'.
        IF p_num1 CA p_num2.
          g_result = 'contains Any'.
          WRITE : / g_result.
        ELSEIF p_num1 NA p_num2.
          g_result = 'Not Any'.
          WRITE : / g_result.
        ENDIF.
        MESSAGE g_result TYPE 'I'.

      ELSEIF p_cs = 'X'.
        IF p_num1 CS p_num2.
          g_result = 'contains String'.
          WRITE : / g_result.
        ELSEIF p_num1 NS p_num2.
          g_result = 'Not contains String'.
          WRITE : / g_result.
        ENDIF.
        MESSAGE g_result TYPE 'I'.


      ELSEIF p_cp = 'X'.
        IF p_num1 CP p_num2.
          g_result = 'contains Pattern'.
          WRITE : / g_result.
        ELSEIF p_num1 NP p_num2.
          g_result = 'Not contains Pattern'.
          WRITE : / g_result.
        ENDIF.
        MESSAGE g_result TYPE 'I'.
      ENDIF.
  ENDCASE.

INITIALIZATION.
  in1 = 'Input value'.
  in2 = 'String Operators'.
  a1 = 'input1'.
  a2 = 'input2'.

*START-OF-SELECTION.
*  IF p_co = 'X'.
*    IF p_num1 CO p_num2.
*      g_result = 'contains only'.
*      WRITE : / g_result.
*    ELSEIF p_num1 CN p_num2.
*      g_result = 'contains Not'.
*      WRITE : / g_result.
*    ENDIF.
*
*  ELSEIF p_ca = 'X'.
*    IF p_num1 CA p_num2.
*      g_result = 'contains Any'.
*      WRITE : / g_result.
*    ELSEIF p_num1 NA p_num2.
*      g_result = 'Not Any'.
*      WRITE : / g_result.
*    ENDIF.
*
*  ELSEIF p_cs = 'X'.
*    IF p_num1 CS p_num2.
*      g_result = 'contains String'.
*      WRITE : / g_result.
*    ELSEIF p_num1 NS p_num2.
*      g_result = 'contains String'.
*      WRITE : / g_result.
*    ENDIF.
*
*
*  ELSEIF p_cp = 'X'.
*    IF p_num1 CP p_num2.
*      g_result = 'contains Pattern'.
*      WRITE : / g_result.
*    ELSEIF p_num1 NP p_num2.
*      g_result = 'contains Pattern'.
*      WRITE : / g_result.
*    ENDIF.
*
*
*
*  ENDIF.

END-OF-SELECTION.

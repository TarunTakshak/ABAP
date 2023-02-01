*&---------------------------------------------------------------------*
*& Include          Z1014304_ALV_MARA_MAIN
*&---------------------------------------------------------------------*
"fetching data for mara in database table
PERFORM get_mara.
"field catlog
PERFORM field_cat.

*&---------------------------------------------------------------------*
*& Form get_mara
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_mara .

  SELECT  matnr
          ernam
          laeda
          aenam
          vpsta
    FROM mara INTO TABLE it_mara." WHERE matnr = p_matnr.

  IF sy-subrc <> 0 AND it_mara IS INITIAL.
    MESSAGE 'Invalid Number' TYPE 'E'.
  ENDIF.

ENDFORM.

*&---------------------------------------------------------------------*
*& Form field_cat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM field_cat .

  wa_fcat-col_pos = 1.
  wa_fcat-fieldname = 'MATNR'.
  wa_fcat-seltext_m = 'Material Number'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 2.
  wa_fcat-fieldname = 'ERNAM'.
  wa_fcat-seltext_m = 'Name'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 3.
  wa_fcat-fieldname = 'LAEDA'.
  wa_fcat-seltext_m = 'Date'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 4.
  wa_fcat-fieldname = 'AENAM'.
  wa_fcat-seltext_m = 'Material Number'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 5.
  wa_fcat-fieldname = 'VPSTA'.
  wa_fcat-seltext_m = 'Maintenance status'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

ENDFORM.

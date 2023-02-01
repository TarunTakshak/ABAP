*&---------------------------------------------------------------------*
*& Report Z1014304_MATERIAL_MASTER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_material_master.

TYPES :
  "structure to hold Material Master details
  BEGIN OF st_mara,
    matnr TYPE mara-matnr,
    ersda TYPE mara-ersda,
    vpsta TYPE mara-vpsta,
    mtart TYPE mara-mtart,
    matkl TYPE mara-matkl,
  END OF st_mara.
DATA :
  "internal table and workarea to hold Material Master details
  it_mara TYPE TABLE OF st_mara,
  wa_mara TYPE st_mara.


SELECT  matnr
        ersda
        vpsta
        mtart
        matkl
  FROM mara
  INTO TABLE it_mara.
IF sy-subrc = 0 AND it_mara IS NOT INITIAL.

    WRITE : /1'matnr',
             20'ersda',
             38'vpsta',
             50'mtart',
             70'matkl'.
    WRITE :/ sy-uline+0(80).
  LOOP AT it_mara INTO wa_mara.
    WRITE : /1 wa_mara-matnr,
             20 wa_mara-ersda,
             38 wa_mara-vpsta,
             50 wa_mara-mtart,
             70 wa_mara-matkl.
  ENDLOOP.                             "loop at it_mara...
ENDIF.

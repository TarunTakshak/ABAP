*&---------------------------------------------------------------------*
*& Include          Z1014304_ALV_ALL_ENTRIES_MAIN
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form get_vbak
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_vbak .

SELECT   VBELN
         ERDAT
         ERZET
         ERNAM
   FROM vbak into CORRESPONDING FIELDS OF TABLE it_vbak WHERE vbeln in s_vbeln.

  IF sy-subrc <> 0 and it_vbak is INITIAL.
    MESSAGE 'Invalid data' TYPE 'E'.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_vbap
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_vbap .

SELECT
   VBELN
   POSNR
   MATNR
   MATWA
   NETWR
   FROM vbap INTO  CORRESPONDING FIELDS OF TABLE it_vbap FOR ALL ENTRIES IN it_vbak WHERE vbeln = it_vbak-vbeln.
  IF sy-subrc <> 0 and it_vbak is INITIAL.
    MESSAGE 'Invalid data' TYPE 'E'.
  ENDIF.
 ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_akap
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_akap .

LOOP AT it_vbap INTO wa_vbap.

  wa_final-vbeln = wa_vbap-vbeln.
  wa_final-POSNR = wa_vbap-POSNR.
  wa_final-MATNR = wa_vbap-MATNR.
  wa_final-MATWA = wa_vbap-MATWA.
  wa_final-NETWR = wa_vbap-NETWR.

READ TABLE it_vbak INTO wa_vbak WITH key vbeln = wa_vbap-vbeln.

wa_final-VBELN = wa_vbak-VBELN.
wa_final-ERDAT = wa_vbak-ERDAT.
wa_final-ERZET = wa_vbak-ERZET.
wa_final-ERNAM = wa_vbak-ERNAM.

ENDLOOP.

ENDFORM.

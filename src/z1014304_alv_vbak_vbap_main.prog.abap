*&---------------------------------------------------------------------*
*& Include          Z1014304_ALV_VBAK_VBAP_MAIN
*&---------------------------------------------------------------------*

"perform to fetch data for vbak and vbak in database table
PERFORM get_vbak_vbap.
"perform for field catlog
PERFORM field_cat.

*&---------------------------------------------------------------------*
*& Form get_vbak_vbap
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_vbak_vbap .

SELECT
      vbak~vbeln
      vbak~erdat
      vbak~erzet
      vbak~ernam
      vbap~posnr
      vbap~matnr
      vbap~matwa
      vbap~pmatn
      vbap~NETWR
     INTO TABLE it_akap
     from vbak INNER JOIN vbap
     on vbak~vbeln = vbap~vbeln
     WHERE vbak~vbeln in s_vbeln.

  IF sy-subrc <> 0 and it_akap is INITIAL.
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
wa_fcat-fieldname = 'VBELN'.
wa_fcat-seltext_m = 'Sales Document'.
APPEND wa_fcat to it_fcat.

wa_fcat-col_pos = 2.
wa_fcat-fieldname = 'ERDAT'.
wa_fcat-seltext_m = 'Date'.
APPEND wa_fcat to it_fcat.

wa_fcat-col_pos = 3.
wa_fcat-fieldname = 'ERZET'.
wa_fcat-seltext_m = 'Entry Time'.
APPEND wa_fcat to it_fcat.

wa_fcat-col_pos = 4.
wa_fcat-fieldname = 'ERNAM'.
wa_fcat-seltext_m = 'Name of the Person'.
APPEND wa_fcat to it_fcat.

wa_fcat-col_pos = 5.
wa_fcat-fieldname = 'POSNR'.
wa_fcat-seltext_m = 'Sales Document Item'.
APPEND wa_fcat to it_fcat.

wa_fcat-col_pos = 6.
wa_fcat-fieldname = 'MATNR'.
wa_fcat-seltext_m = 'Material Number'.
APPEND wa_fcat to it_fcat.

wa_fcat-col_pos = 7.
wa_fcat-fieldname = 'Matwa'.
wa_fcat-seltext_m = 'Material Enter ID'.
APPEND wa_fcat to it_fcat.

wa_fcat-col_pos = 8.
wa_fcat-fieldname = 'PMATN'.
wa_fcat-seltext_m = 'Price Refernce NO'.
APPEND wa_fcat to it_fcat.


wa_fcat-col_pos = 9.
wa_fcat-fieldname = 'NETWR'.
wa_fcat-seltext_m = 'NETVALUE'.
wa_fcat-do_sum = 'X'.

APPEND wa_fcat to it_fcat.


wa_sort-spos = 1.
wa_sort-fieldname = 'VBELN'.
wa_sort-up        = 'X'.
wa_sort-subtot    = 'X'.
APPEND wa_sort to it_sort.





ENDFORM.

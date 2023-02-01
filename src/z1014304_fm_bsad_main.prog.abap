*&---------------------------------------------------------------------*
*& Include          Z1014304_FM_BSAD_MAIN
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*& Form get_bsad
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_bsad .


CALL FUNCTION 'Z1014304_FM_BSAD'
  TABLES
    pernr_range       =  s_kunnr[]
  changing
    it_bsad           =  it_bsad.

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


wa_fcat-col_pos = '1'.
wa_fcat-fieldname = 'BURKS'.
wa_fcat-seltext_m = 'Company Code'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

wa_fcat-col_pos = '2'.
wa_fcat-fieldname = 'KUNNR'.
wa_fcat-seltext_m = 'Customer Number'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

wa_fcat-col_pos = '3'.
wa_fcat-fieldname = 'UMSKS'.
wa_fcat-seltext_m = 'Transaction Type'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.


wa_fcat-col_pos = '4'.
wa_fcat-fieldname = 'UMSKZ'.
wa_fcat-seltext_m = ' Indicator'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.


wa_fcat-col_pos = '5'.
wa_fcat-fieldname = 'AUGDT'.
wa_fcat-seltext_m = 'Clearing Date'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

wa_fcat-col_pos = '6'.
wa_fcat-fieldname = 'AUGBL'.
wa_fcat-seltext_m = 'Clearing Document'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.


GS_LAYOUT-colwidth_optimize = 'X'.
GS_LAYOUT-ZEBRA             = 'X'.


ENDFORM.


*&---------------------------------------------------------------------*
*& Form display
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display .

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
   I_CALLBACK_PROGRAM                = sy-cprog
   I_STRUCTURE_NAME                  = 'Z1014304_FM_BSAD'
"   IT_FIELDCAT                       =  it_fcat
   I_CALLBACK_TOP_OF_PAGE            = 'TOP_OF_PAGE'
  TABLES
    t_outtab                          =  it_bsad.
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

ENDFORM.

form top_of_page.
  data : today_dt TYPE sy-datum.
  WRITE : sy-datum to today_dt.

  wa_header-TYP = 'A'.
  wa_header-key = 'Date: '.
  wa_header-info = today_dt.
  APPEND wa_header to it_header.
  CLEAR wa_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary       = it_header
 "     I_LOGO                   = 'C:\Users\tarun.takshak\Downloads'.
*     I_END_OF_LIST_GRID       =
*     I_ALV_FORM               =
            .
  ENDFORM.

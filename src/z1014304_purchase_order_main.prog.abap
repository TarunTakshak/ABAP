*&---------------------------------------------------------------------*
*& Include          Z1014304_PURCHASE_ORDER_MAIN
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form get_ekko_ekpo
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_ekko_ekpo .
SELECT  ekko~lifnr
        ekko~ebeln
        ekpo~aedat
        ekpo~ebelp
        ekpo~matnr
        ekpo~menge
        ekpo~kzfme INTO TABLE it_purchase
       FROM ekko INNER JOIN ekpo
      ON ekko~ebeln = ekpo~ebeln WHERE ekko~lifnr in s_lifnr.

  SORT it_purchase by lifnr.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form field_catlog
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM field_catlog .

wa_fcat-col_pos = '1'.
wa_fcat-fieldname = 'LIFNR'.
wa_fcat-seltext_m = 'Vendor account number'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

wa_fcat-col_pos = '2'.
wa_fcat-fieldname = 'EBELN'.
wa_fcat-seltext_m = 'Purchasing Document Number'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

wa_fcat-col_pos = '3'.
wa_fcat-fieldname = 'EBELP'.
wa_fcat-seltext_m = 'Item Number'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

wa_fcat-col_pos = '4'.
wa_fcat-fieldname = 'MATNR'.
wa_fcat-seltext_m = 'Material Number'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

wa_fcat-col_pos = '5'.
wa_fcat-fieldname = 'MENGE'.
wa_fcat-seltext_m = 'Purchase Order Quantity'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

wa_fcat-col_pos = '6'.
wa_fcat-fieldname = 'KZFME'.
wa_fcat-seltext_m = 'UOM'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.


wa_fcat-col_pos = '7'.
wa_fcat-fieldname = 'AEDAT'.
wa_fcat-seltext_m = 'DATE'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

  gs_layout-colwidth_optimize = 'X'.
  gs_layout-zebra = 'X'.


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
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
    I_BUFFER_ACTIVE                   = 'X'
   I_CALLBACK_PROGRAM                = sy-repid
*   I_CALLBACK_PF_STATUS_SET          = ' '
*   I_CALLBACK_USER_COMMAND           = ' '
   I_CALLBACK_TOP_OF_PAGE            = 'TOP_OF_PAGE'
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
*   I_STRUCTURE_NAME                  =
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
   IS_LAYOUT                         = gs_layout
   IT_FIELDCAT                        = it_fcat
*   IT_EXCLUDING                      =
*   IT_SPECIAL_GROUPS                 =
*   IT_SORT                           =
*   IT_FILTER                         =
*   IS_SEL_HIDE                       =
*   I_DEFAULT                         = 'X'
*   I_SAVE                            = ' '
*   IS_VARIANT                        =
*   IT_EVENTS                         =
*   IT_EVENT_EXIT                     =
*   IS_PRINT                          =
*   IS_REPREP_ID                      =
*   I_SCREEN_START_COLUMN             = 0
*   I_SCREEN_START_LINE               = 0
*   I_SCREEN_END_COLUMN               = 0
*   I_SCREEN_END_LINE                 = 0
*   I_HTML_HEIGHT_TOP                 = 0
*   I_HTML_HEIGHT_END                 = 0
*   IT_ALV_GRAPHICS                   =
*   IT_HYPERLINK                      =
*   IT_ADD_FIELDCAT                   =
*   IT_EXCEPT_QINFO                   =
*   IR_SALV_FULLSCREEN_ADAPTER        =
*   O_PREVIOUS_SRAL_HANDLER           =
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  TABLES
    t_outtab                          = it_purchase
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

ENDFORM.


FORM top_of_page.

  wa_header-typ = 'S'.
  wa_header-key = 'NAME : '.
  wa_header-info = 'PURCHASE ORDER DETAILS'.
  APPEND wa_header to it_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary       = it_header
*     I_LOGO                   =
*     I_END_OF_LIST_GRID       =
*     I_ALV_FORM               =
            .
  ENDFORM.

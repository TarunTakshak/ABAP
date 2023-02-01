*&---------------------------------------------------------------------*
*& Include          Z1014304_ALV_AMAZON_MAIN
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form get_amazon
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_amazon .


SELECT *
      from Z1014304_T_CUST into TABLE it_amazon.

  IF sy-subrc <> 0 and it_amazon is INITIAL.

    MESSAGE 'Invlaid data' TYPE 'E'.

  ENDIF.
  SORT it_amazon by CUSTOMER_ID.

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
wa_fcat-fieldname = 'CUSTOMER_ID'.
wa_fcat-seltext_m = 'Customer ID'.
APPEND wa_fcat to it_fcat.
Clear wa_fcat.

wa_fcat-col_pos = '2'.
wa_fcat-fieldname = 'ADDRESS_ID'.
wa_fcat-seltext_m = 'ADDRESS ID'.
APPEND wa_fcat to it_fcat.
Clear wa_fcat.

wa_fcat-col_pos = '3'.
wa_fcat-fieldname = 'FIRST_NAME'.
wa_fcat-seltext_m = 'FIRST NAME'.
APPEND wa_fcat to it_fcat.
Clear wa_fcat.


wa_fcat-col_pos = '4'.
wa_fcat-fieldname = 'MIDDLE_NAME'.
wa_fcat-seltext_m = 'MIDDLE NAME'.
APPEND wa_fcat to it_fcat.
Clear wa_fcat.


wa_fcat-col_pos = '5'.
wa_fcat-fieldname = 'LAST_NAME'.
wa_fcat-seltext_m = 'LAST NAME'.
APPEND wa_fcat to it_fcat.
Clear wa_fcat.


wa_fcat-col_pos = '6'.
wa_fcat-fieldname = 'EMAIL'.
wa_fcat-seltext_m = 'EMAIL'.
wa_fcat-edit = 'X'.
APPEND wa_fcat to it_fcat.
Clear wa_fcat.

gs_layout-colwidth_optimize = 'X'.
gs_layout-zebra = 'X'.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_amazon
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_amazon .
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
   EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
   I_BUFFER_ACTIVE                   = 'X'
    I_CALLBACK_PROGRAM                = sy-repid
*   I_CALLBACK_PF_STATUS_SET          = ' '
   I_CALLBACK_USER_COMMAND           = 'USER_COMMAND'
   I_CALLBACK_TOP_OF_PAGE            = 'TOP_OF_PAGE'
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
*   I_STRUCTURE_NAME                  =
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
    IS_LAYOUT                         = gs_layout
    IT_FIELDCAT                       = it_fcat
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
    t_outtab                          = it_amazon
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.


ENDFORM.
*
*FORM top_of_page.
*
*  wa_header-typ = 'S'.
*  wa_header-info = 'AMAZON CUSTOMER DETAILS'.
*  APPEND wa_header to it_header.
*  CLEAR wa_header.
*
*  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
*    EXPORTING
*      it_list_commentary       = it_header
**     I_LOGO                   =
**     I_END_OF_LIST_GRID       =
**     I_ALV_FORM               =
*            .
*
*  ENDFORM.

FORM user_command USING r_ucomm LIKE sy-ucomm
                        r_selfield TYPE slis_selfield.

  CASE R_UCOMM.
    WHEN '&DATA_SAVE'.

     READ TABLE it_amazon INTO wa_amazon INDEX r_selfield-tabindex.
   IF sy-subrc = 0.
     MODIFY Z1014304_T_CUST from wa_amazon.
   IF sy-subrc = 0.
    MESSAGE 'RECORD UPDATE SUCESSFULLY' TYPE 'I'.
   ENDIF.

   ENDIF.

  ENDCASE.
  ENDFORM.

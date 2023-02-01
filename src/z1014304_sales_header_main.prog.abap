*&---------------------------------------------------------------------*
*& Include          Z1014304_SALES_HEADER_MAIN
*&---------------------------------------------------------------------*

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
         vbak~kunnr
         vbak~vbeln
         vbak~erdat
         vbak~trvog
         vbap~zmeng
         vbap~zieme
  INTO TABLE it_sales
  FROM vbak
 INNER JOIN vbap
    ON vbak~vbeln = vbap~vbeln
 WHERE vbak~erdat
    IN s_date.

  IF sy-subrc = 0 AND it_sales IS NOT INITIAL.
    "sorting data by erdat
    SORT it_sales BY erdat.
    else.
     MESSAGE 'INVALID DATA' TYPE 'E'.
   ENDIF.

    LOOP AT  it_sales INTO wa_sales.
      g_month_number = wa_sales-erdat+4(2).

      IF  g_month_number = 01.
        g_month_name = 'January'.
      ELSEIF g_month_number = 02.
        g_month_name = 'FEBruary'.
      ELSEIF g_month_number = 03.
        g_month_name = 'MARCH'.
      ELSEIF g_month_number = '04'.
        g_month_name = 'APril'.
      ELSEIF g_month_number = '05'.
        g_month_name = 'MAY'.
      ELSEIF g_month_number = '06'.
        g_month_name = 'JUNE'.
      ELSEIF g_month_number = '07'.
        g_month_name = 'JULY'.
      ELSEIF g_month_number = '08'.
        g_month_name = 'AUGUST'.
      ELSEIF g_month_number = '09'.
        g_month_name = 'SEPTEMBER'.
      ELSEIF g_month_number = '10'.
        g_month_name = 'OCToBER'.
      ELSEIF g_month_number = '11'.
        g_month_name = 'NOVEMBER'.
      ELSEIF g_month_number = '12'.
        g_month_name = 'DECEMBER'.

      ENDIF.

      ON CHANGE OF g_month_name.
        wa_sales-month = g_month_name.
        MODIFY it_sales FROM wa_sales.
      ENDON.
    ENDLOOP.                           "loop at it_sales...

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

  "field catlog
  wa_fcat-col_pos = 1.
  wa_fcat-fieldname = 'KUNNR'.
  wa_fcat-seltext_m = 'Customer Number'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 2.
  wa_fcat-fieldname = 'VBELN'.
  wa_fcat-seltext_m = 'SALES ID'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 3.
  wa_fcat-fieldname = 'ERDAT'.
  wa_fcat-seltext_m = 'DATE'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 4.
  wa_fcat-fieldname = 'TRVOG'.
  wa_fcat-seltext_m = 'Transcation Group'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 5.
  wa_fcat-fieldname = 'ZMENG'.
  wa_fcat-seltext_m = 'Target Quantity'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 6.
  wa_fcat-fieldname = 'ZIEME'.
  wa_fcat-seltext_m = 'UOM'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 7.
  wa_fcat-fieldname = 'MONTH'.
  wa_fcat-seltext_m = 'Month Name'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  gs_layout-colwidth_optimize = 'X'.
  gs_layout-zebra = 'X'.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_vbak_vbap
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_vbak_vbap .
*
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'



    EXPORTING
*     I_INTERFACE_CHECK                 = ' '
*     I_BYPASSING_BUFFER                = ' '
     I_BUFFER_ACTIVE                   = 'X'
     I_CALLBACK_PROGRAM                =  sy-repid
*     I_CALLBACK_PF_STATUS_SET          = ' '
      I_CALLBACK_USER_COMMAND           = 'X'
      I_CALLBACK_TOP_OF_PAGE            = 'TOP_OF_PAGE'
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME                  =
*     I_BACKGROUND_ID                   = ' '
*     I_GRID_TITLE                      =
*     I_GRID_SETTINGS                   =
      IS_LAYOUT                         = gs_layout
      it_fieldcat                       = it_fcat
*     IT_EXCLUDING                      =
*     IT_SPECIAL_GROUPS                 =
*     IT_SORT                           =
*     IT_FILTER                         =
*     IS_SEL_HIDE                       =
*     I_DEFAULT                         = 'X'
*     I_SAVE                            = ' '
*     IS_VARIANT                        =
*     IT_EVENTS                         =
*     IT_EVENT_EXIT                     =
*     IS_PRINT                          =
*     IS_REPREP_ID                      =
*     I_SCREEN_START_COLUMN             = 0
*     I_SCREEN_START_LINE               = 0
*     I_SCREEN_END_COLUMN               = 0
*     I_SCREEN_END_LINE                 = 0
*     I_HTML_HEIGHT_TOP                 = 0
*     I_HTML_HEIGHT_END                 = 0
*     IT_ALV_GRAPHICS                   =
*     IT_HYPERLINK                      =
*     IT_ADD_FIELDCAT                   =
*     IT_EXCEPT_QINFO                   =
*     IR_SALV_FULLSCREEN_ADAPTER        =
*     O_PREVIOUS_SRAL_HANDLER           =
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           =
*     ES_EXIT_CAUSED_BY_USER            =
    TABLES
      t_outtab    = it_sales
* EXCEPTIONS
*     PROGRAM_ERROR                     = 1
*     OTHERS      = 2
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
ENDFORM.

FORM top_of_page.
  data : value TYPE char10.
  value = 'SALES HEADER DETAILS'.
  WRITE : value .

  wa_header-typ = 'H'.
  wa_header-key = 'NAME : '.
  wa_header-info = 'SALES HEADER DETAILS'.
  APPEND wa_header to it_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary       = it_header
     I_LOGO                   =  'LOGO'.
*     I_END_OF_LIST_GRID       =
*     I_ALV_FORM               =
 .
endform.
*&---------------------------------------------------------------------*
*& Form display_vbak_vbap_list
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_vbak_vbap_list .


  CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
   EXPORTING
*     I_INTERFACE_CHECK              = ' '
*     I_BYPASSING_BUFFER             =
     I_BUFFER_ACTIVE                = 'X'
     I_CALLBACK_PROGRAM             = sy-repid
*     I_CALLBACK_PF_STATUS_SET       = ' '
     I_CALLBACK_USER_COMMAND        = 'X'
*     I_STRUCTURE_NAME               =
     IS_LAYOUT                      = gs_layout
     IT_FIELDCAT                    = it_fcat
*     IT_EXCLUDING                   =
*     IT_SPECIAL_GROUPS              =
*     IT_SORT                        =
*     IT_FILTER                      =
*     IS_SEL_HIDE                    =
*     I_DEFAULT                      = 'X'
*     I_SAVE                         = ' '
*     IS_VARIANT                     =
*     IT_EVENTS                      =
*     IT_EVENT_EXIT                  =
*     IS_PRINT                       =
*     IS_REPREP_ID                   =
*     I_SCREEN_START_COLUMN          = 0
*     I_SCREEN_START_LINE            = 0
*     I_SCREEN_END_COLUMN            = 0
*     I_SCREEN_END_LINE              = 0
*     IR_SALV_LIST_ADAPTER           =
*     IT_EXCEPT_QINFO                =
*     I_SUPPRESS_EMPTY_DATA          = ABAP_FALSE
*     IO_SALV_ADAPTER                =
*   IMPORTING
*     E_EXIT_CAUSED_BY_CALLER        =
*     ES_EXIT_CAUSED_BY_USER         =
    TABLES
      t_outtab                       = it_sales
*   EXCEPTIONS
*     PROGRAM_ERROR                  = 1
*     OTHERS                         = 2
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


ENDFORM.

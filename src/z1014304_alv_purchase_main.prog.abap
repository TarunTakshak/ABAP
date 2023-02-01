*&---------------------------------------------------------------------*
*& Include          Z1014304_ALV_PURCHASE_MAIN
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

  SELECT ekko~ebeln
         ekko~bukrs
         ekko~bstyp
         ekko~bsart
         ekko~aedat
         ekko~lifnr

    FROM ekko INTO TABLE it_ekko WHERE ebeln IN s_ebeln.

  IF sy-subrc <> 0 and it_ekko is INITIAL.

    MESSAGE 'INVALID DATA ' TYPE 'E'.

    ELSE.
  IF it_ekko IS NOT INITIAL.
    SELECT ekpo~ebeln
           ekpo~ebelp
           ekpo~menge
           ekpo~meins
           ekpo~peinh
           ekpo~netpr
           ekpo~adrn2

      FROM ekpo INTO TABLE it_ekpo FOR ALL ENTRIES IN it_ekko WHERE ebeln = it_ekko-ebeln.

    IF it_ekpo IS NOT INITIAL.

      LOOP AT it_ekpo INTO wa_ekpo.

        READ TABLE it_ekko INTO wa_ekko WITH KEY ebeln = wa_ekpo-ebeln.

        wa_final-ebeln = wa_ekko-ebeln.
        wa_final-bukrs = wa_ekko-bukrs.
        wa_final-bstyp = wa_ekko-bstyp.
        wa_final-bsart = wa_ekko-bsart.
        wa_final-aedat = wa_ekko-aedat.
        wa_final-lifnr = wa_ekko-lifnr.
        wa_final-ebelp = wa_ekpo-ebelp.
        wa_final-menge = wa_ekpo-menge.
        wa_final-meins = wa_ekpo-meins.
        wa_final-peinh = wa_ekpo-peinh.
        wa_final-netpr = wa_ekpo-netpr.
        wa_final-adrn2 = wa_ekpo-adrn2.
        APPEND wa_final TO it_final.
        CLEAR wa_final.

      ENDLOOP.

    ENDIF.

   ENDif.

  ENDIF.

  LOOP AT it_final INTO wa_final.

    IF wa_final-menge < 500.

      wa_final-colour = 'C610'.

    ENDIF.

    MODIFY it_final FROM wa_final TRANSPORTING colour.
    CLEAR wa_final.

  ENDLOOP.


ENDFORM.
*&---------------------------------------------------------------------*
*& Form fieldcatlog1
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM fieldcatlog1 .

  CLEAR wa_fcat.
  REFRESH it_fcat.

  wa_fcat-col_pos = 1.
  wa_fcat-fieldname = 'EBELN'.
  wa_fcat-seltext_m = 'Purchasing Document Number'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 2.
  wa_fcat-fieldname = 'BUKRS'.
  wa_fcat-seltext_m = 'Company Code'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 3.
  wa_fcat-fieldname = 'BSTYP'.
  wa_fcat-seltext_m = 'Purchasing Document Categoryr'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 4.
  wa_fcat-fieldname = 'BSART'.
  wa_fcat-seltext_m = 'Purchasing Document Type'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 5.
  wa_fcat-fieldname = 'AEDAT'.
  wa_fcat-seltext_m = 'ENTRY DATE'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 6.
  wa_fcat-fieldname = 'LIFNR'.
  wa_fcat-seltext_m = 'Vendors account number'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 7.
  wa_fcat-fieldname = 'EBELP'.
  wa_fcat-seltext_m = 'Item Number'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 8.
  wa_fcat-fieldname = 'MENGE'.
  wa_fcat-seltext_m = 'Purchase Order Quantity'.
  wa_fcat-do_sum = 'X'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 9.
  wa_fcat-fieldname = 'MEINS'.
  wa_fcat-seltext_m = 'Unit of Measure'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 10.
  wa_fcat-fieldname = 'PEINH'.
  wa_fcat-seltext_m = 'Price unit'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 11.
  wa_fcat-fieldname = 'NETPR'.
  wa_fcat-seltext_m = 'Net Price'.
  wa_fcat-do_sum = 'X'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 12.
  wa_fcat-fieldname = 'ADRN2'.
  wa_fcat-seltext_m = 'Number of delivery address'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

"desinging layout
  gs_layout-colwidth_optimize = 'X'.
  gs_layout-zebra = 'X'.
  gs_layout-info_fieldname = 'COLOUR'.

"sorting ebeln
  wa_sort-spos = 1.
  wa_sort-fieldname = 'EBELN'.
  wa_sort-up        = 'X'.
  wa_sort-subtot    = 'X'.
  APPEND wa_sort TO it_sort.

"creation of events
  wa_event-name = 'TOP_OF_PAGE'.
  wa_event-form = 'TOP_OF_PAGE'.
  APPEND wa_event TO it_event.
  CLEAR wa_event.

  wa_event-name = 'END_OF_LIST'.
  wa_event-form = 'END_OF_PAGE'.
  APPEND wa_event TO it_event.
  CLEAR wa_event.



ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_ekko_ekpo
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_ekko_ekpo .

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK       = ' '
*     I_BYPASSING_BUFFER      = ' '
      i_buffer_active         = 'X'
      i_callback_program      = sy-repid
      I_CALLBACK_PF_STATUS_SET   = 'PF_STATUS_PO'
      i_callback_user_command = 'USER_COMMAND'
*     I_CALLBACK_TOP_OF_PAGE  = ' '
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME        =
*     I_BACKGROUND_ID         = ' '
*     I_GRID_TITLE            =
*     I_GRID_SETTINGS         =
      is_layout               = gs_layout
      it_fieldcat             = it_fcat
*     IT_EXCLUDING            =
*     IT_SPECIAL_GROUPS       =
      it_sort                 = it_sort
*     IT_FILTER               =
*     IS_SEL_HIDE             =
*     I_DEFAULT               = 'X'
*     I_SAVE                  = ' '
*     IS_VARIANT              =
      it_events               = it_event
*     IT_EVENT_EXIT           =
*     IS_PRINT                =
*     IS_REPREP_ID            =
*     I_SCREEN_START_COLUMN   = 0
*     I_SCREEN_START_LINE     = 0
*     I_SCREEN_END_COLUMN     = 0
*     I_SCREEN_END_LINE       = 0
*     I_HTML_HEIGHT_TOP       = 0
*     I_HTML_HEIGHT_END       = 0
*     IT_ALV_GRAPHICS         =
*     IT_HYPERLINK            =
*     IT_ADD_FIELDCAT         =
*     IT_EXCEPT_QINFO         =
*     IR_SALV_FULLSCREEN_ADAPTER        =
*     O_PREVIOUS_SRAL_HANDLER =
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER =
*     ES_EXIT_CAUSED_BY_USER  =
    TABLES
      t_outtab                = it_final
* EXCEPTIONS
*     PROGRAM_ERROR           = 1
*     OTHERS                  = 2
    .
  REFRESH it_event.
ENDFORM.

FORM top_of_page.

  CLEAR wa_header.
  REFRESH it_header.

  wa_header-typ = 'H'.
  wa_header-info = 'PURCHASE ORDER DETAILS FOR ITEM AND HEADER'.
  APPEND wa_header TO it_header.
  CLEAR wa_header.

  wa_header-typ = 'S'.
  wa_header-key = 'USERNAME : '.
  wa_header-info = sy-uname.
  APPEND wa_header TO it_header.
  CLEAR wa_header.

  wa_header-typ = 'S'.
  wa_header-key = 'DATE : '.
  wa_header-info = sy-datum.
  APPEND wa_header TO it_header.
  CLEAR wa_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = it_header
      i_logo             = 'LOGO'
*     I_END_OF_LIST_GRID =
*     I_ALV_FORM         =
    .
ENDFORM.

FORM end_of_page.

  CLEAR wa_header.
  REFRESH it_header.

  wa_header-typ = 'S'.
  wa_header-key = 'END_OF_LIST : '.
  wa_header-info = 'PURCAHSE ORDER'.
  APPEND wa_header TO it_header.
  CLEAR wa_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = it_header
*     I_LOGO             =
*     I_END_OF_LIST_GRID =
*     I_ALV_FORM         =
    .
ENDFORM.



FORM user_command USING r_ucom TYPE sy-ucomm
                        r_selfield TYPE slis_selfield.

  CASE R_ucom.
    WHEN '&IC1'.
      READ TABLE it_final INTO wa_final INDEX r_selfield-tabindex.
      IF sy-subrc <> 0 AND it_final IS INITIAL.

        MESSAGE 'INVALID DATA' TYPE 'E'.

      ENDIF.
      SELECT lifnr
             land1
             name1
             name2
      FROM lfa1 INTO TABLE it_lfa WHERE lifnr = wa_final-lifnr.

      IF sy-subrc <> 0 AND it_final IS INITIAL.

        MESSAGE 'INVALID DATA' TYPE 'E'.

      ELSE.
        PERFORM fieldcatlog2.
        PERFORM display_lfa1.

      ENDIF.

    WHEN 'ME21N'.

        set PARAMETER ID 'BAS' FIELD wa_final-ebeln.
        CALL TRANSACTION 'ME21N' AND SKIP FIRST SCREEN.

  ENDCASE.
ENDFORM.

FORM pf_status_po USING r_co TYPE slis_t_extab.
  SET PF-STATUS 'Z1014304_PF_PO'.
 ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_lfa1
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form fieldcatlog2
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM fieldcatlog2 .

  CLEAR wa_fcat.
  REFRESH it_fcat.

  wa_fcat-col_pos = 1.
  wa_fcat-fieldname = 'LIFNR'.
  wa_fcat-seltext_m = 'Account Number of Supplier'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 2.
  wa_fcat-fieldname = 'LAND1'.
  wa_fcat-seltext_m = 'Country'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 3.
  wa_fcat-fieldname = 'NAME1'.
  wa_fcat-seltext_m = 'First Name'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 4.
  wa_fcat-fieldname = 'NAME2'.
  wa_fcat-seltext_m = 'MIDDLE NAME'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

"designing layout
  gs_layout-colwidth_optimize = 'X'.
  gs_layout-zebra = 'X'.

"creation of events
  wa_event-name = 'TOP_OF_PAGE'.
  wa_event-form = 'TOP_OF_PAGE1'.
  APPEND wa_event TO it_event.
  CLEAR wa_event.

  wa_event-name = 'END_OF_LIST'.
  wa_event-form = 'END_OF_LIST1'.
  APPEND wa_event TO it_event.
  CLEAR wa_event.



ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_lfa1
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_lfa1 .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK  = ' '
*     I_BYPASSING_BUFFER = ' '
*     I_BUFFER_ACTIVE    = ' '
      i_callback_program = sy-repid
*     I_CALLBACK_PF_STATUS_SET          = ' '
*     I_CALLBACK_USER_COMMAND           = ' '
*     I_CALLBACK_TOP_OF_PAGE            = ' '
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME   =
*     I_BACKGROUND_ID    = ' '
*     I_GRID_TITLE       =
*     I_GRID_SETTINGS    =
      is_layout          = gs_layout
      it_fieldcat        = it_fcat
*     IT_EXCLUDING       =
*     IT_SPECIAL_GROUPS  =
*     IT_SORT            =
*     IT_FILTER          =
*     IS_SEL_HIDE        =
*     I_DEFAULT          = 'X'
*     I_SAVE             = ' '
*     IS_VARIANT         =
      it_events          = it_event
*     IT_EVENT_EXIT      =
*     IS_PRINT           =
*     IS_REPREP_ID       =
*     I_SCREEN_START_COLUMN             = 0
*     I_SCREEN_START_LINE               = 0
*     I_SCREEN_END_COLUMN               = 0
*     I_SCREEN_END_LINE  = 0
*     I_HTML_HEIGHT_TOP  = 0
*     I_HTML_HEIGHT_END  = 0
*     IT_ALV_GRAPHICS    =
*     IT_HYPERLINK       =
*     IT_ADD_FIELDCAT    =
*     IT_EXCEPT_QINFO    =
*     IR_SALV_FULLSCREEN_ADAPTER        =
*     O_PREVIOUS_SRAL_HANDLER           =
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           =
*     ES_EXIT_CAUSED_BY_USER            =
    TABLES
      t_outtab           = it_lfa
* EXCEPTIONS
*     PROGRAM_ERROR      = 1
*     OTHERS             = 2
    .
ENDFORM.


FORM top_of_page1.

  CLEAR wa_header.
  REFRESH it_header.

  wa_header-typ = 'H'.
  wa_header-info = 'SUPPLIER DETAILS'.
  APPEND wa_header TO it_header.
  CLEAR wa_header.

  wa_header-typ = 'S'.
  wa_header-key = 'USERNAME : '.
  wa_header-info = sy-uname.
  APPEND wa_header TO it_header.
  CLEAR wa_header.

  wa_header-typ = 'S'.
  wa_header-key = 'DATE : '.
  wa_header-info = sy-datum.
  APPEND wa_header TO it_header.
  CLEAR wa_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = it_header
      i_logo             = 'LOGO'
*     I_END_OF_LIST_GRID =
*     I_ALV_FORM         =
    .
ENDFORM.

FORM end_of_list1.

  CLEAR wa_header.
  REFRESH it_header.

  wa_header-typ = 'S'.
  wa_header-key = 'END_OF_LIST :'.
  wa_header-info = 'SUPPLIER DETAILS'.
  APPEND wa_header TO it_header.
  CLEAR wa_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = it_header
      I_LOGO             = 'LOGO'
*     I_END_OF_LIST_GRID =
*     I_ALV_FORM         =
    .
ENDFORM.

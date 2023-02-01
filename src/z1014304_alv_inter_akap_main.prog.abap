*&---------------------------------------------------------------------*
*& Include          Z1014304_ALV_INTER_AKAP_MAIN
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form get_vabk
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*

*
FORM get_vabk .

  SELECT vbeln
         erdat
         erzet
         ernam
    FROM vbak INTO TABLE it_vbak WHERE vbeln IN s_vbeln.

  IF sy-subrc <> 0 AND it_vbak IS INITIAL.
    MESSAGE 'ENTER VALID DATA' TYPE 'E'.

  ENDIF.

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

  wa_fcat-col_pos = 1.
  wa_fcat-fieldname = 'VBELN'.
  wa_fcat-seltext_m = 'Sales Document'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 2.
  wa_fcat-fieldname = 'ERDAT'.
  wa_fcat-seltext_m = 'Date'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 3.
  wa_fcat-fieldname = 'ERZET'.
  wa_fcat-seltext_m = 'ENTRY TIME'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 4.
  wa_fcat-fieldname = 'ERNAM'.
  wa_fcat-seltext_m = 'Name of the person'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  gs_layout-colwidth_optimize = 'X'.
  gs_layout-zebra = 'X'.


ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_vbak
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_vbak .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK       = ' '
*     I_BYPASSING_BUFFER      = ' '
*     I_BUFFER_ACTIVE         = 'X'
      i_callback_program      = sy-repid
*     I_CALLBACK_PF_STATUS_SET          = ' '
      i_callback_user_command = 'USER-COMMAND'
      i_callback_top_of_page  = 'TOP_OF_PAGE'
      is_layout               = gs_layout
      it_fieldcat             = it_fcat
*           =
    TABLES
      t_outtab                = it_vbak.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


ENDFORM.

FORM top_of_page.
  wa_header-typ = 'S'.
  wa_header-info = 'SAMPLE PROGRAM USING INTERACTIVE ALV'.
  APPEND wa_header to it_header.
  CLEAR wa_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary       = it_header
*     I_LOGO                   =
*     I_END_OF_LIST_GRID       =
*     I_ALV_FORM               =
           .
  ENDFORM.

FORM user-command USING r_ucom LIKE sy-ucomm
                        r_selfield TYPE slis_selfield.

  CASE r_ucom.
    WHEN '&IC1'.
      READ TABLE it_vbak INTO wa_vbak INDEX r_selfield-tabindex.

      SELECT   vbeln
               posnr
               matnr
               matwa
        FROM vbap INTO TABLE it_vbap WHERE vbeln = wa_vbak-vbeln.

      IF sy-subrc <> 0 AND it_vbap IS INITIAL.

        MESSAGE 'INVALID DATA' TYPE 'E'.

      ELSE.
        PERFORM field_catlog1.
        PERFORM diplay_vbap.


      ENDIF.

  ENDCASE.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form field_catlog1
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM field_catlog1 .

  CLEAR wa_fcat.
  REFRESH it_fcat.
  refresh it_header.

  wa_fcat-col_pos = 1.
  wa_fcat-fieldname = 'VBELN'.
  wa_fcat-seltext_m = 'Document ITEM NO'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 2.
  wa_fcat-fieldname = 'POSNR'.
  wa_fcat-seltext_m = 'Sales Document Item'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 3.
  wa_fcat-fieldname = 'MATNR'.
  wa_fcat-seltext_m = 'MATERIAL NUMBER'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat1.


  wa_fcat-col_pos = 4.
  wa_fcat-fieldname = 'MATWA'.
  wa_fcat-seltext_m = 'Material Entered'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.



  gs_layout-colwidth_optimize = 'X'.
  gs_layout-zebra = 'X'.


ENDFORM.
*&---------------------------------------------------------------------*
*& Form diplay_vbap
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM diplay_vbap .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK       = ' '
*     I_BYPASSING_BUFFER      = ' '
      "    I_BUFFER_ACTIVE                   = 'X'
   I_CALLBACK_PROGRAM                = sy-repid
*     I_CALLBACK_PF_STATUS_SET          = ' '
      i_callback_user_command = 'USER-COMMAND1'
  "   I_CALLBACK_TOP_OF_PAGE  = 'TOP_OF_PAGE'
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME        =
*     I_BACKGROUND_ID         = ' '
*     I_GRID_TITLE            =
*     I_GRID_SETTINGS         =
      is_layout               = gs_layout
      it_fieldcat             = it_fcat
    TABLES
      t_outtab                = it_vbap
* EXCEPTIONS
*     PROGRAM_ERROR           = 1
*     OTHERS                  = 2
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


ENDFORM.

FORM user-command1 USING r_ucom LIKE sy-ucomm
                          r_selfield TYPE slis_selfield.

  CASE r_ucom.
    WHEN '&IC1'.

      READ TABLE it_vbap INTO wa_vbap INDEX r_selfield-tabindex.
      if sy-subrc = 0.


      SELECT
       matnr
       laeda
       aenam
       vpsta
        FROM mara INTO TABLE it_mara WHERE matnr = wa_vbap-matnr.

      IF sy-subrc <> 0 AND it_mara IS INITIAL.

        MESSAGE 'INVALID DATA' TYPE 'E'.

      ELSE.

        PERFORM field_catlog2.
        PERFORM display_mara.

      ENDIF.
      endif.
  ENDCASE.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form field_catlog2
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM field_catlog2 .

  CLEAR wa_fcat.
  REFRESH it_fcat.

  wa_fcat-col_pos = 1.
  wa_fcat-fieldname = 'MATNR'.
  wa_fcat-seltext_m = 'MATERIAL NUMBER'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 2.
  wa_fcat-fieldname = 'LAEDA'.
  wa_fcat-seltext_m = 'Date of Last Change'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 3.
  wa_fcat-fieldname = 'AENAM'.
  wa_fcat-seltext_m = 'Name of Person'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-col_pos = 4.
  wa_fcat-fieldname = 'VPSTA'.
  wa_fcat-seltext_m = 'Maintenance status'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  gs_layout-colwidth_optimize = 'X'.
  gs_layout-zebra = 'X'.


ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_mara
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_mara .

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK                 = ' '
*     I_BYPASSING_BUFFER                = ' '
      I_BUFFER_ACTIVE                   = 'X'
    I_CALLBACK_PROGRAM                  = sy-repid
*     I_CALLBACK_PF_STATUS_SET          = ' '
     I_CALLBACK_USER_COMMAND           = 'USER_COMMAND3'
*     I_CALLBACK_TOP_OF_PAGE            = ' '
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME                  =
*     I_BACKGROUND_ID                   = ' '
*     I_GRID_TITLE                      =
*     I_GRID_SETTINGS                   =
      is_layout                         = gs_layout
      it_fieldcat                       = it_fcat

    TABLES
      t_outtab                          = it_mara
* EXCEPTIONS
*     PROGRAM_ERROR                     = 1
*     OTHERS      = 2
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


ENDFORM.

FORM user_command3 USING r_ucom like sy-ucomm
       r_selfield TYPE slis_selfield.

  CASE r_ucom.
    WHEN '&IC1'.

      READ TABLE it_mara INTO wa_mara INDEX r_selfield-tabindex.
      if sy-subrc = 0 and wa_mara-matnr is not INITIAL.


        set PARAMETER ID 'MAT' field wa_mara-matnr.
        call TRANSACTION 'MM03' AND SKIP FIRST SCREEN.

        ENDIF.
        ENDCASE.
        endform.

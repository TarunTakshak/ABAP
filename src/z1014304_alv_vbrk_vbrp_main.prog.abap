*&---------------------------------------------------------------------*
*& Include          Z1014304_ALV_VBRK_VBRP_MAIN
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form get_vbrk_vbrp
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_vbrk_vbrp .

  SELECT  vbrk~vbeln
          vbrk~fkart
          vbrk~fktyp
          vbrk~vbtyp
          vbrk~waerk
  FROM vbrk INTO TABLE it_vbrk WHERE vbeln IN s_vbeln.

  IF sy-subrc <> 0 AND it_vbrk IS  INITIAL.

    MESSAGE 'INVALID DATA' TYPE 'E'.


  ELSE.

    SORT it_vbrk BY vbeln.
    PERFORM get_vbrp.

  ENDIF.


ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_vbrp
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_vbrp .

  SELECT vbrp~vbeln
         vbrp~aubel
         vbrp~posnr
         vbrp~uepos
         vbrp~fkimg
         vbrp~vrkme
    FROM vbrp
    INTO TABLE it_vbrp
     FOR ALL ENTRIES IN it_vbrk
   WHERE vbeln = it_vbrk-vbeln.

  IF sy-subrc <> 0 AND it_vbrp IS  INITIAL.

    MESSAGE 'INVALID DATA' TYPE 'E'.


  ELSE.

    LOOP AT it_vbrp INTO wa_vbrp.
      READ TABLE it_vbrk INTO wa_vbrk WITH KEY vbeln = wa_vbrP-vbeln.

      wa_final-vbeln  =  wa_vbrk-vbeln.
      wa_final-fkart  =  wa_vbrk-fkart.
      wa_final-fktyp  =  wa_vbrk-fktyp.
      wa_final-vbtyp  =  wa_vbrk-vbtyp.
      wa_final-waerk  =  wa_vbrk-waerk.
      wa_final-aubel  =  wa_vbrp-aubel.
      wa_final-posnr  =  wa_vbrp-posnr.
      wa_final-uepos  =  wa_vbrp-uepos.
      wa_final-fkimg  =  wa_vbrp-fkimg.
      wa_final-vrkme  =  wa_vbrp-vrkme.
      APPEND wa_final TO it_final.

    ENDLOOP.

    PERFORM field_catlog1.
  ENDIF.

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

  wa_fcat-col_pos = 1.
  wa_fcat-fieldname = 'VBELN'.
  wa_fcat-seltext_m = 'Billing Document'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 2.
  wa_fcat-fieldname = 'FKART'.
  wa_fcat-seltext_m = 'Billing Type'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 3.
  wa_fcat-fieldname = 'FKTYP'.
  wa_fcat-seltext_m = 'Billing Category'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 4.
  wa_fcat-fieldname = 'VBTYP'.
  wa_fcat-seltext_m = 'SD Document Category'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 5.
  wa_fcat-fieldname = 'WAERK'.
  wa_fcat-seltext_m = 'SD Document Currency'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 6.
  wa_fcat-fieldname = 'POSNR'.
  wa_fcat-seltext_m = 'Billing Item'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 7.
  wa_fcat-fieldname = 'UEPOS'.
  wa_fcat-seltext_m = 'Material Structures'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 8.
  wa_fcat-fieldname = 'FKIMG'.
  wa_fcat-seltext_m = 'Actual billed quantity'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 9.
  wa_fcat-fieldname = 'VRKME'.
  wa_fcat-seltext_m = 'Sales unit'.
  APPEND wa_fcat TO it_fcat.

  wa_fcat-col_pos = 10.
  wa_fcat-fieldname = 'AUBEL'.
  wa_fcat-seltext_m = 'Sales dcoument'.
  APPEND wa_fcat TO it_fcat.


  gs_layout-colwidth_optimize = 'X'.
  gs_layout-zebra = 'X'.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_vbrk_vbrp
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_vbrk_vbrp .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK       = ' '
*     I_BYPASSING_BUFFER      = ' '
*     I_BUFFER_ACTIVE         = ' '
      i_callback_program      = sy-repid
*     I_CALLBACK_PF_STATUS_SET          = ' '
      i_callback_user_command = 'USER_COMMAND'
      i_callback_top_of_page  = 'TOP_OF_PAGE'
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
*     IT_SORT                 =
*     IT_FILTER               =
*     IS_SEL_HIDE             =
*     I_DEFAULT               = 'X'
*     I_SAVE                  = ' '
*     IS_VARIANT              =
*     IT_EVENTS               =
*     IT_EVENT_EXIT           =
*     IS_PRINT                =
    TABLES
      t_outtab                = it_final
* EXCEPTIONS
*     PROGRAM_ERROR           = 1
*     OTHERS                  = 2
    .
ENDFORM.

FORM top_of_page.

  CLEAR wa_header.
  REFRESH it_header.

  wa_header-typ = 'H'.
  wa_header-info = 'BILLING DOCUMENT DETAILS'.
  APPEND wa_header TO it_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = it_header
*     I_LOGO             =
*     I_END_OF_LIST_GRID =
*     I_ALV_FORM         =
    .
ENDFORM.

FORM user_command USING r_com TYPE sy-ucomm
                        r_selfield TYPE slis_selfield.
   READ TABLE it_final INTO wa_final INDEX r_selfield-tabindex.

      SET PARAMETER ID 'AUN' FIELD wa_final-aubel.
      CALL TRANSACTION 'VA03' AND SKIP FIRST SCREEN.
ENDFORM.

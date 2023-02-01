*&---------------------------------------------------------------------*
*& Report Z1014304_OPEN_CLOSE_C_V
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_open_close_c_v.

*include to hold structure and data declartions
INCLUDE z1014304_o_c_structure.

"initilazing values for selection-screen
INITIALIZATION.
  t1 = 'Customer and vendor details'.
  in1 = 'Click Any Radiobutton'.
  t2 = 'Opeing and Closing Details'.

*include for display output
  INCLUDE z1014304_o_c_display_output.

START-OF-SELECTION.

  IF p_cust = 'X'.
    IF p_open = 'X'.

      PERFORM get_bsid.
      PERFORM display_bsid.
    ENDIF.

    IF p_close = 'X'.

      PERFORM get_bsad.
      PERFORM display_bsad.

    ENDIF.
    """ endif.

  ELSEIF p_vend = 'X'.
    IF p_open = 'X'.
      PERFORM get_bsik.
      PERFORM display_bsik.
    ENDIF.
    IF p_close = 'X'.
      PERFORM get_bsak.
      PERFORM display_bsak.
    ENDIF.
  ENDIF.
*&---------------------------------------------------------------------*
*& Form get_bsid
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_bsid .
*  SELECT bukrs
*         kunnr
*         umsks
*         umskz
*         augdt
*         augbl
*         zuonr
*         gjahr
*         belnr
*         buzei
*         budat
*    FROM bsid
*    INTO TABLE it_bsid
*   WHERE bsid~kunnr = p_kunnr
*     And augdt = s_date.
*  IF sy-subrc <> 0 AND it_bsid IS  INITIAL.
*    MESSAGE 'Data Not found' TYPE 'E'.
*  ENDIF.
  CALL FUNCTION 'Z1014304_FM_BSAD'
    EXPORTING
      p_kunnr       = s_kunnr
      date          = s_date
    CHANGING
      it_bsad       = it_bsad.


ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_bsid
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_bsid .
  LOOP AT it_bsid INTO wa_bsid.
    WRITE : /  wa_bsid-bukrs,
               wa_bsid-kunnr,
               wa_bsid-umsks,
               wa_bsid-umskz,
               wa_bsid-augdt,
               wa_bsid-augbl,
               wa_bsid-zuonr,
               wa_bsid-gjahr,
               wa_bsid-belnr,
               wa_bsid-buzei,
               wa_bsid-budat.
  ENDLOOP.                             "loop at it_bsid...
ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_bsad
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_bsad .
  SELECT bukrs
         kunnr
         umsks
         umskz
         augdt
         augbl
    FROM bsad
    INTO TABLE it_bsad
   WHERE bsad~kunnr in s_kunnr
     And augdt = s_date.
  IF sy-subrc <> 0 AND it_bsad IS INITIAL.
    MESSAGE 'Data Not found' TYPE 'E'.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_bsad
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_bsad .

  LOOP AT it_bsad INTO wa_bsad.
    WRITE : /  wa_bsad-bukrs,
               wa_bsad-kunnr,
               wa_bsad-umsks,
               wa_bsad-umskz,
               wa_bsad-augdt,
               wa_bsad-augbl,
               wa_bsad-zuonr,
               wa_bsad-gjahr,
               wa_bsad-belnr,
               wa_bsad-buzei,
               wa_bsad-budat.
  ENDLOOP.                              "loop at it_bsad...
ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_bsik
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_bsik .
  SELECT  bukrs
          lifnr
          umsks
          umskz
          augdt
          augbl
          zuonr
          gjahr
          belnr
          buzei
          budat
     FROM bsik
     INTO TABLE it_bsik
    WHERE bsik~lifnr = p_lifnr
      And augdt = s_date1.
  IF sy-subrc <> 0 AND it_bsik IS INITIAL.
    MESSAGE 'Data Not found' TYPE 'E'.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_bsik
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_bsik .
  LOOP AT it_bsik INTO wa_bsik.
    WRITE : /  wa_bsik-bukrs,
               wa_bsik-lifnr,
               wa_bsik-umsks,
               wa_bsik-umskz,
               wa_bsik-augdt,
               wa_bsik-augbl,
               wa_bsik-zuonr,
               wa_bsik-gjahr,
               wa_bsik-belnr,
               wa_bsik-buzei,
               wa_bsik-budat.
  ENDLOOP.                              "loop at it_bsik...
ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_bsak
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_bsak .
  SELECT  bukrs
          lifnr
          umsks
          umskz
          augdt
          augbl
          zuonr
          gjahr
          belnr
          buzei
          budat
     FROM bsak
     INTO TABLE it_bsak
    WHERE bsak~lifnr = p_lifnr
      And augdt = s_date1.
  IF sy-subrc <> 0 AND it_bsak IS INITIAL.
    MESSAGE 'Data Not found' TYPE 'E'.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_bsak
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_bsak .
  LOOP AT it_bsak INTO wa_bsak.
    WRITE : /  wa_bsak-bukrs,
               wa_bsak-lifnr,
               wa_bsak-umsks,
               wa_bsak-umskz,
               wa_bsak-augdt,
               wa_bsak-augbl,
               wa_bsak-zuonr,
               wa_bsak-gjahr,
               wa_bsak-belnr,
               wa_bsak-buzei,
               wa_bsak-budat.
  ENDLOOP.                              "loop at it_bsak...
ENDFORM.

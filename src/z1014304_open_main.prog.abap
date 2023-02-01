*&---------------------------------------------------------------------*
*& Include          Z1014304_OPEN_MAIN
*&---------------------------------------------------------------------*
  IF p_cust = 'X'.

      PERFORM get_bsid.
      PERFORM get_bsad.
   ELSEIF p_vend = 'X'.

     endif.

*&---------------------------------------------------------------------*
*& Form get_bsid
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_bsid .
   IF p_open = 'X'.
 SELECT bukrs
             kunnr
             umsks
             umskz
             augdt
             augbl
             zuonr
             gjahr
             belnr
             buzei
             budat
        FROM bsid INTO TABLE it_bsid WHERE bsid~kunnr = p_kunnr.
      IF sy-subrc <> 0 AND it_bsid IS  INITIAL.
        MESSAGE 'Data Not found' TYPE 'E'.
        endif.
   PERFORM display_bsid.
    endif.
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
        ENDLOOP.
       " endif.
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
 IF p_close = 'X'.
      SELECT  bukrs
              kunnr
              umsks
              umskz
              augdt
              augbl
              zuonr
              gjahr
              belnr
              buzei
              budat
        FROM bsad INTO TABLE it_bsad WHERE bsad~kunnr = p_kunnr.
      IF sy-subrc <> 0 AND it_bsad IS INITIAL.
           MESSAGE 'Data Not found' TYPE 'E'.
           endif.
      PERFORM display_bsad.
      endif.
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
        ENDLOOP.
       " endif.
ENDFORM.

*&---------------------------------------------------------------------*
*& Include          Z1014304_SALES_DELIVERY
*&---------------------------------------------------------------------*

  IF p_sales = 'X'.
    PERFORM get_vbak.
    PERFORM display_vbak.
  ELSEIF p_deliv = 'X'.
      PERFORM get_likp.
   PERFORM display_likp.
  ENDIF.

*&---------------------------------------------------------------------*
*& Form get_vbak
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_vbak .

 SELECT vbeln
        erdat
        erzet
        ernam
        angdt
   FROM vbak
   INTO TABLE it_vbak
  WHERE vbak~vbeln in p_s_no.

    IF sy-subrc <> 0 AND it_vbak IS  INITIAL.
      MESSAGE 'Data Not Found' TYPE 'E'.
      ENDIF.
      SORT it_vbak by vbeln.
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
       WRITE :  /   sy-uline+0(120),
                /1  sy-vline,
                 2 'ITEM NO',
                 13 'Date',
                 25 'Entry Time',
                 40 'Name of person',
                 60 'Quoatation',
                / sy-uline+0(120).
      LOOP AT it_vbak INTO wa_vbak.

        WRITE : /2  wa_vbak-vbeln,
                 13 wa_vbak-erdat,
                 25 wa_vbak-erzet,
                 40 wa_vbak-ernam,
                 60 wa_vbak-angdt.
     hide wa_vbak-vbeln.
      ENDLOOP.                         "loop at wa_vbak...
ENDFORM.




*&---------------------------------------------------------------------*
*& Form get_likp
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_likp .
SELECT  likp~vbeln
        likp~bzirk
        likp~vstel
        likp~vkorg
        likp~lfart
        likp~autlf
  FROM likp INTO TABLE it_likp WHERE vbeln in p_d_no.
  IF sy-subrc <> 0 and it_likp is NOT INITIAL .
    MESSAGE 'Data Not Found' TYPE 'E'.
    else.
ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_likp
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_likp .
  WRITE : / sy-uline+0(120),
          /1 sy-vline,
          12'Delivery No',
          24'Sales District',
          44'Shipping Point',
          60'Sales Organizatio',
          75'Delivery Type',
          90'Complete Delivery',
           / sy-uline+0(120).

 LOOP AT it_likp INTO wa_likp.

   WRITE : /12 wa_likp-vbeln,
            24 wa_likp-bzirk,
            44 wa_likp-vstel,
            60 wa_likp-vkorg,
            75 wa_likp-lfart,
            90 wa_likp-autlf.
   hide wa_likp-vbeln.

 ENDLOOP.
ENDFORM.

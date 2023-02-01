*&---------------------------------------------------------------------*
*& Include          Z1014304_SALES_DELIVERY_HIDE
*&---------------------------------------------------------------------*
  IF sy-lsind = 1 AND p_sales = 'X'.
    PERFORM get_vbap.
    PERFORM display_vbap.
  ELSEIF sy-lsind = 1 and p_deliv = 'X'.
     PERFORM get_lips.
    PERFORM display_lips.
  ENDIF.


*&---------------------------------------------------------------------*
*& Form get_vbap
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_vbap .
"select query to fetch data from database table
SELECT  vbeln
        posnr
        matnr
        matwa
        pmatn
   INTO TABLE it_sales
   FROM vbap
  WHERE vbeln = wa_vbak-vbeln.
    IF sy-subrc <> 0 AND it_sales IS  INITIAL.
      MESSAGE 'Data Not Found' TYPE 'E'.
    ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_vbap
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_vbap .
LOOP AT it_sales INTO wa_sales.

        WRITE : / wa_sales-vbeln,
                  wa_sales-posnr,
                  wa_sales-matnr,
                  wa_sales-matwa,
                  wa_sales-pmatn.
      ENDLOOP.                         "loop at wa_sales...
ENDFORM.




*&---------------------------------------------------------------------*
*& Form get_lips
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_lips .

SELECT  lips~VBELN
        lips~POSNR
        lips~PSTYV
        lips~ERNAM
        lips~ERZET
  FROM lips INTO TABLE it_lips WHERE vbeln = wa_likp-vbeln.

   IF sy-subrc <> 0 and it_lips is NOT INITIAL.
     MESSAGE 'Data Not found' TYPE 'E'.
     else.

   ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_lips
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_lips .
LOOP AT it_lips INTO wa_lips.

WRITE : / wa_lips-VBELN,
          wa_lips-POSNR,
          wa_lips-PSTYV,
          wa_lips-ERNAM,
          wa_lips-ERZET.


ENDLOOP.
ENDFORM.

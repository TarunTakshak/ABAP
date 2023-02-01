*&---------------------------------------------------------------------*
*& Report Z1014304_SP_ORDER_DETAILS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_sp_order_details.

INCLUDE z1014304_sp_ord_str.
DATA : g_value TYPE i VALUE 0.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 3(50) c1.
  PARAMETERS :
    "radiobutton for sales and purchase details
    p_sales RADIOBUTTON GROUP rad1 USER-COMMAND uc1,
    p_purc  RADIOBUTTON GROUP rad1,
    p_none  RADIOBUTTON GROUP rad1 DEFAULT 'X'.


  SELECT-OPTIONS :
 "select-option for sales details
                    s_VBELN  FOR g_vbeln MODIF ID cm1,  "sales Order Number
                    s_posnr  FOR g_posnr MODIF ID cm1,  "sales document item
                    s_erdat  FOR g_erdat MODIF ID cm1,  "sales date
                    s_ernam  FOR g_ernam MODIF ID cm1.  "sales Document created by

  SELECT-OPTIONS :
 "select-option for purchase details
                    s_ebeln  FOR  g_ebeln   MODIF ID cm2,  "purchase Document NUmber
                    s_ebelp  FOR  g_ebelp   MODIF ID cm2,  "purchase Item number
                    s_aedat  FOR  g_aedat   MODIF ID cm2,  "purchase creation date
                    s_ernamm FOR  g_ernamm  MODIF ID cm2.  "purchase created by


SELECTION-SCREEN END OF BLOCK b1.

INITIALIZATION.
  t1 = 'Sales Order and Purchase Order'.
  c1 = 'Enter Sales Order and Purchase Order'.

AT SELECTION-SCREEN OUTPUT.
  PERFORM display_output.

*&---------------------------------------------------------------------*
*& Form display_output
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_output .
  LOOP AT SCREEN.
    IF p_sales EQ 'X'  AND screen-group1 = 'CM1'.
      screen-active = 1.
      MODIFY SCREEN.
      CLEAR screen.
      CONTINUE.
    ELSEIF p_purc EQ 'X' AND screen-group1 = 'CM2'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_sales  EQ ' '  AND screen-group1 = 'CM1'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_purc EQ ' ' AND screen-group1 = 'CM2'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.
  ENDLOOP.
ENDFORM.



START-OF-SELECTION.
  IF p_sales = 'X'.
    PERFORM get_sales.
    PERFORM display_sales.
  ELSEIF p_purc = 'X'.
    PERFORM get_purchase.
    PERFORM display_purchase.
  ENDIF.

*&---------------------------------------------------------------------*
*& Form display_sales_purchase
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*

FORM get_sales .
  SELECT  vbak~vbeln
          vbak~erdat
          vbak~ernam
          vbak~vbtyp
          vbak~vkorg
          vbak~audat
          vbak~netwr
          vbap~posnr
          vbap~matnr
          vbap~zwert
          vbap~zmeng
          vbap~zieme
          makt~maktx
     INTO TABLE it_sales
     FROM vbak
    INNER JOIN vbap
       ON vbak~vbeln = vbap~vbeln
    INNER JOIN makt ON  makt~matnr = vbap~matnr
    WHERE spras = sy-langu AND vbak~vbeln IN s_vbeln
      AND vbap~posnr IN s_posnr
      AND vbak~erdat IN s_erdat
  AND vbak~ernam IN s_ernam.
  IF sy-subrc <> 0 AND it_sales IS INITIAL.
    MESSAGE 'NO Data Found' TYPE 'E'.
  ELSE.
    g_value = 1.
  ENDIF.
  SORT it_sales BY vbeln.
ENDFORM.

**&---------------------------------------------------------------------*
**& Form display_sales
**&---------------------------------------------------------------------*
**& text
**&---------------------------------------------------------------------*
**& -->  p1        text
**& <--  p2        text
**&---------------------------------------------------------------------*

FORM display_sales .
  IF g_value = 1.
    WRITE:  / sy-uline+0(155),
               /1 sy-vline,
                2 'Sale Docu',      11 sy-vline,
                12 'Item',          20 sy-vline,
                21 'Date',          35 sy-vline,
                36 'Name',          41 sy-vline,
                42 'Category',      50 sy-vline,
                51 'Doc Date',      65 sy-vline,
                66 'Netval',        71 sy-vline,
                72 'Organiz',       80 sy-vline,
                82 'Material Num',  95 sy-vline,
                96 'Material text',115 sy-vline,
                116'Target Value', 130 sy-vline,
                132'Quantity',     142 sy-vline,
                143'UOM',          155 sy-vline,
                / sy-uline+0(155).


    LOOP AT it_sales INTO wa_sales.

      WRITE :/2  wa_sales-vbeln, "11 sy-vline,
             12  wa_sales-posnr, "20 sy-vline,
             21  wa_sales-erdat, "35 sy-vline,
             36  wa_sales-ernam, "41 sy-vline,
             42  wa_sales-vbtyp, "50 sy-vline,
             51  wa_sales-audat, "65 sy-vline,
             66  wa_sales-netwr, "71 sy-vline,
             72  wa_sales-vkorg, "80 sy-vline,
             82  wa_sales-matnr, "95 sy-vline,
             96  wa_sales-maktx, "115 sy-vline,
             116 wa_sales-zwert,  "130 sy-vline,
             132 wa_sales-zmeng,  "142 sy-vline,
             143 wa_sales-zieme. " 155 sy-vline.


      g_quan = g_quan + wa_sales-zmeng.
      g_amount = g_amount + wa_sales-netwr.

      AT END OF vbeln.
        WRITE :/ 'Total Quantity' COLOR 3, g_quan COLOR 3 .
        WRITE :/ 'Total Amount' COLOR 5, g_amount COLOR 5 .
      ENDAT.

    ENDLOOP.                           "loop at wa_sales...
  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form get_purchase
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_purchase .
  SELECT ekko~ebeln
             ekko~bukrs
             ekko~bstyp
             ekko~statu
             ekko~aedat
             ekko~ernam
             ekpo~ebelp
             ekpo~matnr
             ekpo~werks
             ekpo~lgort
             ekpo~menge
             ekpo~meins
             makt~maktx

       INTO TABLE it_purchase
       FROM ekko
      INNER JOIN ekpo
         ON ekko~ebeln = ekpo~ebeln INNER JOIN makt ON ekpo~matnr = makt~matnr
      WHERE makt~spras = sy-langu
        AND ekko~ebeln IN s_ebeln
        AND ekpo~ebelp IN s_ebelp
        AND ekko~aedat IN s_aedat
      AND ekko~ernam IN s_ernamm.
       IF sy-subrc <> 0 AND it_sales IS INITIAL.
    MESSAGE 'NO Data Found' TYPE 'E'.
  ELSE.
    g_value = 1.
  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form display_purchase
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*

FORM display_purchase .
  if g_value = 1.
  LOOP AT it_purchase INTO wa_purchase.

    WRITE :/1   wa_purchase-ebeln,
            5   wa_purchase-ebelp,
            13  wa_purchase-bukrs,
            25  wa_purchase-bstyp,
            39  wa_purchase-statu,
            42  wa_purchase-aedat,
            45  wa_purchase-ernam,
            65  wa_purchase-ebelp,
            105 wa_purchase-matnr,
            110 wa_purchase-werks,
            118 wa_purchase-lgort,
            124 wa_purchase-menge,
            130 wa_purchase-meins,
            143 wa_purchase-maktx.


    AT NEW ebeln.

      WRITE :/ 'Total Quantity' COLOR 3, g_quan .
      WRITE :/ 'Total Amount' COLOR 5, g_amount .
    ENDAT.

  ENDLOOP.
  ENDIF.
ENDFORM.

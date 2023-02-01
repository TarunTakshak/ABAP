*&---------------------------------------------------------------------*
*& Include          Z1014304_MPP_SALES_SCREEN_100
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'ZPF_100'.
  SET TITLEBAR 'ZPF_SP'.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

CASE  sy-ucomm.
  WHEN 'E1' or 'CANCEL' or 'BACK' .
    "leave PROGRAM.
    LEAVE to  SCREEN 0.
  WHEN 'GD1' .
    if RB1 = 'X'.
      PERFORM get_sales.
      call SCREEN 220.
    ELSEIF RB2 = 'X'.
      PERFORM get_purchase.
      "call screen 300.
      call SCREEN 330.
      ENDIF.
  WHEN OTHERS.
ENDCASE.


ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_sales
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_sales .


   CLEAR : wa_final_sale,
           wa_sales.
  refresh : it_final_sale,
            it_sales.

 SELECT
      vbak~vbeln
      vbak~ernam
      vbak~audat
      vbak~vbtyp
      vbak~netwr
      vbak~vkorg
      vbap~posnr
      vbap~matnr
      vbap~zwert
      vbap~zmeng
      vbap~zieme
      makt~maktx

   INTO TABLE it_sales
   FROM vbak
   INNER JOIN vbap
   on vbak~vbeln = vbap~vbeln
   INNER JOIN makt
   on vbap~matnr = makt~matnr
   where vbak~vbeln in s_vbeln
   and vbak~ernam in s_ernam
   and vbak~audat in s_audat
   and vbap~posnr in s_posnr
   and spras = 'E'.

   if sy-subrc = 0 and it_sales IS NOT INITIAL.
     sort it_sales by vbeln.
   else.
     MESSAGE 'DATA NOT FOUND' TYPE 'E'.
   ENDIF.

   LOOP AT it_sales INTO wa_sales.
      at new vbeln.
              wa_final_sale-vbeln = wa_sales-vbeln.

            ENDAT.

            wa_final_sale-ernam = wa_sales-ernam.
            wa_final_sale-audat = wa_sales-audat.
            wa_final_sale-vbtyp = wa_sales-vbtyp.
            wa_final_sale-netwr = wa_sales-netwr.
            wa_final_sale-vkorg = wa_sales-vkorg.
            wa_final_sale-posnr = wa_sales-posnr.
            wa_final_sale-matnr = wa_sales-matnr.
            wa_final_sale-zwert = wa_sales-zwert.
            wa_final_sale-zmeng = wa_sales-zmeng.
            wa_final_sale-zieme = wa_sales-zieme.
            wa_final_sale-maktx = wa_sales-maktx.
            APPEND wa_final_sale to it_final_sale.
            clear wa_final_sale.

           " g_netwr =  g_netwr +  wa_sales-netwr.

*     at END OF vbeln.
*
*      wa_final_sale-netwr = g_netwr.
*       APPEND wa_final_sale to it_final_sale.
*      ENDAT.

      at END OF vbeln.
            sum.
             wa_final_sale-netwr = wa_sales-netwr.
             wa_final_sale-zmeng = wa_sales-zmeng.
             append wa_final_sale to it_final_sale.
           ENDAT.
     ENDLOOP.
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



SELECT
      ekko~ebeln
      ekko~bukrs
      ekko~bstyp
      ekko~statu
      ekko~aedat
      ekko~ernam
      ekpo~ebelp
      ekpo~matnr
      makt~maktx
      ekpo~werks
      ekpo~lgort
      ekpo~menge
      ekpo~meins

  INTO TABLE it_purchase
  FROM ekko
  INNER JOIN ekpo
  on ekko~ebeln = ekpo~ebeln
  INNER JOIN makt
  on ekpo~matnr = makt~matnr
  WHERE ekko~ebeln in s_ebeln
  and ekpo~ebelp in s_ebelp
  and ekko~aedat in s_aedat
  and ekko~ernam in s_ernam
  and makt~spras = 'E'.


   if sy-subrc = 0 and it_PURCHASE IS NOT INITIAL.
     sort it_purchase by ebeln.
   else.
     MESSAGE 'DATA NOT FOUND' TYPE 'E'.
   ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Module HIDE_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE hide_0100 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
  IF RB1 = 'X'.
    GV_SCREEN = '50'.
   " screen-active = 0.
  ELSEIF RB2 = 'X'.
    GV_SCREEN = '80'.
 "   screen-active = 0.

  ENDIF.

ENDMODULE.

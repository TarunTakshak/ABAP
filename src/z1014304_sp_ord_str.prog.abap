*&---------------------------------------------------------------------*
*& Include          Z1014304_SP_ORD_STR
*&---------------------------------------------------------------------*

TYPES :
  "structure holds sales details
  BEGIN OF ty_sales,
    vbeln TYPE vbak-vbeln,
    erdat TYPE vbak-erdat,
    ernam TYPE vbak-ernam,
    vbtyp TYPE vbak-vbtyp,
    vkorg TYPE vbak-vkorg,
    audat TYPE vbak-audat,
    netwr TYPE vbak-netwr,
    posnr TYPE vbap-posnr,
    matnr TYPE vbap-matnr,
    zwert TYPE vbap-zwert,
    zmeng TYPE vbap-zmeng,
    zieme TYPE vbap-zieme,
    maktx TYPE makt-maktx,
  END OF ty_sales,
  "structure holds purchase details
  BEGIN OF ty_purchase,
    ebeln TYPE ekko-ebeln,
    bukrs TYPE ekko-bukrs,
    bstyp TYPE ekko-bstyp,
    statu TYPE ekko-statu,
    aedat TYPE ekko-aedat,
    ernam TYPE ekko-ernam,
    ebelp TYPE ekpo-ebelp,
    matnr TYPE ekpo-matnr,
    werks TYPE ekpo-werks,
    lgort TYPE ekpo-lgort,
    menge TYPE ekpo-menge,
    meins TYPE ekpo-meins,
    maktx TYPE makt-maktx,
  END OF ty_purchase.


DATA :
  "internal table and workarea holds sales details
  it_sales    TYPE TABLE OF ty_sales,
  wa_sales    TYPE ty_sales,
  "internal table and workarea holds purchase details
  it_purchase TYPE TABLE OF ty_purchase,
  wa_purchase TYPE ty_purchase.


DATA :
  "global variable declartion
  g_vbeln  TYPE vbak-vbeln,
  g_posnr  TYPE vbap-posnr,
  g_erdat  TYPE vbak-erdat,
  g_ernam  TYPE vbak-ernam,
  g_ebeln  TYPE ekko-ebeln,
  g_ebelp  TYPE ekpo-ebelp,
  g_aedat  TYPE ekko-aedat,
  g_ernamm TYPE ekko-ernam,
  g_quan   TYPE vbap-zmeng,
  g_amount TYPE vbak-netwr,
  g_p_quan TYPE ekpo-menge,
  g_p_amt  TYPE ekpo-netwr.

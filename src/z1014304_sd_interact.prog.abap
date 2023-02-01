*&---------------------------------------------------------------------*
*& Include          Z1014304_SD_INTERACT
*&---------------------------------------------------------------------*
TYPES :
  "Structure to hold sales item data
  BEGIN OF ty_vbap,
    vbeln TYPE vbap-vbeln,             "Sales Document
    posnr TYPE vbap-posnr,             "Sales Document Item
    matnr TYPE vbap-matnr,             "Material Number
    matwa TYPE vbap-matwa,             "Material Entered
    pmatn TYPE vbap-pmatn,             "Pricing Reference Material
  END OF ty_vbap,
  "Structure to hold sales header data
  BEGIN OF ty_vbak,
    vbeln TYPE vbak-vbeln,             "Sales Document
    erdat TYPE vbak-erdat,             "Date on which the record was created
    erzet TYPE vbak-erzet,             "Entry time
    ernam TYPE vbak-ernam,             "Name of Person
    angdt TYPE vbak-angdt,             "Quotation
  END OF ty_vbak.

DATA :
  "internal table and workArea for sales header and item data.
  it_sales TYPE TABLE OF ty_vbap,
  wa_sales TYPE ty_vbap,
  it_vbak  TYPE TABLE OF ty_vbak,
  wa_vbak  TYPE ty_vbak,
  "global variable declartion for vbeln
  g_vbeln  TYPE  vbak-vbeln.




TYPES :
  "Structure to hold delivery item data
  BEGIN OF ty_lips,
    vbeln TYPE lips-vbeln,             "Delivery NO
    posnr TYPE lips-posnr,             "Delivery Item
    pstyv TYPE lips-pstyv,             "Delivery item category
    ernam TYPE lips-ernam,             "Name of Person
    erzet TYPE lips-erzet,             "Entry time
  END OF ty_lips,
  "Structure to hold delivery header data
  BEGIN OF ty_likp,
    vbeln TYPE likp-vbeln,             "Delivery No
    bzirk TYPE likp-bzirk,             "Sales District
    vstel TYPE likp-vstel,             "Shipping Point
    vkorg TYPE likp-vkorg,             "Sales Organization
    lfart TYPE likp-lfart,             "Delivery Type
    autlf TYPE likp-autlf,             "Complete Delivery
  END OF ty_likp.

DATA :
  ""internal table and workArea for delivery header and item data.
  it_lips  TYPE TABLE OF ty_lips,
  wa_lips  TYPE ty_lips,
  it_likp  TYPE TABLE OF ty_likp,
  wa_likp  TYPE ty_likp,
  "global variable declartion for vbeln
  g_lvbeln TYPE likp-vbeln.



SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(20) in1.

  PARAMETERS :
    "RadioButton for sales header and item data
    p_sales RADIOBUTTON GROUP rad1 USER-COMMAND uc1,
    "RadioButton for delivery header and item data
    p_deliv RADIOBUTTON GROUP rad1,
    p_none  RADIOBUTTON GROUP rad1 DEFAULT 'X'.

  SELECT-OPTIONS :  p_s_no FOR g_vbeln MODIF ID mo1,
                    p_d_no FOR g_lvbeln MODIF ID mo2.

SELECTION-SCREEN END OF BLOCK b1.

*&---------------------------------------------------------------------*
*& Include          Z1014304_SALES_HEADER_STR
*&---------------------------------------------------------------------*
TYPES :
  "Structure to hold sales details
  BEGIN OF ty_sales,
    kunnr TYPE vbak-kunnr,
    vbeln TYPE vbak-vbeln,
    erdat TYPE vbak-erdat,
    trvog TYPE vbak-trvog,
    zmeng TYPE vbap-zmeng,
    zieme TYPE vbap-zieme,
    month TYPE char10,
  END OF ty_sales.


DATA :
  "internal table and workarea to hold sales details
  it_sales TYPE TABLE OF ty_sales,
  wa_sales TYPE ty_sales,

  "global variable declartion for month
  g_month_number TYPE char2,
  g_month_name TYPE char10,

  "internal table and workarea to hold field catlog details
  it_fcat  TYPE slis_t_fieldcat_alv,
  wa_fcat  LIKE LINE OF it_fcat,

  "internal table and workarea to hold HEADER details
  it_header TYPE slis_t_listheader,
  wa_header LIKE LINE OF it_header,

  "global varibale for layout
  gs_layout TYPE slis_layout_alv,

  "declartion of variable
   g_date TYPE vbak-erdat.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(20) in1.
SELECT-OPTIONS s_date FOR g_date.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE t2.
  PARAMETERS : p_grid RADIOBUTTON GROUP rad1 USER-COMMAND uc1,
               p_list RADIOBUTTON GROUP rad1.
  SELECTION-SCREEN END OF block b2.

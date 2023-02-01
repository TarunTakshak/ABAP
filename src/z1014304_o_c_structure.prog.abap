*&---------------------------------------------------------------------*
*& Include          Z1014304_O_C_STRUCTURE
*&---------------------------------------------------------------------*

TYPES :
  "structure declartions for customer opening details
  BEGIN OF ty_bsid,
    bukrs TYPE bukrs,                     "company code
    kunnr TYPE kunnr,                     "account number
    umsks TYPE umsks,                     "transcation type
    umskz TYPE umskz,                     "indicator
    augdt TYPE augdt,                     "clearing date
    augbl TYPE augbl,                     "document number for clearing date
    zuonr TYPE dzuonr,                    "assignment number
    gjahr TYPE gjahr,                     "fiscal year
    belnr TYPE belnr_d,                   "accounting document number
    buzei TYPE buzei,                     "number of line item within accounting document
    budat TYPE budat,                     "psoting date in the document
  END OF ty_bsid,
  "structure declartions for customer closing details
  BEGIN OF ty_bsad,
    bukrs TYPE bukrs,
    kunnr TYPE kunnr,
    umsks TYPE umsks,
    umskz TYPE umskz,
    augdt TYPE augdt,
    augbl TYPE augbl,
    zuonr TYPE dzuonr,
    gjahr TYPE gjahr,
    belnr TYPE belnr_d,
    buzei TYPE buzei,
    budat TYPE budat,
  END OF ty_bsad.

TYPES :
  "structure declartions for vendor opening details
  BEGIN OF ty_bsik,
    bukrs TYPE bukrs,
    lifnr TYPE lifnr,
    umsks TYPE umsks,
    umskz TYPE umskz,
    augdt TYPE augdt,
    augbl TYPE augbl,
    zuonr TYPE dzuonr,
    gjahr TYPE gjahr,
    belnr TYPE belnr_d,
    buzei TYPE buzei,
    budat TYPE budat,
  END OF ty_bsik,
  "structure declartions for vendor closing details
  BEGIN OF ty_bsak,
    bukrs TYPE bukrs,
    lifnr TYPE lifnr,
    umsks TYPE umsks,
    umskz TYPE umskz,
    augdt TYPE augdt,
    augbl TYPE augbl,
    zuonr TYPE dzuonr,
    gjahr TYPE gjahr,
    belnr TYPE belnr_d,
    buzei TYPE buzei,
    budat TYPE budat,
  END OF ty_bsak.

DATA :
  "internal table and work declartions for customer opening details
  it_bsid TYPE TABLE OF ty_bsid,
  wa_bsid TYPE ty_bsid,
  "internal table and work declartions for customer  closing details
  it_bsad TYPE Z1014304_TT_BSAD,"TABLE OF ty_bsad,
  wa_bsad TYPE ty_bsad,
  "internal table and work declartions for vendor opening details
  it_bsik TYPE TABLE OF ty_bsik,
  wa_bsik TYPE ty_bsik,
  "internal table and work declartions for vendor closing details
  it_bsak TYPE TABLE OF ty_bsak,
  wa_bsak TYPE ty_bsak,
  g_kunnr TYPE kunnr.

"selection screen for block b1
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(25) in1.
  PARAMETERS :
  "Radiobutton for customer details
               p_cust  RADIOBUTTON GROUP rad1  USER-COMMAND uc1.

  "parameter for customer id
              " p_kunnr TYPE kunnr MODIF ID mo1.

  "select Option for date
  SELECT-OPTIONS : s_kunnr for g_kunnr MODIF ID mo1,
                   s_date FOR (bsid~augdt) MODIF ID mo1.
  PARAMETERS :
  "Radiobutton for vendor details
               p_vend  RADIOBUTTON GROUP rad1,
   "parameter for vendor id
               p_lifnr TYPE lifnr MODIF ID mo2.
   "select Option for date
  SELECT-OPTIONS : s_date1 FOR (bsik~augdt) MODIF ID mo2.

  PARAMETERS : p_none  RADIOBUTTON GROUP rad1 DEFAULT 'X'.

SELECTION-SCREEN END OF BLOCK b1.
"selection screen for block b2
SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE t2.
  SELECTION-SCREEN COMMENT 2(20) in2.
  PARAMETERS :
 "parameter for opening and closing details
               p_open  RADIOBUTTON GROUP rad2 USER-COMMAND uc2 DEFAULT 'X',
               p_close RADIOBUTTON GROUP rad2.
SELECTION-SCREEN END OF BLOCK b2.

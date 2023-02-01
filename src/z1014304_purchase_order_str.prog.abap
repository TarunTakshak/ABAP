*&---------------------------------------------------------------------*
*& Include          Z1014304_PURCHASE_ORDER_STR
*&---------------------------------------------------------------------*

TYPES : BEGIN OF st_purchase,
          lifnr TYPE ekko-lifnr,         "vendor No
          ebeln TYPE ekko-ebeln,         "po
          AEDAT TYPE ekpo-aedat,         "date
          ebelp TYPE ekpo-ebelp,         "po-item
          matnr TYPE ekpo-matnr,         "material No
          menge TYPE ekpo-menge,         "quantity
          kzfme TYPE ekpo-kzfme,         "uom
        END OF st_purchase.

DATA :
   "internal table and workarea to hold Purchase details
       it_purchase TYPE TABLE OF st_purchase,
       wa_purchase TYPE st_purchase,

 "internal table and workarea to hold field catlog details
       it_fcat TYPE slis_t_fieldcat_alv,
       wa_fcat TYPE slis_fieldcat_alv,

"internal table and workarea to hold HEADER details
       it_header TYPE slis_t_listheader,
       wa_header TYPE slis_listheader,

 "global varibale for layout
       gs_layout  TYPE slis_layout_alv,

       count TYPE i,
       n TYPE i,

       g_lifnr TYPE ekko-lifnr.

SELECT-OPTIONS : s_lifnr for g_lifnr.

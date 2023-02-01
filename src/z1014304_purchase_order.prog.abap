*&---------------------------------------------------------------------*
*& Report Z1014304_PURCHASE_ORDER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_purchase_order.

"include to hold structure declartion
include z1014304_purchase_order_str.

"include for purchase order main
INCLUDE z1014304_purchase_order_main.

START-OF-SELECTION.

"perform to fetch data for ekko and ekpo
PERFORM get_ekko_ekpo.

"perform to hold field catlog
PERFORM field_catlog.

"perform to display the purchase details
PERFORM display.





















*WRITE : 1'vendor_no',
*        15'PO',
*        25'po_item',
*        40 'material',
*        55'qunatity',
*         75'uom'.
*WRITE : / sy-uline.
*
*LOOP AT it_purchase INTO wa_purchase.
*  WRITE : /1 wa_purchase-lifnr,
*           15 wa_purchase-ebeln,
*           25 wa_purchase-ebelp,
*           40 wa_purchase-matnr,
*           55 wa_purchase-menge,
*           75 wa_purchase-kzfme.
*
*ENDLOOP.




*
* DATA: value TYPE char6.
*
* value = 1.
* WRITE: value.
*
* Do 4 TIMES.
*   Value = value * 11.
*   WRITE:/1 '', value.
*   ENDDO.

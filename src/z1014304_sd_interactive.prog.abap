*&---------------------------------------------------------------------*
*& Report Z1014304_SD_INTERACTIVE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_sd_interactive.

*include to hold data declartion
include z1014304_sd_interact.

INITIALIZATION.
  t1 = 'Sale And Delivery Details'.
  in1 = 'Click Any One Radio Button'.

AT SELECTION-SCREEN OUTPUT.
 "include for modify screen
  include z1014304_display_output.

START-OF-SELECTION.
"include to fetch and display sales and delivery
   include z1014304_sales_delivery.
 end-of-SELECTION.

AT LINE-SELECTION.
  "include to hide the data
  include z1014304_sales_delivery_hide.

  TOP-OF-PAGE.
  WRITE : / 'OUTPUT'.

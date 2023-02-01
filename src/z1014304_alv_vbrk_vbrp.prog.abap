*&---------------------------------------------------------------------*
*& Report Z1014304_ALV_VBRK_VBRP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_ALV_VBRK_VBRP.

"include to hold strcuture data
INCLUDE Z1014304_ALV_VBRK_VBRP_str.

"include to hold main
include Z1014304_ALV_VBRK_VBRP_main.

"assigning values for selection screen
INITIALIZATION.
T1 = 'BILLING DOCUMENT DETAILS'.
in1 = 'ENTER THE SALES DOCUMENT NUMBER'.


START-OF-SELECTION.
"perform to get vbrk and vbrp details
PERFORM get_vbrk_vbrp.
"perform to display vbrk and vbrp details
PERFORM display_vbrk_vbrp.

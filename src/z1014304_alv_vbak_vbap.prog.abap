*&---------------------------------------------------------------------*
*& Report Z1014304_ALV_VBAK_VBAP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_ALV_VBAK_VBAP.

"include declartion to hold structure for vbap and vbak
INCLUDE Z1014304_ALV_VBAK_VBAP_str.

START-OF-SELECTION.
"include declartion for vbak and vbap main
include Z1014304_ALV_VBAK_VBAP_main.

end-of-SELECTION.
"include declartion to display vbak and vbap
INCLUDE Z1014304_ALV_VBAK_VBAP_display.

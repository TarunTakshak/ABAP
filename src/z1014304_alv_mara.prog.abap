*&---------------------------------------------------------------------*
*& Report Z1014304_ALV_MARA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_alv_mara.

"include to hold structure declartions
include z1014304_alv_mara_str.


START-OF-SELECTION.
"include to get data for mara and field catlog
include  z1014304_alv_mara_main.

end-of-SELECTION.
"include to display mara
include  z1014304_alv_mara_display.

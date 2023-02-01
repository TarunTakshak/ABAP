*&---------------------------------------------------------------------*
*& Report Z1014304_ALV_INTERAVTIVE_AKAP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_ALV_INTERAVTIVE_AKAP.

include  Z1014304_ALV_INTER_Akap_str.

include  Z1014304_ALV_INTER_Akap_main.


START-OF-SELECTION.

perform get_vabk.

PERFORM field_catlog.

PERFORM display_vbak.

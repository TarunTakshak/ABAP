*&---------------------------------------------------------------------*
*& Report Z1014304_FM_BSAD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_FM_BSAD.

TYPE-POOLS : slis.

include Z1014304_FM_BSAD_str.

include Z1014304_FM_BSAD_main.

START-OF-SELECTION.

PERFORM get_bsad.
PERFORM field_cat.

end-of-SELECTION.
PERFORM display.

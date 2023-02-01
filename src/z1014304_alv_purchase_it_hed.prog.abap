*&---------------------------------------------------------------------*
*& Report Z1014304_ALV_PURCHASE_IT_HED
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_ALV_PURCHASE_IT_HED.

"include for structure decalrtions
include  Z1014304_ALV_PURCHASE_str.

"include for purchase main
include  Z1014304_ALV_PURCHASE_main.

START-OF-SELECTION.
"perform to fetch data for ekko and ekpo
PERFORM get_ekko_ekpo.
"peform for ekko and ekpo fieldcatlog1
PERFORM fieldcatlog1.
"perfrom to display ekko and ekpo
PERFORM display_ekko_ekpo.

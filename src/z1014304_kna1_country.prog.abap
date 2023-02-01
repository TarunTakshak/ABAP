*&---------------------------------------------------------------------*
*& Report Z1014304_KNA1_COUNTRY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_KNA1_COUNTRY.

"include to hold structure and data declartions
INCLUDE Z1014304_KNA1_COUNTRY_str.

"include to hold main
INCLUDE Z1014304_KNA1_COUNTRY_main.

START-OF-SELECTION.
"perform to display cutoemr details
PERFORM get_kna1.

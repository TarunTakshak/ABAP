*&---------------------------------------------------------------------*
*& Report Z1014304_ALV_AMAZON
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_ALV_AMAZON.

"include to hold structure and data declartions
include Z1014304_ALV_AMAZON_str.

"include to hold amazon main
INCLUDE Z1014304_ALV_AMAZON_main.

START-OF-SELECTION.

"perform to fetch data from database
PERFORM get_amazon.

"perform for catlog
PERFORM field_cat.

"perform to display amazon
PERFORM display_amazon.

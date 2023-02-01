*&---------------------------------------------------------------------*
*& Report Z1014304_ALV_APAK_ALL_ENTRIES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_ALV_APAK_ALL_ENTRIES.

TYPE-POOLS : slis.
TABLES : vbap,vbak.


INCLUDE Z1014304_ALV_ALL_ENTRIES_str.

INCLUDE Z1014304_ALV_ALL_ENTRIES_main.

START-OF-SELECTION.

PERFORM get_vbak.
PERFORM get_vbap.
PERFORM display_akap.

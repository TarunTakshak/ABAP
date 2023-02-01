*&---------------------------------------------------------------------*
*& Report Z1014304_PRINT_PATTERN_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_PRINT_PATTERN_02.
"global variable declartions
DATA g_pattern TYPE i.
g_pattern = 5.
do 5 times.
  do g_pattern times.
    WRITE '*'.
    ENDDO.
    WRITE /.
    g_pattern = g_pattern - 1.
ENDDO.

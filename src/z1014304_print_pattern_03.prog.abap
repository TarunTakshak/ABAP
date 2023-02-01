*&---------------------------------------------------------------------*
*& Report Z1014304_PRINT_PATTERN_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_print_pattern_03.
"global variable declartions
DATA g_pattern TYPE c.
g_pattern = 1.
DO 4 TIMES.
  DO g_pattern TIMES.
    WRITE '*'.
  ENDDO.
  WRITE /.
  g_pattern = g_pattern + 1.
ENDDO.
DO 5 TIMES.
  DO g_pattern TIMES.
    WRITE '*'.
  ENDDO.
  WRITE /.
  g_pattern = g_pattern - 1.
ENDDO.

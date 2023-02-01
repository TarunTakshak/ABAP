*&---------------------------------------------------------------------*
*& Report Z1014304_PRINT_PATTERN_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_print_pattern_01.
"global variable declartions
DATA : g_pattern TYPE c.
g_pattern = 1.
DO 5 TIMES.
*  do g_a times.
*    WRITE : ''.
*   enddo.
*    g_a = g_a - 1.
  DO g_pattern TIMES.
    WRITE ' * '.
  ENDDO.
  WRITE : /.
  g_pattern = g_pattern + 1.
ENDDO.

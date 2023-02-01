*&---------------------------------------------------------------------*
*& Report Z1014304_SUM_OF_MIDDLE_04
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_sum_of_middle_04.

DATA :
"global decalrtion of variable
      g_sum TYPE char6.
g_sum = 1.
WRITE : g_sum.

DO 4 TIMES.
  g_sum = g_sum * 11.
  WRITE : / g_sum.

ENDDO.

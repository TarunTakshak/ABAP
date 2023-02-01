*&---------------------------------------------------------------------*
*& Report Z1014304_ARMSTRONG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_armstrong.
"parameter variable to input
PARAMETERS n TYPE string.
DATA :
  "global declartion of a variables
  g_offset TYPE string,
  g_length TYPE i,
  g_result TYPE i,
  g_temp   TYPE i,
  g_index  TYPE string,
  g_sum    TYPE i.
g_offset = 0.
g_result = 0.
g_length = strlen( n ).
g_temp = g_length.

DO g_length TIMES.
  g_sum = n+g_offset(1).
  g_sum = g_sum ** g_temp.
  g_result = g_result + g_sum.
  g_offset = g_offset + 1.
ENDDO.

IF g_result EQ n.
  WRITE 'armstrong number'.
ELSE.
  WRITE ' not armstrong number'.
ENDIF.

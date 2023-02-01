*&---------------------------------------------------------------------*
*& Report Z1014304_PALINDROME
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_palindrome.
PARAMETERS n TYPE string.
DATA :
"global decalrtion of variable
       g_temp     TYPE string,
       g_length   TYPE string,
       p_length TYPE string,
       g_res      TYPE string.

g_length = strlen( n ).
p_length = g_length - 1.

DO g_length TIMES.
  g_res = n+p_length(1).
  CONCATENATE g_temp g_res INTO g_temp.
  p_length = p_length - 1.
  IF p_length LT 0.
    EXIT.
  ENDIF.
ENDDO.
IF n EQ g_temp.
  WRITE / 'palindrome'.
ELSE.
  WRITE / 'not palindrome'.
ENDIF.

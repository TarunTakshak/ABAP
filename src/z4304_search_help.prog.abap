*&---------------------------------------------------------------------*
*& Report Z4304_SEARCH_HELP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z4304_SEARCH_HELP.

data it_tab TYPE TABLE of Z1014304_V_H_CUS WITH HEADER LINE.

SELECT-OPTIONS help for it_tab-id MATCHCODE OBJECT ZHELPTEST.


*TYPES : BEGIN OF ty_d,
*         matnr type matnr,
*  END OF ty_d.
*  DATA var_a TYPE matnr.
*  SELECT-OPTIONS var_b for var_a.

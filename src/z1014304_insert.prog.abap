*&---------------------------------------------------------------------*
*& Report Z1014304_INSERT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_INSERT.

DATA : it type TABLE of Z1014304_T_CARD,
       wa TYPE Z1014304_T_CARD.


"insert Z1014304_T_CARD FROM TABLE @( value #( ( CARD_NO = 'INSERT'  ACCOUNT_NO = 'ABC'  CARD_NAME = 'card01' ) ) ).

*select * from mara into TABLE @data(it_mara).

  "from mara select * into table @data(it_mara).

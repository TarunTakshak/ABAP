*&---------------------------------------------------------------------*
*& Include          Z1014304_CUS_DOWNLOAD
*&---------------------------------------------------------------------*
TYPES :  BEGIN OF ty_kna1,
         kna1 type kna1-kunnr,
         name1 TYPE kna1-name1,
         land1 TYPE kna1-land1,
         ort01 TYPE kna1-ort01,
        END OF ty_kna1.

   DATA : it_kna1 TYPE TABLE of ty_kna1,
          wa_kna1 TYPE ty_kna1.

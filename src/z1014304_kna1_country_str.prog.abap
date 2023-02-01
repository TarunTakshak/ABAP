*&---------------------------------------------------------------------*
*& Include          Z1014304_KNA1_COUNTRY_STR
*&---------------------------------------------------------------------*

TYPES :
"structure to hold gernal data for customer
       BEGIN OF ty_kna1,
          kunnr TYPE  kunnr,
          land1 TYPE 	land1_gp,
          name1 TYPE  name1_gp,
          name2 TYPE  name2_gp,
          ort01 TYPE  ort01_gp,
          pstlz TYPE  pstlz,
        END OF ty_kna1.

DATA :
"internal table and workarea to hold cutomer data
       it_kna1 TYPE TABLE OF ty_kna1,
       wa_kna1 TYPE ty_kna1,
"global varibale declartion for country
       g_land1 TYPE kna1-land1.

"selection screen for country
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(20) in1.
"select option for country
  SELECT-OPTIONS s_land FOR g_land1 DEFAULT 'AE' TO 'GB'.
SELECTION-SCREEN END OF BLOCK b1.

*&---------------------------------------------------------------------*
*& Include          Z1014304_ALV_AMAZON_STR
*&---------------------------------------------------------------------*

*TYPES : BEGIN OF ty_amazon,
*          customer_id  TYPE z_1014304_de_customer_id,
*          address_id  TYPE  z_1014304_de_address,
*          first_name  TYPE  z_1014304_de_first_name,
*          middle_name TYPE  z_1014304_de_middle_name,
*          last_name   TYPE  z_1014304_de_last_name,
*          email       TYPE z_1014304_de_email,
*        END OF ty_amazon.

DATA : it_amazon TYPE TABLE OF Z1014304_T_CUST,
       wa_amazon TYPE Z1014304_T_CUST,

       it_fcat   TYPE slis_t_fieldcat_alv,
       wa_fcat   TYPE slis_fieldcat_alv,

       it_header TYPE slis_t_listheader,
       wa_header TYPE slis_listheader,

       gs_layout TYPE slis_layout_alv.

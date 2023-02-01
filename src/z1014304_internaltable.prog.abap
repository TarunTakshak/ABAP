*&---------------------------------------------------------------------*
*& Report Z1014304_INTERNALTABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_internaltable.
TYPES : BEGIN OF st_order,
          order_id       TYPE z_1014304_de_order_id,
          order_name     TYPE z_1014304_de_order_name,
          order_quantity TYPE z_1014304_de_order_quantity,
          order_cost     TYPE z_1014304_de_order_cost,
          order_date     TYPE z_1014304_de_order_date,
          order_status   TYPE z_1014304_de_order_status,
        END OF st_order.
DATA : it TYPE TABLE OF st_order,
       wa TYPE st_order,
       g_order_name TYPE z_1014304_de_order_name.
*SELECT-OPTIONS s_a for g_order_name." OBLIGATORY no-EXTENSION no INTERVALS.
SELECT order_id
       order_name
       order_quantity
       order_cost
       order_date
       order_status
  FROM z1014304_t_order
  INTO TABLE it
  WHERE ORDER_date = '20220419'.
  wa-order_id = 'order30'.
  wa-order_name = 'pen'.
  wa-order_quantity = 2.
  wa-order_cost = 55.
  wa-order_date = '20221903'.
  wa-order_status = 'deliverd'.
  APPEND wa to it.
IF sy-subrc = 0.
  LOOP AT it INTO wa.
    WRITE :/ wa-order_id ,
             wa-order_name,
             wa-order_quantity,
             wa-order_cost,
             wa-order_date,
             wa-order_status.
  ENDLOOP.
ENDIF.

*DATA : BEGIN OF it_order OCCURS 0,
*         order_id   TYPE z_1014304_de_order_id,
*         order_name TYPE z_1014304_de_order_name,
*       END OF it_order.
*
*SELECT order_id
*       order_name FROM z1014304_t_order INTO TABLE it_order.
*
*LOOP AT it_order.
*  WRITE : / it_order-order_id,
*            it_order-order_name.
*
*ENDLOOP.

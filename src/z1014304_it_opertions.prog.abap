*&---------------------------------------------------------------------*
*& Report Z1014304_IT_OPERTIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_IT_OPERTIONS.

"//structure declartions
TYPES : BEGIN OF st_order,
          order_id       TYPE z_1014304_de_order_id,
          order_name     TYPE z_1014304_de_order_name,
          order_quantity TYPE z_1014304_de_order_quantity,
          order_cost     TYPE z_1014304_de_order_cost,
          order_date     TYPE z_1014304_de_order_date,
          order_status   TYPE z_1014304_de_order_status,
        END OF st_order.
 "//internal table and workarea declartions
DATA : it TYPE TABLE OF st_order,
       wa TYPE st_order,
       g_order_name TYPE z_1014304_de_order_name.
SELECT-OPTIONS s_a for g_order_name." OBLIGATORY no-EXTENSION no INTERVALS.
"//fetching data from database table to internal table
SELECT order_id
       order_name
       order_quantity
       order_cost
       order_date
       order_status
  FROM z1014304_t_order
  INTO TABLE it
  WHERE ORDER_name in s_a."'20220419'.
  "//APPEND DATA TO INTERNAL TABLE
  wa-order_id = 'order30'.
  wa-order_name = 'pen'.
  wa-order_quantity = 2.
  wa-order_cost = 55.
  wa-order_date = '20221903'.
  wa-order_status = 'deliverd'.
  APPEND wa to it.
  clear wa.
*   wa-order_cost = 22.
*  APPEND wa to it.

  "// INSERT DATA INTO INTERNAL TABLE
*  wa-order_id = 'order31'.
*  wa-order_name = 'pen'.
*  wa-order_quantity = 2.
*  wa-order_cost = 55.
*  wa-order_date = '20221903'.
*  wa-order_status = 'deliverd'.
*  INSERT wa INTO it INDEX 28.

   "// INSERT DATA INTO database TABLE
*  wa-order_id = 'order30'.
*  wa-order_name = 'pen'.
*  wa-order_quantity = 2.
*  wa-order_cost = 55.
*  wa-order_date = '20221903'.
*  wa-order_status = 'deliverd'.
*  INSERT z1014304_t_order from wa.

  "// MODIFY data for internal table
*
*  wa-order_quantity = 5.
*  MODIFY  it from wa INDEX 30.

*  "// update  data for internal table
*  wa-order_id = 'order30'.
*  wa-order_name = 'pen'.
*  wa-order_quantity = 5.
*  wa-order_cost = 55.
*  wa-order_date = '20221903'.
*  wa-order_status = 'shipping'.
*  update z1014304_t_order set : order_quantity = 9 where order_id = 'order1' .

*   "// delete  data for internal table
*  DELETE it INDEX 30.

"REFRESH it .
IF sy-subrc = 0.
  "//loop
  LOOP AT it INTO wa.
    WRITE :/ wa-order_id ,
             wa-order_name,
             wa-order_quantity,
             wa-order_cost,
             wa-order_date,
             wa-order_status.
  ENDLOOP.
ENDIF.

"//readloop

*READ TABLE it INTO wa with key order_id = 'order1'. "where order_id = 'order1'.
* WRITE :/ wa-order_id ,
*             wa-order_name,
*             wa-order_quantity,
*             wa-order_cost,
*             wa-order_date,
*             wa-order_status.


"//WHILE AND DO LOOPS
  ""do
*   PARAMETERS var TYPE string.
*   DO 100 TIMES.
*     WRITE / var.
*     var = var + 1.
*
*   ENDDO.

""WHILE
*PARAMETERS a TYPE string.
*WHILE a < 8.
*  WRITE a.
*  a = a + 1.
*
*ENDWHILE.

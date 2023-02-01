*&---------------------------------------------------------------------*
*& Report Z1014304_HOTEL_SALES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_hotel_sales.

DATA :
  "interenal table and workArea declartions for sales
  it_sales TYPE TABLE OF z1014304_t_tra_h,
  wa_sales LIKE LINE OF it_sales,
  "interenal table and workArea declartions for stock
  it_stock TYPE TABLE OF z1014304_t_stock,
  wa_stock LIKE LINE OF it_stock,
  "global variable declartions for sales and stock
  g_count  TYPE i,
  g_final  TYPE i,
  g_count1 TYPE i,
  g_final1 TYPE i.

"selection-screen to display block
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(75) in1.
  PARAMETERS :
    "RadioButton for Sales and stock.
    p_sales RADIOBUTTON GROUP rad1 USER-COMMAND uc1,
    p_stock RADIOBUTTON GROUP rad1,
    "chechboxes to hold branch details for sales
    p_bran1 AS CHECKBOX MODIF ID cm1,
    p_bran2 AS CHECKBOX MODIF ID cm1,
    p_bran3 AS CHECKBOX MODIF ID cm1,
    p_bran4 AS CHECKBOX MODIF ID cm1,
    "chechboxes to hold branch details for sales
    P_s_bn1 AS CHECKBOX MODIF ID cm2,
    P_s_bn2 AS CHECKBOX MODIF ID cm2,
    P_s_bn3 AS CHECKBOX MODIF ID cm2,
    P_s_bn4 AS CHECKBOX MODIF ID cm2,
    p_none  RADIOBUTTON GROUP rad1 DEFAULT 'X'.
SELECTION-SCREEN END OF BLOCK b1.

"initializing values for block and comment

INITIALIZATION.
  t1 = 'Sales and Stock Details For Hotel'.
  in1 = 'Select any RadioButton'.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF p_sales EQ 'X' AND screen-group1 = 'CM1'.
      screen-active = 1.
      MODIFY SCREEN.
      " clear screen.
      CONTINUE.
    ELSEIF p_stock EQ 'X' AND screen-group1 = 'CM2'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_sales EQ ' ' AND screen-group1 = 'CM1'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_stock EQ ' ' AND screen-group1 = 'CM2'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.
  ENDLOOP.



START-OF-SELECTION.
  "select query to fetch sales data from database table
  SELECT * FROM z1014304_t_tra_h INTO TABLE it_sales.
  IF p_sales = 'X'.
    IF sy-subrc = 0 AND it_sales IS NOT INITIAL.

      WRITE :
                2 'TRANSCATION ID' INTENSIFIED COLOR 3,20 'HOTEL ID' COLOR 3,
               30 'Cust ID' COLOR 3,40 'ORDER ID' COLOR 3,
               50 'MENU ID' COLOR 3,60 'TRANSCATION TYPE' COLOR 3,
               80 'TRANSCATION DATE' COLOR 3, 100'TRANSCATION TIME' COLOR  3,120'TOTAL AMOUNT' COLOR 3,
              / sy-uline+0(145).

      IF p_bran1 = 'X'.
        LOOP AT it_sales INTO wa_sales WHERE hotel_id = 'HOTEL01' .
          WRITE :/2 wa_sales-transcation_id,
                  20 wa_sales-hotel_id,
                  30 wa_sales-customer_id,
                  40 wa_sales-order_id,
                  50 wa_sales-menu_id,
                  60 wa_sales-transcation_type,
                  80 wa_sales-transcation_date,
                  100 wa_sales-transcation_time,
                  120 wa_sales-total_amount.
          g_count = g_count + wa_sales-total_amount.
          g_final = g_final + wa_sales-total_amount.
        ENDLOOP.                         "loop at it_sales...
        WRITE : /'Total sales Amount' COLOR 5 ,g_count COLOR 5.
        CLEAR g_count.
        ULINE.
      ENDIF.



      IF p_bran2 = 'X'.
        LOOP AT it_sales INTO wa_sales WHERE hotel_id = 'HOTEL02'.
          WRITE :/2 wa_sales-transcation_id,
                  20 wa_sales-hotel_id,
                  30 wa_sales-customer_id,
                  40 wa_sales-order_id,
                  50 wa_sales-menu_id,
                  60 wa_sales-transcation_type,
                  80 wa_sales-transcation_date,
                  100 wa_sales-transcation_time,
                  120 wa_sales-total_amount.
          g_count = g_count + wa_sales-total_amount.
          g_final = g_final + wa_sales-total_amount.
        ENDLOOP.                       "loop at it_sales...
        WRITE : /'Total sales Amount' COLOR 5 ,g_count COLOR 5.
        CLEAR g_count.
        ULINE.
      ENDIF.


      IF p_bran3 = 'X'.
        LOOP AT it_sales INTO wa_sales WHERE hotel_id = 'HOTEL03'.
          WRITE :/2 wa_sales-transcation_id,
                  20 wa_sales-hotel_id,
                  30 wa_sales-customer_id,
                  40 wa_sales-order_id,
                  50 wa_sales-menu_id,
                  60 wa_sales-transcation_type,
                  80 wa_sales-transcation_date,
                  100 wa_sales-transcation_time,
                  120 wa_sales-total_amount.
          g_count = g_count + wa_sales-total_amount.
          g_final = g_final + wa_sales-total_amount.
        ENDLOOP.                        "loop at it_sales...
        WRITE : /'Total sales Amount' COLOR 5 ,g_count COLOR 5.
        ULINE.
        CLEAR g_count.

      ENDIF.


      IF p_bran4 = 'X'.
        LOOP AT it_sales INTO wa_sales WHERE hotel_id = 'HOTEL04'..
          WRITE :/2 wa_sales-transcation_id,
                  20 wa_sales-hotel_id,
                  30 wa_sales-customer_id,
                  40 wa_sales-order_id,
                  50 wa_sales-menu_id,
                  60 wa_sales-transcation_type,
                  80 wa_sales-transcation_date,
                  100 wa_sales-transcation_time,
                  120 wa_sales-total_amount.
          g_count = g_count + wa_sales-total_amount.
          g_final = g_final + wa_sales-total_amount.
        ENDLOOP.                        "loop at it_sales...
        WRITE : /'Total sales Amount' COLOR 5 ,g_count COLOR 5.
        ULINE.
        CLEAR g_count.
      ENDIF.
      WRITE : /'Final sales Amount' COLOR 5,g_final COLOR 5.
      CLEAR g_final.
    ENDIF.



  ELSEIF p_stock = 'X'.
    "select query to fetch stock data from database table
    SELECT * FROM z1014304_t_stock INTO TABLE it_stock.
    IF sy-subrc = 0 AND it_stock IS NOT INITIAL.
      WRITE : /2 'STOCK ID' INTENSIFIED COLOR 3, 13 'HOTEL ID' COLOR 3,
               "23 'product ID',
               23 'product Name' COLOR 3,
               38 'STOCK AVALIBILITY' COLOR 3,58 'QUANTITY OF STOCK' COLOR 3,
               90 'PRICE' COLOR 3,107 'DESCRIPTION' COLOR 3,
                / sy-uline+0(140).
      IF p_s_bn1 = 'X'.
        LOOP AT it_stock INTO wa_stock WHERE hotel_id = 'HOTEL01'.
          WRITE :/2   wa_stock-stock_id,
                  13  wa_stock-hotel_id,
                 " 23  wa_stock-product_id,
                  23  wa_stock-product_name,
                  38  wa_stock-stock_avalibility,
                  58  wa_stock-quantity_of_stock,
                  83 wa_stock-price,
                  107 wa_stock-description.
          g_count1 = g_count1 + wa_stock-quantity_of_stock.
          g_final1 = g_final1 + wa_stock-quantity_of_stock.
        ENDLOOP.                           "loop at it_stock...
        WRITE : /'Total quantity' COLOR 5 ,g_count1 COLOR 5.
        CLEAR g_count1.
        ULINE.
      ENDIF.
      IF p_s_bn2 = 'X'.
        LOOP AT it_stock INTO wa_stock WHERE hotel_id = 'HOTEL02'.
          WRITE :/2   wa_stock-stock_id,
                 13  wa_stock-hotel_id,
                " 23  wa_stock-product_id,
                 23  wa_stock-product_name,
                 38  wa_stock-stock_avalibility,
                 58  wa_stock-quantity_of_stock,
                 83 wa_stock-price,
                 107 wa_stock-description.
          g_count1 = g_count1 + wa_stock-quantity_of_stock.
          g_final1 = g_final1 + wa_stock-quantity_of_stock.
        ENDLOOP.                           "loop at it_stock...
        WRITE : /'Total quantity' COLOR 5 ,g_count1 COLOR 5.
        CLEAR g_count1.
        ULINE.
      ENDIF.

      IF p_s_bn3 = 'X'.
        LOOP AT it_stock INTO wa_stock WHERE hotel_id = 'HOTEL03'.
          WRITE :/2   wa_stock-stock_id,
                   13  wa_stock-hotel_id,
                  " 23  wa_stock-product_id,
                   23  wa_stock-product_name,
                   38  wa_stock-stock_avalibility,
                   58  wa_stock-quantity_of_stock,
                   83 wa_stock-price,
                   107 wa_stock-description.
          g_count1 = g_count1 + wa_stock-quantity_of_stock.
          g_final1 = g_final1 + wa_stock-quantity_of_stock.
        ENDLOOP.                           "loop at it_stock...
        WRITE : /'Total quantity' COLOR 5 ,g_count1 COLOR 5.
        CLEAR g_count1.
        ULINE.
      ENDIF.

      IF p_s_bn4 = 'X'.
        LOOP AT it_stock INTO wa_stock WHERE hotel_id = 'HOTEL04'.
          WRITE :/2   wa_stock-stock_id,
                    13  wa_stock-hotel_id,
                   " 23  wa_stock-product_id,
                    23  wa_stock-product_name,
                    38  wa_stock-stock_avalibility,
                    58  wa_stock-quantity_of_stock,
                    83 wa_stock-price,
                    107 wa_stock-description.
          g_count1 = g_count1 + wa_stock-quantity_of_stock.
          g_final1 = g_final1 + wa_stock-quantity_of_stock.
        ENDLOOP.                           "loop at it_stock...
        WRITE : /'Total quantity' COLOR 5 ,g_count1 COLOR 5.
        CLEAR g_count1.
        ULINE.
      ENDIF.
      WRITE : /'Final Stock Quantity' COLOR 5,g_final1 COLOR 5.
      CLEAR g_final.
    ENDIF.
  ENDIF.

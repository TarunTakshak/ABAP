*&---------------------------------------------------------------------*
*& Report Z1014304_TABBED_AMAZON
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_tabbed_amazon.

DATA :
  it_cust  TYPE TABLE OF z1014304_t_cust,
  wa_cust  TYPE  z1014304_t_cust,

  it_add   TYPE TABLE OF z1014304_t_cu_ad,
  wa_add   TYPE z1014304_t_cu_ad,

  it_order TYPE TABLE OF z1014304_t_order,
  wa_order TYPE z1014304_t_order.

SELECTION-SCREEN BEGIN OF TABBED BLOCK b1 FOR 10 LINES.
  SELECTION-SCREEN TAB (12) tab1 USER-COMMAND uc1.
  SELECTION-SCREEN TAB (22) tab2 USER-COMMAND uc2.
  SELECTION-SCREEN TAB (30) tab3 USER-COMMAND uc3.
SELECTION-SCREEN END OF BLOCK b1.


SELECTION-SCREEN BEGIN OF SCREEN 100 AS SUBSCREEN.
  SELECTION-SCREEN COMMENT 2(18) p1.
  PARAMETERS : p_cu_id TYPE z_1014304_de_customer_id, "OBLIGATORY,
               P_Fm    TYPE	z_1014304_de_first_name, " OBLIGATORY,
               p_mn    TYPE  z_1014304_de_middle_name, " OBLIGATORY,
               P_Lm    TYPE  z_1014304_de_last_name, " OBLIGATORY,
               p_email TYPE	z_1014304_de_email, " OBLIGATORY,
               P_doB   TYPE	z_1014304_de_dob.
SELECTION-SCREEN END OF SCREEN 100.

SELECTION-SCREEN BEGIN OF SCREEN 200 AS SUBSCREEN.
  SELECTION-SCREEN COMMENT 2(18) p2.
  PARAMETERS : p_add_id TYPE  z_1014304_de_address , "OBLIGATORY,
               p_city   TYPE  z_1014304_de_city, "OBLIGATORY,
               p_state  TYPE  z_1014304_de_state , "OBLIGATORY,
               p_street TYPE  z_1014304_de_street , "OBLIGATORY,
               p_picode TYPE  z_1014304_de_pincode, " OBLIGATORY,
               p_do_no  TYPE  z_1014304_de_door_no, " OBLIGATORY,
               p_count  TYPE  z_1014304_de_country. "OBLIGATORY.
SELECTION-SCREEN END OF SCREEN 200.

SELECTION-SCREEN BEGIN OF SCREEN 300 AS SUBSCREEN.
  SELECTION-SCREEN COMMENT 2(18) p3.
  PARAMETERS : p_or_id  TYPE z_1014304_de_order_id, " OBLIGA TORY,
               p_or_na TYPE  z_1014304_de_order_name, " OBLIGATORY,
               p_or_qu TYPE  z_1014304_de_order_quantity, " OBLIGATORY,
               p_or_co TYPE  z_1014304_de_order_cost, " OBLIGATORY,
               p_or_da TYPE  z_1014304_de_order_date, " OBLIGATORY,
               p_or_st TYPE  z_1014304_de_order_status. " OBLIGATORY.
SELECTION-SCREEN END OF SCREEN 300.
SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN PUSHBUTTON : 30(8) p_append USER-COMMAND tap1,
    50(8) p_delete USER-COMMAND tap2.
SELECTION-SCREEN END OF LINE.

INITIALIZATION.
  b1-activetab = 'UC1'.
  b1-dynnr = '100'.
  b1-prog = sy-repid.


  tab1 = 'General Data'.
  tab2 = 'Communication Details'.
  tab3 = 'Purchase Details'.


  p1 = 'Customer Details -'.
  p2 = 'Address Details -'.
  p3 = 'Item Details -'.

  p_append = 'Append'.
  p_delete = 'Delete'.

AT SELECTION-SCREEN OUTPUT.

  wa_cust-customer_id = p_cu_id.
  wa_cust-first_name =  P_Fm.
  wa_cust-middle_name = p_mn.
  wa_cust-last_name = p_lm.
  wa_cust-email = p_email.
  wa_cust-date_of_birth = p_dob.

  wa_add-address_id = p_add_id.
  wa_add-city = p_city.
  wa_add-state = p_state.
  wa_add-street = p_street.
  wa_add-picode = p_picode.
  wa_add-door_no = p_do_no.
  wa_add-country = p_count.


  wa_order-order_id = p_or_id.
  wa_order-order_name =  p_or_na.
  wa_order-order_quantity =  P_OR_Qu.
  wa_order-order_cost =  p_or_co.
  wa_order-order_date =  p_or_da.
  wa_order-order_status =  p_or_st.




AT SELECTION-SCREEN.
  CASE sy-ucomm.
      WHEN 'UC1'.
      b1-activetab = 'UC1'.
      b1-dynnr = '100'.
      b1-prog = sy-repid.

      WHEN 'UC2'.
      b1-activetab = 'UC2'.
      b1-dynnr = '200'.
      b1-prog = sy-repid.

      WHEN 'UC3'.
      b1-activetab = 'UC3'.
      b1-dynnr = '300'.
      b1-prog = sy-repid.

  ENDCASE.

  CASE sy-ucomm.
      WHEN 'TAP1'.
      INSERT z1014304_t_cust FROM wa_cust.
      INSERT z1014304_t_cu_ad  FROM wa_add.
      INSERT z1014304_t_order FROM wa_order.
      WHEN 'TAP2'.
      DELETE FROM z1014304_t_cust WHERE Customer_id = p_cu_id.
      DELETE FROM z1014304_t_cu_ad WHERE Address_id = p_ADD_ID.
      DELETE FROM z1014304_t_order WHERE Order_id = p_OR_ID.


  ENDCASE.

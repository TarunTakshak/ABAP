*----------------------------------------------------------------------*
***INCLUDE Z1014304_MPP_AMAZON_USER_COI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  CASE sy-ucomm.
    WHEN 'E1' OR 'BACK' OR 'CANCEL'.
      LEAVE PROGRAM.
    WHEN 'IN1'.
      PERFORM insert.
    WHEN 'DE1'.
      PERFORM delete.
    WHEN 'UP1'.
      PERFORM update.
    WHEN 'D1'.
      PERFORM display_data.
    when 'F_RAD'.
     IF rb2 = 'X'.
    CALL SCREEN 99.

  ENDIF.


  ENDCASE.


ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'ZPF_AMA'.
*  IF rb2 = 'X'.
*    CALL SCREEN 99.
*
*  ENDIF.
ENDMODULE.

*&---------------------------------------------------------------------*
*& Form insert
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM insert .
  INSERT z1014304_t_cust  FROM wa_cust.
  INSERT z1014304_t_cu_ad FROM wa_com.
  INSERT Z1014304_T_order FROM wa_purc.
  IF sy-subrc = 0.
    MESSAGE 'Inserion success' TYPE 'I'.
  ELSE.
    MESSAGE 'Insertion failed' TYPE 'E'.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form delete
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM delete .
  DELETE FROM z1014304_t_cust  WHERE customer_id = wa_cust-customer_id.
  DELETE FROM z1014304_t_cu_ad WHERE address_id = wa_com-address_id.
  DELETE FROM Z1014304_T_order WHERE order_id = wa_purc-order_id.
  IF sy-subrc = 0.
    MESSAGE 'Deletion success' TYPE 'I'.
  ELSE.
    MESSAGE 'Deletion failed' TYPE 'E'.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form update
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM update .

 UPDATE z1014304_t_cust  FROM wa_cust.
 UPDATE z1014304_t_cu_ad FROM wa_com.
 UPDATE Z1014304_T_order FROM wa_purc.
  IF sy-subrc = 0.
    MESSAGE 'UPDATE success' TYPE 'I'.
  ELSE.
    MESSAGE 'UPDATE failed' TYPE 'E'.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Module STATUS_0099 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0099 OUTPUT.
  SET PF-STATUS 'ZPF_99'.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0099  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0099 INPUT.

  CASE sy-ucomm.
    WHEN 'GD1'.
      PERFORM get_order.
      CALL SCREEN 200.
    WHEN 'E15' OR 'BACK' OR 'CANCEL' .
      LEAVE TO SCREEN 100.
  ENDCASE.

ENDMODULE.

*&---------------------------------------------------------------------*
*& Module STATUS_0200 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
  SET PF-STATUS 'ZPF_AMA'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.

  CASE  sy-ucomm.
    WHEN 'E5' OR 'BACK' OR 'CANCEL'.
      LEAVE TO SCREEN 99.
    WHEN 'B1'.
      LEAVE TO SCREEN 100.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_order
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_order .

  SELECT * FROM z1014304_t_order
    INTO TABLE it_final
    WHERE order_id IN s_ord
    AND customer_id IN s_cust.

  IF sy-subrc = 0 AND it_final IS NOT INITIAL.

    SORT it_final BY order_id.
*
    LOOP AT it_final INTO wa_final.
      APPEND wa_final TO it_purc.
      g_quant = g_quant + wa_purc-order_quantity.
      g_price = g_price + wa_purc-order_cost.

      AT END OF product_id.
        CLEAR wa_purc.
        wa_purc-order_cost = g_price.
        wa_purc-order_quantity = g_quant.
        APPEND wa_purc TO it_purc.
        CLEAR wa_purc.
      ENDAT.

    ENDLOOP.



  ELSE.

    MESSAGE'DATA NOT FOUND' TYPE 'E'.

  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_data .


  SELECT SINGLE * FROM z1014304_t_cust INTO wa_cust  WHERE customer_id = wa_cust-customer_id.


  SELECT SINGLE * FROM z1014304_t_cu_ad INTO  wa_com WHERE address_id = wa_cust-address_id.



  SELECT SINGLE * FROM z1014304_t_order INTO  wa_purc WHERE customer_id = wa_cust-customer_id.





ENDFORM.

*&---------------------------------------------------------------------*
*& Report Z1014304_CUSTOMER_SALES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_customer_sales.


TYPES :
  "structure to Customer sales details
  BEGIN OF st_cust,
    name1 TYPE kna1-name1,
    vtweg TYPE knvp-vtweg,
    spart TYPE knvp-spart,
    vkorg TYPE knvp-vkorg,
  END OF st_cust.

DATA :
  "internal table and workarea to hold Customer Sales
       it_cust TYPE TABLE OF st_cust,
       wa_cust TYPE st_cust.

SELECT kna1~name1
       knvp~vtweg
       knvp~spart
       knvp~vkorg
 INTO TABLE it_cust
 FROM kna1
INNER JOIN knvp
   ON kna1~kunnr = knvp~kunnr.

IF sy-subrc = 0 AND it_cust IS NOT INITIAL.


    WRITE :/1 'Name1',
            38'vtweg',
            45'spart',
            60'vkorg'.

    WRITE :/ sy-uline+0(70).

  LOOP AT it_cust INTO wa_cust.


    WRITE : /1 wa_cust-name1,
             38 wa_cust-vtweg,
             45 wa_cust-spart,
             60 wa_cust-vkorg.

  ENDLOOP.
ENDIF.

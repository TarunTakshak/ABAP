*&---------------------------------------------------------------------*
*& Report Z1014304_CUST_DOWNLOAD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_CUST_DOWNLOAD.
include Z1014304_CUS_DOWNLOAD.


 SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
   SELECTION-SCREEN COMMENT 2(20) in1.
   PARAMETERS : P_land1 TYPE kna1-land1.
   SELECTION-SCREEN END OF BLOCK b1.

   INITIALIZATION.
   t1 = 'To Display Customer Details and Download '.
   in1 = 'Enter the value'.

   START-OF-SELECTION.

   PERFORM get_data.
   PERFORM display_data.
*&---------------------------------------------------------------------*
*& Form get_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_data .
 select  kna1~kunnr
         kna1~name1
         kna1~land1
         kna1~ort01
   from kna1 INTO TABLE it_kna1 WHERE land1 = p_land1.

   if sy-subrc <> 0 and it_kna1 is  INITIAL.

     MESSAGE 'Data Not Found' TYPE 'E'.

     ELSE.
       ENDIF.
    ENDform.



*&---------------------------------------------------------------------*
*& Form display_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_data .
 LOOP AT it_kna1 INTO wa_kna1.

     WRITE : / wa_kna1-kna1,
               wa_kna1-name1,
               wa_kna1-land1,
               wa_kna1-ort01.
 ENDLOOP.
ENDFORM.

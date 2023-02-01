*&---------------------------------------------------------------------*
*& Report Z1014304_CUSTOMER_DETAILS_JOIN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_customer_details_join.
INCLUDE z1014304_customer__include.
"selection Screen for t1
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(25) in1.
  SELECT-OPTIONS :
 "select option for p_kunnr
                  p_kunnr FOR (kna1-kunnr).
SELECTION-SCREEN END OF BLOCK b1.

"Initialazing values for t1 and in1

INITIALIZATION.
  t1 = 'To Display Customer Details'.
  in1 = 'Enter Customer Number'.

**START-OF-SELECTION.
**  PERFORM get_data.
**  PERFORM display_data.
*&---------------------------------------------------------------------*
*& Form get_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
"FORM get_data .
"select query to fetch data from database table
*SELECT kna1~kunnr
*         kna1~name1
*         kna1~land1
*         kna1~ort01
*         vbak~vbeln
*         vbak~erdat
*         vbak~erzet
*         vbak~ernam
*         lips~vgbel
*         lips~pstyv
*         lips~posnr
*         vbrp~uepos
*         vbrp~fkimg
*         INTO TABLE it_cust
*         FROM kna1 FOR ALL ENTRIES IN it_cust
**         INNER JOIN vbak ON kna1~kunnr = vbak~kunnr
**         INNER JOIN lips ON vbak~vbeln = lips~vgbel
**         INNER JOIN vbrp ON lips~vbeln = vbrp~vgbel
*         WHERE kna1~kunnr IN p_kunnr.
*  SORT it_cust BY kunnr.
*  SELECT kunnr
*         name1
*          land1
*  ort01 FROM kna1 INTO TABLE it_kna1 WHERE kunnr = p_kunnr.
*  IF it_kna1 IS NOT INITIAL.
*    SELECT vbeln
*           erdat
*           erzet
*          ernam
*           kunnr
*    FROM vbak INTO TABLE it_vbak FOR ALL ENTRIES IN it_kna1 WHERE kunnr = it_kna1-kunnr.
*    IF it_vbak IS NOT INITIAL.
*      SELECT  vbeln
*              vgbel
*              pstyv
*              posnr
*      FROM lips INTO TABLE it_lips FOR ALL ENTRIES IN it_vbak WHERE vgbel = it_vbak-vbeln.
*      IF it_lips IS NOT INITIAL.
*        SELECT uepos
*               fkimg
*               vbeln
*               vgbel
*        FROM vbrp INTO TABLE it_vbrp FOR ALL ENTRIES IN it_lips WHERE vgbel = it_lips-vbeln.
*ENDFORM.

*&---------------------------------------------------------------------*
*& Form display_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
*FORM display_data .
*  IF it_cust IS NOT INITIAL.
*    WRITE : / sy-uline+0(150),
*            /1 sy-vline,
*              2 'Cust Num',
*              12 'Name 1',
*              22 'Country',
*              32 'City',
*              42 'Sales Doc',
*              53 'Date',
*              63 'Time',
*              73 'Person',
*              83 'Item',
*              93 'Category',
*              103 'Number',
*              113 'Bill',
*              123 'Qunatity',
*            / sy-uline+0(150).
*      LOOP AT it_cust INTO wa_cust .
*   " READ TABLE it_cust INTO wa_cust.
*    WRITE :  /2  wa_cust-kunnr,
*             12  wa_cust-name1,
*             22  wa_cust-land1,
*             32  wa_cust-ort01,
*             42  wa_cust-vbeln,
*             53  wa_cust-erdat,
*             63  wa_cust-erzet,
*             73  wa_cust-ernam,
*             83  wa_cust-vgbe1,
*             93  wa_cust-pstyv,
*             103 wa_cust-posnr,
*             113 wa_cust-uepos,
*             123 wa_cust-fkimg.
*  ENDLOOP.                           "loop at it_cust...
*ELSE.
*  MESSAGE 'Data Not Found' TYPE 'E'.
*ENDIF.
*ENDFORM.

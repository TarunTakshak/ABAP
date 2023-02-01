*&---------------------------------------------------------------------*
*& Report Z1014304_CUSTOMER_DETAILS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_CUSTOMER_DETAILS.


TYPES :
    "structure to hold customer details
        BEGIN OF st_cust,
        kunnr TYPE kna1-kunnr,
        land1 TYPE kna1-land1,
        vbeln TYPE vbak-vbeln,
        erdat TYPE vbak-erdat,
        matnr TYPE vbap-matnr,
        matkl TYPE vbap-matkl,
        END OF st_cust.

DATA :
    "internal table and workarea to hold customer details
       wa_cust TYPE st_cust,
       it_cust TYPE TABLE of st_cust.

 SElect  kna1~kunnr
         kna1~land1
         vbak~vbeln
         vbak~erdat
         vbap~matnr
         vbap~matkl
 INTO TABLE it_cust
 from kna1
INNER JOIN vbak
   on kna1~kunnr = VBAK~kunnr
INNER JOIN vbap
   on vbak~vbeln = vbap~vbeln.

   IF sy-subrc = 0 and it_cust is NOT INITIAL.

       WRITE : /1 'kunnr',
                12 'land1',
                20 'vbeln',
                38 'erdat',
                55 'matnr',
                65 'matkl'.


       WRITE : / sy-uline+0(70).
       LOOP AT  it_cust INTO wa_cust.
       WRITE : /1 wa_cust-kunnr,
                12 wa_cust-land1,
                20 wa_cust-vbeln,
                38 wa_cust-erdat,
                55 wa_cust-matnr,
                65 wa_cust-matkl .
       WRITE sy-dbcnt.
      "  WRITE sy-tfill.
     ENDLOOP.                          "loop at it_cust...

   ENDIF.

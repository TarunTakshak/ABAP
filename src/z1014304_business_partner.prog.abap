*&---------------------------------------------------------------------*
*& Report Z1014304_BUSINESS_PARTNER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_business_partner.

PARAMETERS : g_bus TYPE string.

TYPES :
 "Structure to hold customer details
      BEGIN OF st_customer,
          land1 TYPE kna1-land1,
          ort01 TYPE kna1-ort01,
          vbeln TYPE vbak-vbeln,
          erdat TYPE vbak-erdat,
      END OF st_customer.

DATA :
  "internal table and workarea to hold customer details
       wa_cust TYPE st_customer,
       it_cust TYPE TABLE OF st_customer.


TYPES :
   "Structure to hold vendor details
      BEGIN OF st_vendor,
          lifnr TYPE lfa1-lifnr,
          land1 TYPE lfa1-land1,
          bukrs TYPE ekko-bukrs,
          waers TYPE ekko-waers,
      END OF st_vendor.

DATA :
  "internal table and workarea to hold vendor details
      wa_vend TYPE st_vendor,
      it_vend TYPE TABLE OF st_vendor.

SELECT  kna1~land1
        kna1~ort01
        vbak~vbeln
        vbak~erdat
 INTO  TABLE it_cust
 FROM kna1
INNER JOIN vbak
   ON kna1~kunnr = vbak~kunnr
WHERE kna1~kunnr = g_bus.

SELECT  lfa1~lifnr
        lfa1~land1
        ekko~bukrs
        ekko~waers
 INTO TABLE it_vend
 FROM lfa1
INNER JOIN ekko
  ON  lfa1~lifnr = ekko~lifnr
WHERE lfa1~lifnr = g_bus.

IF it_cust IS NOT INITIAL.
    WRITE: /1'land1',
            10'ort01',
            30'vbeln',
            55'erdat'.
    WRITE: / sy-uline+0(55).

  LOOP AT it_cust INTO wa_cust.
    WRITE: /1 wa_cust-land1,
            10 wa_cust-ort01,
            30 wa_cust-vbeln,
            55 wa_cust-erdat.
  ENDLOOP.                             "loop at it_cust...

ELSEIF it_vend IS NOT INITIAL.
    WRITE: /1'lifnr',
            10'land1',
            30'bukrs',
            55'waers'.
  LOOP AT it_vend INTO wa_vend.
    WRITE: /1 wa_vend-lifnr,
            10 wa_vend-land1,
            30 wa_vend-bukrs,
            55 wa_vend-waers.

  ENDLOOP.                             "loop at it_vend...
ELSE.
  MESSAGE TEXT-001 TYPE 'E'.
ENDIF.

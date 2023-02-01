*&---------------------------------------------------------------------*
*& Report Z1014304_BILLING_DATA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_BILLING_DATA.

PARAMETERS : p_date TYPE dats.

TYPES : BEGIN OF st_bill,
        KUNNR TYPE KNA1-KUNNR,
        name1 TYPE KNA1-name1,
        KUNAG TYPE vbrk-KUNAG,
        MABER TYPE vbrk-MABER,
        ERDAT TYPE vbrk-ERDAT,
        END OF st_bill.

DATA : wa_bill TYPE st_bill,
       it_bill TYPE TABLE OF st_bill.

SELECT kna1~kunnr
       kna1~name1
       vbrk~kunag
       vbrk~maber
       vbrk~ERDAT
  INTO table it_bill from KNA1 INNER JOIN vbrk on KNA1~kunnr = vbrk~kunag." WHERE erdat >= currdate() - interval 6 month.

  LOOP AT it_bill INTO wa_bill.

    WRITE :/ wa_bill-KUNNR,
             wa_bill-name1,
             wa_bill-kunag,
             wa_bill-maber,
             wa_bill-ERDAT.
    p_date = p_date + 1.

  ENDLOOP.

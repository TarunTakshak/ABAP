*&---------------------------------------------------------------------*
*& Include          Z1014304_KNA1_COUNTRY_MAIN
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form get_kna1
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_kna1 .

  SELECT kunnr
         land1
         name1
         name2
         ort01
    FROM kna1
    INTO TABLE it_kna1
   WHERE land1 IN s_land.

  IF sy-subrc = 0 AND it_kna1 IS NOT INITIAL.
     SORT it_kna1 BY land1.
  ELSE.

    MESSAGE 'COUNTRY CODE NOT FOUND' TYPE 'E'.

  ENDIF.

  WRITE : / sy-uline+0(100),
          / sy-vline,
          3 'CUSTOMER NUMBER',
         25 'FIRST NAME',
         60 'MIDDLE NAME',
         80 'CITY'.


  LOOP AT it_kna1 INTO wa_kna1.

    ON  CHANGE OF wa_kna1-land1.

      WRITE : / wa_kna1-land1 COLOR 7.
    ENDON.

    WRITE : /3  wa_kna1-kunnr,
             25 wa_kna1-name1,
             60 wa_kna1-name2,
             80 wa_kna1-ort01.

  ENDLOOP.                             "loop at it_kna1 into wa_kna1

ENDFORM.

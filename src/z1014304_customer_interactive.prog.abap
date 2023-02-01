*&---------------------------------------------------------------------*
*& Report Z1014304_CUSTOMER_INTERACTIVE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_customer_interactive.
include Z1014304_CUSTOMER__INCLUDE.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(20) in1.
  SELECT-OPTIONS p_kunnr FOR g_kunnr.
SELECTION-SCREEN END OF BLOCK b1.

INITIALIZATION.
  t1 = 'To Display Customer Details'.
  in1 = 'Enter Customer Number'.

START-OF-SELECTION.
*
*  SELECT  kunnr
*          name1
*          land1
*          ort01
*    INTO TABLE it_kna1 FROM kna1 WHERE kunnr IN p_kunnr.
*  IF sy-subrc = 0 AND it_kna1 IS NOT INITIAL.
*    LOOP AT it_kna1 INTO wa_kna1.
*      WRITE : / wa_kna1-kunnr,
*                wa_kna1-name1,
*                wa_kna1-land1,
*                wa_kna1-ort01.
*    ENDLOOP.
*  ELSE.
*    MESSAGE 'Data Not Found' TYPE 'E'.
*  ENDIF.
  PERFORM get_data_kna1.


AT LINE-SELECTION.
  IF sy-lsind = 1.
    SELECT  vbeln
            erdat
            erzet
            ernam
      FROM vbak INTO TABLE it_vbak WHERE kunnr = wa_kna1-kunnr.
    IF sy-subrc = 0 AND it_vbak IS NOT INITIAL.
      LOOP AT it_vbak INTO wa_vbak.
        WRITE : / wa_vbak-vbeln,
                  wa_vbak-erdat,
                  wa_vbak-erzet,
                  wa_vbak-ernam.
        HIDE wa_vbak-vbeln.
      ENDLOOP.
    ELSE.
      MESSAGE 'Data Not Found' TYPE 'E'.
    ENDIF.

  ELSEIF sy-lsind = 2.
    SELECT vgbel
           pstyv
           posnr
      FROM lips INTO TABLE it_lips WHERE vgbel = wa_vbak-vbeln.
    IF sy-subrc = 0 AND it_lips IS NOT INITIAL.
      LOOP AT it_lips INTO wa_lips.
        WRITE : / wa_lips-vgbe1,
                   wa_lips-pstyv,
                   wa_lips-posnr.
        HIDE wa_lips-vgbe1.
      ENDLOOP.
    ELSE.
      MESSAGE 'Data Not Found' TYPE 'E'.
    ENDIF.

  ELSEIF sy-lsind = 3.
    SELECT  uepos
            fkimg
      FROM vbrp INTO TABLE it_vbrp WHERE uepos = wa_lips-vgbe1.
    IF sy-subrc = 0 AND it_vbrp IS NOT INITIAL.
      LOOP AT  it_vbrp INTO wa_vbrp.
        WRITE : / wa_vbrp-uepos,
                  wa_vbrp-fkimg.
      ENDLOOP.
    ELSE.
      MESSAGE 'Data Not Found' TYPE 'E'.
    ENDIF.
  ENDIF.
*&---------------------------------------------------------------------*
*& Form get_data_kna1
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_data_kna1 .

  SELECT  kunnr
          name1
          land1
          ort01
    INTO TABLE it_kna1 FROM kna1 WHERE kunnr IN p_kunnr.
  IF sy-subrc = 0 AND it_kna1 IS NOT INITIAL.
    LOOP AT it_kna1 INTO wa_kna1.
      WRITE : / wa_kna1-kunnr,
                wa_kna1-name1,
                wa_kna1-land1,
                wa_kna1-ort01.
    ENDLOOP.
  ELSE.
    MESSAGE 'Data Not Found' TYPE 'E'.
  ENDIF.

ENDFORM.

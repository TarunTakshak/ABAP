*&---------------------------------------------------------------------*
*& Report Z1014304_MPP_VBAK_VBAP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_mpp_vbak_vbap.
TABLES : vbak,vbap.
CONTROLS tb1 TYPE TABLEVIEW USING SCREEN 100.
TYPES : BEGIN OF ty_vbak,
          erdat TYPE  vbak-erdat,
          erzet TYPE vbak-erzet,
          ernam TYPE vbak-ernam,
          angdt TYPE vbak-angdt,
        END OF ty_vbak,

        BEGIN OF ty_vbap,
          vbeln TYPE  vbap-vbeln,
          posnr TYPE  vbap-posnr,
          matnr TYPE  vbap-matnr,
          matwa TYPE  vbap-matwa,
          pmatn TYPE  vbap-pmatn,
        END OF ty_vbap.


DATA : it_vbak TYPE  ty_vbak,
       wa_vbak TYPE ty_vbak,
       it_vbap TYPE TABLE OF  ty_vbap,
       wa_vbap TYPE ty_vbap,
       g_vbeln TYPE vbak-vbeln.

SELECTION-SCREEN BEGIN OF SCREEN 50 AS SUBSCREEN.
  PARAMETERS : g_vebeln TYPE vbak-vbeln DEFAULT 1.
SELECTION-SCREEN END OF SCREEN 50.


CALL SCREEN 100.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'ZPF_SALES'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  CASE sy-ucomm.
    WHEN 'E1' OR 'CANCEL' OR 'BACK'.
      LEAVE PROGRAM.
    WHEN 'GD1'.
      PERFORM get_vbak.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_vbak
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_vbak .

  SELECT SINGLE
         erdat
         erzet
         ernam
         angdt
    FROM vbak INTO  it_vbak WHERE vbeln EQ g_vebeln.
  IF sy-subrc = 0 AND it_vbak IS NOT INITIAL.
    SELECT   vbeln
             posnr
             matnr
             matwa
             pmatn
     FROM vbap INTO TABLE it_vbap WHERE vbeln EQ g_vebeln.

  ELSE.
      MESSAGE 'NO DATA FOUND' TYPE 'I'.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Module TABLE_CONTROL OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE table_control OUTPUT.

  vbap-vbeln  = wa_vbap-vbeln.
  vbap-posnr  = wa_vbap-posnr.
  vbap-matnr  = wa_vbap-matnr.
  vbap-matwa  = wa_vbap-matwa.
  vbap-pmatn  = wa_vbap-pmatn.
ENDMODULE.

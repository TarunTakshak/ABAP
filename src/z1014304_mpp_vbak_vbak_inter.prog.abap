*&---------------------------------------------------------------------*
*& Report Z1014304_MPP_VBAK_VBAK_INTER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_mpp_vbak_vbak_inter.

TABLES : vbak,vbap.

CONTROLS : tb1 TYPE TABLEVIEW USING SCREEN 100,
           tb2 TYPE TABLEVIEW USING SCREEN 200.

TYPES : BEGIN OF ty_vbak,
          vbeln TYPE vbak-vbeln,
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


DATA : it_vbak TYPE TABLE OF  ty_vbak,
       wa_vbak TYPE ty_vbak,
       it_vbap TYPE TABLE OF  ty_vbap,
       wa_vbap TYPE ty_vbap,
       g_vbeln TYPE vbak-vbeln,
       g_value TYPE vbak-vbeln,
       gv_vbeln TYPE vbak-vbeln.


SELECTION-SCREEN BEGIN OF SCREEN 50 AS SUBSCREEN.
  SELECT-OPTIONS : s_vbeln FOR g_vbeln DEFAULT 1 to 5.
SELECTION-SCREEN END OF SCREEN 50.

CALL SCREEN 100.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
 SET PF-STATUS 'ZPF_INTERACTIVE'.
 set TITLEBAR 'ZTITLE_INTERACTIVE'.
ENDMODULE.


*&---------------------------------------------------------------------*
*& Module STATUS_0200 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
 SET PF-STATUS 'ZPF_INTERACTIVE'.
 SET TITLEBAR 'ZTITLE'.
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
    WHEN 'GD'.
      PERFORM get_vbak.
    WHEN '&IC1'.
      GET CURSOR FIELD gv_vbeln VALUE g_value.
      PERFORM get_vbap.
      CALL SCREEN 200.
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

  SELECT
         vbeln
         erdat
         erzet
         ernam
         angdt
    FROM vbak
    INTO TABLE it_vbak
   WHERE vbeln IN s_vbeln.
  IF sy-subrc = 0 AND it_vbak IS NOT INITIAL.
    TB1-lines = sy-dbcnt.
  ELSE.
    MESSAGE 'Data not found' TYPE 'E'.
  ENDIF.

SORT it_vbak by vbeln.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.

  CASE sy-ucomm.
    WHEN 'E2' OR 'CANCEL' OR 'BACK'.
      LEAVE TO SCREEN 100.
  ENDCASE.


ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_vbap
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_vbap .
CLEAR it_vbap.
  SELECT      vbeln
              posnr
              matnr
              matwa
              pmatn
      FROM vbap
      INTO TABLE it_vbap
     WHERE vbeln EQ g_value.

  IF sy-subrc = 0 AND it_vbap IS NOT INITIAL.
     TB2-lines = sy-dbcnt.
  ELSE.
    MESSAGE 'Data not found' TYPE 'I'.
  ENDIF.


ENDFORM.

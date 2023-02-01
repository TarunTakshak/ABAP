*&---------------------------------------------------------------------*
*& Report Z1014304_MPP_EKKO_DIALOG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_mpp_ekko_dialog.

TABLES : ekko.

data: g_ebeln TYPE ekko-ebeln,
      g_burks TYPE  EKKO-BUKRS,
      g_AEDAT TYPE EKKO-AEDAT,
      g_ERNAM TYPE EKKO-ERNAM,
      g_PINCR TYPE EKKO-PINCR,
      g_LIFNR TYPE EKKO-LIFNR,
      g_SPRAS TYPE EKKO-SPRAS,
      g_ZBD1T TYPE EKKO-ZBD1T.

CALL SCREEN 100.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'ZPF_EKKO_DIALOG'.
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
      PERFORM get_ekko.
      CALL SCREEN 200 STARTING AT 10 30 ENDING AT 40 60.
  ENDCASE.
  clear screen.
ENDMODULE.

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.

  CASE sy-ucomm.
    WHEN 'C1' OR 'CANCEL' OR 'BACK'..
      LEAVE TO SCREEN 100.

  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0200 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
 SET PF-STATUS 'ZPF_EKKO_DIALOG'.
 " PERFORM get_ekko.

ENDMODULE.

*&---------------------------------------------------------------------*
*& Form get_ekko
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_ekko .

  SELECT SINGLE bukrs
         aedat
         ernam
         pincr
         lifnr
         spras
         zbd1t
FROM ekko INTO  ( g_burks ,g_AEDAT,g_ERNAM,g_PINCR,g_LIFNR,g_SPRAS,g_zbd1t ) WHERE ebeln EQ g_ebeln.
IF  sy-subrc = 0.

  MESSAGE 'DATA FETCHED SUCESSFULLY' TYPE 'I'.

  ELSE.
  MESSAGE 'INVALID DATA' TYPE 'I'.

ENDIF.

ENDFORM.

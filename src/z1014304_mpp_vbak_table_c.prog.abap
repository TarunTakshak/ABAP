*&---------------------------------------------------------------------*
*& Report Z1014304_MPP_VBAK_TABLE_C
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_mpp_vbak_table_c.
TABLES : vbak.
CONTROLS TB1 TYPE TABLEVIEW USING SCREEN 100.

TYPES : BEGIN OF ty_vbak,
          vbeln TYPE vbak-vbeln,
          erdat TYPE vbak-erdat,
          erzet TYPE vbak-erzet,
          ernam TYPE vbak-ernam,
          angdt TYPE vbak-angdt,
          bnddt TYPE vbak-bnddt,
        END OF ty_vbak.

DATA : it_vbak TYPE TABLE OF ty_vbak,
       wa_vbak TYPE ty_vbak,
       g_vbeln TYPE vbak-vbeln.

SELECTION-SCREEN BEGIN OF SCREEN 50 as SUBSCREEN.
SELECT-OPTIONS s_vbeln FOR g_vbeln DEFAULT 1 to 50.
SELECTION-SCREEN END OF SCREEN 50.


CALL SCREEN 100.


*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'ZPF_TABLE'.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  CASE sy-ucomm.
    WHEN 'E1' OR 'BACK' OR 'CANCEL' .
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

  SELECT         vbeln
                 erdat
                 erzet
                 ernam
                 angdt
                 bnddt
    FROM vbak INTO TABLE it_vbak WHERE vbeln IN s_vbeln.

  IF  sy-subrc = 0 AND it_vbak IS NOT INITIAL.

    TB1-lines = sy-dbcnt.

  ELSE.
    MESSAGE 'INVALID DATA' TYPE 'I'.

  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Module TB1 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE table_ctrl OUTPUT.
clear vbak.
vbak-vbeln = wa_vbak-vbeln.
vbak-erdat = wa_vbak-erdat.
vbak-erzet = wa_vbak-erzet.
vbak-ernam = wa_vbak-ernam.
vbak-angdt = wa_vbak-angdt.
vbak-bnddt = wa_vbak-bnddt.


ENDMODULE.

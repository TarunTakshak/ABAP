
*&---------------------------------------------------------------------*
*& Module STATUS_0220 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0220 OUTPUT.
 SET PF-STATUS 'ZPF_100'.
 SET TITLEBAR 'ZPF_SALES'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0220  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0220 INPUT.

  CASE sy-ucomm.
  WHEN 'E5' or 'CANCEL' or 'BACK'.
    leave to SCREEN 0.
ENDCASE.


ENDMODULE.

*&---------------------------------------------------------------------*
*& Report Z1014304_MODIFY_SCREEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_modify_screen.

*SELECTION-SCREEN BEGIN OF BLOCK b1.
*  PARAMETERS : rb_name  RADIOBUTTON GROUP rad1 USER-COMMAND uc1 DEFAULT 'X',
*               p_fname  TYPE char10 MODIF ID key,
*               f_name   TYPE char10 MODIF ID key,
*               l_name   TYPE char10 MODIF ID key,
*
*               rb_add   RADIOBUTTON GROUP rad1, " USER-COMMAND uc1,
*               p_city   TYPE char10  MODIF ID str,
*               p_state  TYPE char10 MODIF ID str,
*               p_count  TYPE char10  MODIF ID str,
*
*               rb_phone RADIOBUTTON GROUP rad1 , "USER-COMMAND uc1,
*               p_cont   TYPE char10 MODIF ID val,
*               p_home   TYPE char10 MODIF ID val,
*               p_office TYPE char10 MODIF ID val.

SELECTION-SCREEN BEGIN OF BLOCK b1.
  PARAMETERS : rb_name  RADIOBUTTON GROUP rb1 USER-COMMAND fc1 DEFAULT 'X',
               p_fname  TYPE char10 MODIF ID abc ,"OBLIGATORY,
               p_sname  TYPE char10 MODIF ID abc,

               rb_add   RADIOBUTTON GROUP rb1,
               p_city   TYPE char10 MODIF ID pqr,
               p_state  TYPE char10 MODIF ID pqr,
               rb_phone RADIOBUTTON GROUP rb1,
               p_home   TYPE char10 MODIF ID xyz,
               p_office TYPE char10 MODIF ID xyz.
SELECTION-SCREEN END OF BLOCK b1.



AT SELECTION-SCREEN OUTPUT.

  LOOP AT SCREEN.
    IF screen-name = 'P_FNAME'.
      screen-required  = 2.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.
  LOOP AT SCREEN.
    IF rb_name EQ 'X' AND screen-group1 = 'ABC'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF rb_add EQ 'X' AND screen-group1 = 'PQR'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF rb_PHONE EQ 'X' AND screen-group1 = 'XYZ'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF rb_name EQ ' ' AND screen-group1 = 'ABC'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF rb_add EQ ' ' AND screen-group1 = 'PQR'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF rb_phone EQ ' ' AND screen-group1 = 'XYZ'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.
  ENDLOOP.

START-OF-SELECTION .
  IF p_fname IS INITIAL.
    MESSAGE 'Fill out all required field ' TYPE 'S' DISPLAY LIKE 'E'.
  ELSE.
    WRITE p_fname.
  ENDIF.
  write p_fname.

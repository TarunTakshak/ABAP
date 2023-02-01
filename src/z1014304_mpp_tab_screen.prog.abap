*&---------------------------------------------------------------------*
*& Report Z1014304_MPP_TAB_SCREEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_mpp_tab_screen.

CONTROLS tabstrip TYPE TABSTRIP.

TYPES : BEGIN OF ty_emp,
          employee_id       TYPE z1014304_t_emp_m-employee_id,
          employee_title    TYPE z1014304_t_emp_m-employee_id,
          first_name        TYPE z1014304_t_emp_m-first_name,
          middle_name       TYPE z1014304_t_emp_m-first_name,
          last_name         TYPE z1014304_t_emp_m-last_name,
          door_no           TYPE z1014304_t_emp_m-door_no,
          pincode           TYPE z1014304_t_emp_m-pincode,
          street            TYPE z1014304_t_emp_m-street,
          country           TYPE z1014304_t_emp_m-country,
          doj               TYPE z1014304_t_emp_m-doj,
          designation       TYPE z1014304_t_emp_m-designation,
          reporting_manager TYPE z1014304_t_emp_m-reporting_manager,
          salary            TYPE z1014304_t_emp_m-salary,
          dob               TYPE z1014304_t_emp_m-dob,
          gender            TYPE z1014304_t_emp_m-gender,
        END OF ty_emp.

DATA : it_emp TYPE TABLE OF ty_emp,
       wa_emp TYPE ty_emp.

SELECTION-SCREEN BEGIN OF SCREEN 50 AS SUBSCREEN.
  PARAMETERS : p_EMP_id TYPE  z1014304_t_emp_m-employee_id.
SELECTION-SCREEN END OF SCREEN 50.


CALL SCREEN 100.

CALL SCREEN 101.
CALL SCREEN 102.
CALL SCREEN 103.

*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'ZPF_EMP_100'.
 SET TITLEBAR 'ZPF_EMP'.



ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  CASE sy-ucomm.

    WHEN 'EMP1'.
      tabstrip-activetab = 'EMP1'.
    WHEN 'EMP2'.
      tabstrip-activetab = 'EMP2'.
    WHEN 'EMP3'.
      tabstrip-activetab = 'EMP3'.
    WHEN 'GD1'.
      PERFORM get_personal.
    WHEN 'E1' OR 'CANCEL' OR 'BACK'.
      LEAVE PROGRAM.

  ENDCASE.


ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_personal
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_personal .

  SELECT SINGLE
          employee_id
          employee_title
          first_name
          middle_name
          last_name
          door_no
          pincode
          street
          country
          doj
          designation
          reporting_manager
          salary
          dob
          gender

       FROM z1014304_t_emp_m INTO WA_emp WHERE employee_id = p_emp_id.

  IF sy-subrc <> 0 AND it_emp IS INITIAL.

    MESSAGE 'INVALID DATA' TYPE 'I'.
  ENDIF.

ENDFORM.

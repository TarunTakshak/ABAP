*&---------------------------------------------------------------------*
*& Report Z1014304_MPP_EMPLOYEE_DETAILS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_mpp_employee_details.

TABLES : z1014304_t_emp_m.

TYPE-pools : vrm.


TYPES : BEGIN OF ty_emp,
          employee_id       TYPE z1014304_t_emp_m-employee_id,
          employee_title    TYPE z1014304_t_emp_m-employee_id,
          first_name        TYPE z1014304_t_emp_m-first_name,
          middle_name       TYPE z1014304_t_emp_m-first_name,
          last_name         TYPE z1014304_t_emp_m-last_name,
          door_no           TYPE z1014304_t_emp_m-door_no,
          pincode           TYPE z1014304_t_emp_m-pincode,
          street            TYPE z1014304_t_emp_m-street,
          countr            TYPE z1014304_t_emp_m-country,
          doj               TYPE z1014304_t_emp_m-doj,
          designation       TYPE z1014304_t_emp_m-designation,
          reporting_manager TYPE z1014304_t_emp_m-reporting_manager,
          salary            TYPE z1014304_t_emp_m-salary,
          dob               TYPE z1014304_t_emp_m-dob,
          gender            TYPE z1014304_t_emp_m-gender,
          blood_group       TYPE z1014304_t_emp_m-blood_group,
          created_on        TYPE z1014304_t_emp_m-created_on,
          created_by        TYPE z1014304_t_emp_m-created_by,
        END OF ty_emp.

DATA : g_emp TYPE Z1014304_t_emp_m-employee_id.


DATA : GV_ID    TYPE VRM_ID,
       it_VALUE TYPE VRM_VALUES,
       wa_VALUE LIKE LINE OF it_VALUE,
       employee_title TYPE VRM_ID,
       rb1,
       rb2,
       rb3.

CALL SCREEN 100.

*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'ZPF_EMP'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE  sy-ucomm.
    WHEN 'E1' OR 'BACK'.
      LEAVE PROGRAM.
    WHEN 'GD1'.
      clear Z1014304_t_emp_m .
        PERFORM get_emp.
      CALL SCREEN 200.
    WHEN OTHERS.
  ENDCASE.


ENDMODULE.

*&---------------------------------------------------------------------*
*& Module STATUS_0200 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
 SET PF-STATUS 'ZPF_EMP'.

 LOOP AT SCREEN.
   IF screen-name ='Z1014304_T_EMP_M-GENDER'.
     IF rb1 = 'X'.
       z1014304_t_emp_m-gender = 'MALE'.
    ELSEIF rb2 = 'X'.
      z1014304_t_emp_m-gender = 'FEMALE'.
    ELSEIF rb3 = 'X'.
      z1014304_t_emp_m-gender = 'OTHERS'.
     ENDIF.
   ENDIF.
  ENDLOOP.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_emp
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_emp .

PERFORM set_list.

  SELECT SINGLE *

    FROM Z1014304_t_emp_m INTO Z1014304_t_emp_m   WHERE employee_id = g_emp.
  IF sy-subrc <> 0 AND Z1014304_t_emp_m  IS INITIAL.

    MESSAGE 'DATA NOT FOUND ENTER NEW RECORD' TYPE 'I'.



  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.

  CASE sy-ucomm .
    WHEN 'C1' OR 'CANCEL' OR 'BACK' .
      LEAVE to SCREEN 100.
    WHEN 'IN1'.
      INSERT Z1014304_t_emp_m  FROM Z1014304_t_emp_m .
      MESSAGE 'RECORD INSERTED SUCESSFULLY' TYPE 'I'.
    WHEN 'M1'.
      MODIFY Z1014304_t_emp_m  FROM Z1014304_t_emp_m .
      MESSAGE 'RECORD MODIFIED SUCESSFULLY' TYPE 'I'.
    WHEN 'D1'.
      DELETE FROM Z1014304_t_emp_m WHERE employee_id = Z1014304_t_emp_m-employee_id.
      MESSAGE 'RECORD DELETED SUCESSFULLY' TYPE 'I'.

  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Form set_list
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM set_list .

REFRESH it_VALUE.

  wa_VALUE-KEY = 'K1'.
  wa_VALUE-TEXT = 'MR'.
  APPEND wa_VALUE TO it_VALUE.
  CLEAR wa_VALUE.


  wa_VALUE-KEY = 'K2'.
  wa_VALUE-TEXT = 'MRS.'.
  APPEND wa_VALUE TO it_VALUE.
  CLEAR wa_VALUE.


  wa_VALUE-KEY = 'K3'.
  wa_VALUE-TEXT = 'MISS.'.
  APPEND wa_VALUE TO it_VALUE.
  CLEAR wa_VALUE.

 GV_ID = 'L1'.


CALL FUNCTION 'VRM_SET_VALUES'
  EXPORTING
    id                    = gv_id
    values                = it_value
* EXCEPTIONS
*   ID_ILLEGAL_NAME       = 1
*   OTHERS                = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.


ENDFORM.

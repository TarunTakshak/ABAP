*&---------------------------------------------------------------------*
*& Report Z1014304_EMPLOYEE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_EMPLOYEE.
*PARAMETERS : p_add RADIOBUTTON GROUP rad1,
*             p_del RADIOBUTTON GROUP rad1,
*             p_mod RADIOBUTTON GROUP rad1.
*DATA : it_emp TYPE SORTED TABLE of Z1014304_T_EMPRE WITH UNIQUE KEY Employee_NO,
*        wa_emp TYPE Z1014304_T_EMPRE.
*
*select * from Z1014304_T_EMPRE INTO TABLE it_emp.
*
*  CASE 'X'.
*    WHEN p_add.
*      wa_emp-Employee_NO = '101006'.
*      wa_emp-EMPLOYEE_NAME = 's'.
*      wa_emp-DOJ = '20210310'.
*      wa_emp-DESIGNATION = 'lead'.
*      wa_emp-DEPARTMENT = 'MM'.
*      wa_emp-REPORTING_MANAGER = 'kiran'.
*      APPEND wa_emp to it_emp.         "adding data to internal table
*      update Z1014304_T_EMPRE from TABLE it_emp.
*
*    WHEN p_del.
*
*     " DELETE it_emp INDEX 5.            "deleting data in internal table
*      delete from Z1014304_T_EMPRE where Employee_NO = '101003'.
*     " update Z1014304_T_EMPRE from TABLE it_emp.
*    WHEN p_mod.
*      wa_emp-Employee_NO = '101003'.
*      wa_emp-EMPLOYEE_NAME = 'kumar'.
*      wa_emp-DOJ = '20210309'.
*      wa_emp-DESIGNATION = 'SR lead'.
*      wa_emp-DEPARTMENT = 'security'.
*      wa_emp-REPORTING_MANAGER = 'sai KUMAR'.
*      MODIFY it_emp from wa_emp INDEX 3. "modifying data in internal table
*      UPDATE Z1014304_T_EMPRE from TABLE it_emp.
*
*  ENDCASE.
*
*  LOOP AT it_emp INTO wa_emp.
*
*    WRITE: /1 wa_emp.
*
*  ENDLOOP.

"SY-SUBRC CHECK
data : it_mara TYPE TABLE OF mara,
       wa_mara TYPE mara.

SELECT * from mara INTO TABLE it_mara where matnr = '93829'.

  START-OF-SELECTION.
  SELECT * from mara INTO TABLE it_mara.
  if sy-subrc = 0.
    WRITE :/ 'Test Successful'.
   ELSe.
     MESSAGE 'Not Valid' TYPE 'E'.
    ENDIF.
    end-of-SELECTION.

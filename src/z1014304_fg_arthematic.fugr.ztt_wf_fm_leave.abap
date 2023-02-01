FUNCTION ZTT_WF_FM_LEAVE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_EMP_ID) LIKE  PA0002-PERNR
*"  EXPORTING
*"     REFERENCE(EV_MANAGER) LIKE  PA0002-NACHN
*"----------------------------------------------------------------------

data : ls_emp_mgn type zwf_manager.

IF iv_emp_id is NOT INITIAL.

  select SINGLE * from zwf_manager into ls_emp_mgn.

    IF sy-subrc = 0.

      ev_manager = ls_emp_mgn-manager.

    ENDIF.

ENDIF.



ENDFUNCTION.

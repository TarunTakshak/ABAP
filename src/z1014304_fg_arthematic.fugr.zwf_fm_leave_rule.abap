FUNCTION ZWF_FM_LEAVE_RULE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  TABLES
*"      ACTOR_TAB STRUCTURE  SWHACTOR
*"      AC_CONTAINER STRUCTURE  SWCONT
*"----------------------------------------------------------------------
data : lv_emp_id TYPE pa0002-pernr,
       ls_emp_mgnr TYPE zwf_manager.

swc_get_element ac_container 'EMPID' lv_emp_id.

IF lv_emp_id is NOT INITIAL.

  select SINGLE * from zwf_manager into ls_emp_mgnr WHERE empid = lv_emp_id.

    IF sy-subrc = 0.

      actor_tab-otype = 'US'.
      actor_tab-objid = ls_emp_mgnr-manager.
      APPEND actor_tab.

    ENDIF.

ENDIF.


ENDFUNCTION.

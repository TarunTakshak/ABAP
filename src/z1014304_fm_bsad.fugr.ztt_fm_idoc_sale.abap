FUNCTION ZTT_FM_IDOC_SALE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(INPUT_METHOD) LIKE  BDWFAP_PAR-INPUTMETHD
*"     VALUE(MASS_PROCESSING) LIKE  BDWFAP_PAR-MASS_PROC
*"  EXPORTING
*"     VALUE(WORKFLOW_RESULT) LIKE  BDWF_PARAM-RESULT
*"     VALUE(APPLICATION_VARIABLE) LIKE  BDWF_PARAM-APPL_VAR
*"     VALUE(IN_UPDATE_TASK) LIKE  BDWFAP_PAR-UPDATETASK
*"     VALUE(CALL_TRANSACTION_DONE) LIKE  BDWFAP_PAR-CALLTRANS
*"  TABLES
*"      IDOC_CONTRL STRUCTURE  EDIDC
*"      IDOC_DATA STRUCTURE  EDIDD
*"      IDOC_STATUS STRUCTURE  BDIDOCSTAT
*"      RETURN_VARIABLES STRUCTURE  BDWFRETVAR
*"      SERIALIZATION_INFO STRUCTURE  BDI_SER
*"  EXCEPTIONS
*"      WRONG_FUNCTION_CALLED
*"----------------------------------------------------------------------
*----------------------------------------------------------------------*
*  this function module is generated                                   *
*          never change it manually, please!        14.02.2002         *
*----------------------------------------------------------------------*

  " IDOC_STATUS_HRTRPR

  INCLUDE mbdconwf.

  DATA: lt_seg TYPE TABLE OF ZTT_STR_SALES,
        ls_seg like LINE OF lt_seg.

  workflow_result = c_wf_result_ok.

  LOOP AT idoc_contrl.
    IF idoc_contrl-mestyp = 'ZTT_MESSAGE_CU_OR'.
      LOOP AT idoc_data.
        ls_seg = idoc_data-sdata.

      ENDLOOP.
      IF sy-subrc = 0.

        APPEND VALUE #( docnum = idoc_data-docnum
                                 status = '53'
                                 msgv1 = ls_seg-vbeln ) to idoc_status[].
        CLEAR idoc_status.
      ELSE.
          APPEND VALUE #( docnum = idoc_data-docnum
                                      status = '51'
                                      msgv1 = ls_seg-vbeln ) to idoc_status[].
        CLEAR idoc_status.
      ENDIF.
    ENDIF.

  ENDLOOP.


ENDFUNCTION.

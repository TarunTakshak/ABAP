*&---------------------------------------------------------------------*
*& Include          Z1014304_OPEN_CLOSE_MAIN
*&---------------------------------------------------------------------*
 SELECT bukrs
             kunnr
             umsks
             umskz
             augdt
             augbl
             zuonr
             gjahr
             belnr
             buzei
             budat
        FROM bsid INTO TABLE it_bsid WHERE bsid~kunnr = p_kunnr.
      IF sy-subrc <> 0 AND it_bsid IS  INITIAL.
        MESSAGE 'Data Not found' TYPE 'E'.
        endif.

FUNCTION Z1014304_FM_BSAD.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  TABLES
*"      PERNR_RANGE
*"      ADCD
*"  CHANGING
*"     REFERENCE(IT_BSAD) TYPE  Z1014304_TT_BSAD
*"----------------------------------------------------------------------

"Data: it_bsad1 TYPE Z1014304_TT_BSAD.
 SELECT  bukrs
              kunnr
              umsks
              umskz
              augdt
              augbl
        FROM bsad INTO TABLE it_bsad WHERE kunnr in pernr_range.
      IF sy-subrc = 0 AND it_bsad IS NOT INITIAL.
       ENDIF.

*it_bsad = it_bsad1[].
ENDFUNCTION.

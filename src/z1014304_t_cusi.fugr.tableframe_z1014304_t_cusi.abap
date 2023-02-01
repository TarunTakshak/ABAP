*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_Z1014304_T_CUSI
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_Z1014304_T_CUSI    .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.

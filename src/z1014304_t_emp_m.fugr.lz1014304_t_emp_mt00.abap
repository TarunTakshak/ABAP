*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_EMP_M................................*
DATA:  BEGIN OF STATUS_Z1014304_T_EMP_M              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_EMP_M              .
CONTROLS: TCTRL_Z1014304_T_EMP_M
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_EMP_M              .
TABLES: Z1014304_T_EMP_M               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

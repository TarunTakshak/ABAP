*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_CU_AD................................*
DATA:  BEGIN OF STATUS_Z1014304_T_CU_AD              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_CU_AD              .
CONTROLS: TCTRL_Z1014304_T_CU_AD
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_CU_AD              .
TABLES: Z1014304_T_CU_AD               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

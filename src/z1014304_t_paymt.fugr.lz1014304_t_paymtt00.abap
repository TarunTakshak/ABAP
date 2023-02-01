*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_PAYMT................................*
DATA:  BEGIN OF STATUS_Z1014304_T_PAYMT              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_PAYMT              .
CONTROLS: TCTRL_Z1014304_T_PAYMT
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_PAYMT              .
TABLES: Z1014304_T_PAYMT               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_BTRAN................................*
DATA:  BEGIN OF STATUS_Z1014304_T_BTRAN              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_BTRAN              .
CONTROLS: TCTRL_Z1014304_T_BTRAN
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_BTRAN              .
TABLES: Z1014304_T_BTRAN               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

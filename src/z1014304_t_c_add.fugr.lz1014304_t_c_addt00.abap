*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_C_ADD................................*
DATA:  BEGIN OF STATUS_Z1014304_T_C_ADD              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_C_ADD              .
CONTROLS: TCTRL_Z1014304_T_C_ADD
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_C_ADD              .
TABLES: Z1014304_T_C_ADD               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

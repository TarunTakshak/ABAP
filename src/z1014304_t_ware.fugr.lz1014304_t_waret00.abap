*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_WARE.................................*
DATA:  BEGIN OF STATUS_Z1014304_T_WARE               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_WARE               .
CONTROLS: TCTRL_Z1014304_T_WARE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_WARE               .
TABLES: Z1014304_T_WARE                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_STOCK................................*
DATA:  BEGIN OF STATUS_Z1014304_T_STOCK              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_STOCK              .
CONTROLS: TCTRL_Z1014304_T_STOCK
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_STOCK              .
TABLES: Z1014304_T_STOCK               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

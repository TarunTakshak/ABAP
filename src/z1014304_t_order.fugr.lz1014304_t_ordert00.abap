*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_ORDER................................*
DATA:  BEGIN OF STATUS_Z1014304_T_ORDER              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_ORDER              .
CONTROLS: TCTRL_Z1014304_T_ORDER
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_ORDER              .
TABLES: Z1014304_T_ORDER               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

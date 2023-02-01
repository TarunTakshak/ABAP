*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_PRODU................................*
DATA:  BEGIN OF STATUS_Z1014304_T_PRODU              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_PRODU              .
CONTROLS: TCTRL_Z1014304_T_PRODU
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_PRODU              .
TABLES: Z1014304_T_PRODU               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_HOTEL................................*
DATA:  BEGIN OF STATUS_Z1014304_T_HOTEL              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_HOTEL              .
CONTROLS: TCTRL_Z1014304_T_HOTEL
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_HOTEL              .
TABLES: Z1014304_T_HOTEL               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

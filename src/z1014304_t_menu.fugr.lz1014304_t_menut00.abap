*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_MENU.................................*
DATA:  BEGIN OF STATUS_Z1014304_T_MENU               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_MENU               .
CONTROLS: TCTRL_Z1014304_T_MENU
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_MENU               .
TABLES: Z1014304_T_MENU                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

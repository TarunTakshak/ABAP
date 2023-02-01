*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_BANK.................................*
DATA:  BEGIN OF STATUS_Z1014304_T_BANK               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_BANK               .
CONTROLS: TCTRL_Z1014304_T_BANK
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_BANK               .
TABLES: Z1014304_T_BANK                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

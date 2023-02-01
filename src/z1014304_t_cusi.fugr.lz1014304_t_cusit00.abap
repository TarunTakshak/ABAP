*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_CUSI.................................*
DATA:  BEGIN OF STATUS_Z1014304_T_CUSI               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_CUSI               .
CONTROLS: TCTRL_Z1014304_T_CUSI
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_CUSI               .
TABLES: Z1014304_T_CUSI                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

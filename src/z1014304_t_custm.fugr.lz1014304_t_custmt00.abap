*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_CUSTM................................*
DATA:  BEGIN OF STATUS_Z1014304_T_CUSTM              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_CUSTM              .
CONTROLS: TCTRL_Z1014304_T_CUSTM
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_CUSTM              .
TABLES: Z1014304_T_CUSTM               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

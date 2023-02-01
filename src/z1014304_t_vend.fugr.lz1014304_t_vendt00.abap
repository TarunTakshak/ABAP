*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_VEND.................................*
DATA:  BEGIN OF STATUS_Z1014304_T_VEND               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_VEND               .
CONTROLS: TCTRL_Z1014304_T_VEND
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_VEND               .
TABLES: Z1014304_T_VEND                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

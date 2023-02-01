*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_EMPRE................................*
DATA:  BEGIN OF STATUS_Z1014304_T_EMPRE              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_EMPRE              .
CONTROLS: TCTRL_Z1014304_T_EMPRE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_EMPRE              .
TABLES: Z1014304_T_EMPRE               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

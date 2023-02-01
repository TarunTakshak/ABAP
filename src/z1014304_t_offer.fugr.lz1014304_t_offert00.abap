*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_OFFER................................*
DATA:  BEGIN OF STATUS_Z1014304_T_OFFER              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_OFFER              .
CONTROLS: TCTRL_Z1014304_T_OFFER
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_OFFER              .
TABLES: Z1014304_T_OFFER               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

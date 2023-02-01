*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_CARD.................................*
DATA:  BEGIN OF STATUS_Z1014304_T_CARD               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_CARD               .
CONTROLS: TCTRL_Z1014304_T_CARD
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_CARD               .
TABLES: Z1014304_T_CARD                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

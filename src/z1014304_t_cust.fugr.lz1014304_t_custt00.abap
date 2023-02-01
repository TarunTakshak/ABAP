*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_CUST.................................*
DATA:  BEGIN OF STATUS_Z1014304_T_CUST               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_CUST               .
CONTROLS: TCTRL_Z1014304_T_CUST
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_CUST               .
TABLES: Z1014304_T_CUST                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

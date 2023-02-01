*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_ADDI.................................*
DATA:  BEGIN OF STATUS_Z1014304_T_ADDI               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_ADDI               .
CONTROLS: TCTRL_Z1014304_T_ADDI
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_ADDI               .
TABLES: Z1014304_T_ADDI                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

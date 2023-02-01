*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_EMP..................................*
DATA:  BEGIN OF STATUS_Z1014304_T_EMP                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_EMP                .
CONTROLS: TCTRL_Z1014304_T_EMP
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_EMP                .
TABLES: Z1014304_T_EMP                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

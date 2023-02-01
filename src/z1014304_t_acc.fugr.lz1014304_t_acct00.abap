*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_ACC..................................*
DATA:  BEGIN OF STATUS_Z1014304_T_ACC                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_ACC                .
CONTROLS: TCTRL_Z1014304_T_ACC
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_ACC                .
TABLES: Z1014304_T_ACC                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

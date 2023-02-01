*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_M_V..................................*
TABLES: Z1014304_T_M_V, *Z1014304_T_M_V. "view work areas
CONTROLS: TCTRL_Z1014304_T_M_V
TYPE TABLEVIEW USING SCREEN '0001'.
DATA: BEGIN OF STATUS_Z1014304_T_M_V. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_Z1014304_T_M_V.
* Table for entries selected to show on screen
DATA: BEGIN OF Z1014304_T_M_V_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE Z1014304_T_M_V.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF Z1014304_T_M_V_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF Z1014304_T_M_V_TOTAL OCCURS 0010.
INCLUDE STRUCTURE Z1014304_T_M_V.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF Z1014304_T_M_V_TOTAL.

*.........table declarations:.................................*
TABLES: Z1014304_T_ACC                 .
TABLES: Z1014304_T_BANK                .
TABLES: Z1014304_T_BTRAN               .
TABLES: Z1014304_T_CUSTM               .

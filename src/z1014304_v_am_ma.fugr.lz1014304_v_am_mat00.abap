*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_V_AM_MA................................*
TABLES: Z1014304_V_AM_MA, *Z1014304_V_AM_MA. "view work areas
CONTROLS: TCTRL_Z1014304_V_AM_MA
TYPE TABLEVIEW USING SCREEN '0001'.
DATA: BEGIN OF STATUS_Z1014304_V_AM_MA. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_Z1014304_V_AM_MA.
* Table for entries selected to show on screen
DATA: BEGIN OF Z1014304_V_AM_MA_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE Z1014304_V_AM_MA.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF Z1014304_V_AM_MA_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF Z1014304_V_AM_MA_TOTAL OCCURS 0010.
INCLUDE STRUCTURE Z1014304_V_AM_MA.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF Z1014304_V_AM_MA_TOTAL.

*.........table declarations:.................................*
TABLES: Z1014304_T_CUST                .
TABLES: Z1014304_T_ORDER               .
TABLES: Z1014304_T_TRANS               .

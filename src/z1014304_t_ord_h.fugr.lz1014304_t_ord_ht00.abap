*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1014304_T_ORD_H................................*
DATA:  BEGIN OF STATUS_Z1014304_T_ORD_H              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1014304_T_ORD_H              .
CONTROLS: TCTRL_Z1014304_T_ORD_H
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1014304_T_ORD_H              .
TABLES: Z1014304_T_ORD_H               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .

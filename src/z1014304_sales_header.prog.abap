*&---------------------------------------------------------------------*
*& Report Z1014304_SALES_HEADER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_sales_header.

TYPE-POOLS : slis.
TABLES :vbak,vbap.

"include to hold structure and data declartions
include z1014304_sales_header_str.

"include to hold sales header main
include z1014304_sales_header_main.

INITIALIZATION.
t1 = 'SALES HEADER DETAILS'.
in1 = 'Enter The Date'.
t2 = 'Enter List or Grid Display'.



START-OF-SELECTION.

"perform to fetch data for vbak and vbap
PERFORM get_vbak_vbap.


"perform for field catlog
PERFORM field_catlog.

end-of-SELECTION.

"perform to diuplay vbak and vbap
if p_grid = 'X'.
PERFORM display_vbak_vbap.
else.
PERFORM display_vbak_vbap_list.
ENDIF.

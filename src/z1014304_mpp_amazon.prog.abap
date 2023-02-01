*&---------------------------------------------------------------------*
*& Report Z1014304_MPP_AMAZON
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_mpp_amazon.

DATA : it_cust  TYPE  TABLE OF  z1014304_t_cust,
       wa_cust  TYPE  z1014304_t_cust,

       it_com   TYPE  TABLE OF   z1014304_t_cu_ad,
       wa_com   TYPE   z1014304_t_cu_ad,

       it_purc  TYPE  TABLE OF   Z1014304_T_order,
       wa_purc  TYPE  Z1014304_T_order,

       it_final TYPE  TABLE OF   Z1014304_T_order,
       wa_final TYPE  Z1014304_T_order,

       g_cus_id TYPE z1014304_t_cust-customer_id,

       g_screen TYPE sy-dynnr,

       g_or_id  TYPE Z1014304_T_order-order_ID,

       g_quant  TYPE  z_1014304_de_order_quantity,
       g_price  TYPE  z_1014304_de_order_cost,

       rb1,
       rb2.


SELECTION-SCREEN BEGIN OF SCREEN 50 AS SUBSCREEN.
  SELECT-OPTIONS : s_cust FOR g_cus_id DEFAULT 'CUST01' TO 'CUST10',
                   s_ord FOR g_or_id.
SELECTION-SCREEN END OF SCREEN 50.

g_screen = '50'.



CALL SCREEN 100.



CALL SCREEN 101.

CALL SCREEN 102.

CALL SCREEN 103.










**********************************************************************************************************

*&SPWIZARD: FUNCTION CODES FOR TABSTRIP 'TSW1'
CONSTANTS: BEGIN OF c_tsw1,
             tab1 LIKE sy-ucomm VALUE 'FC1',
             tab2 LIKE sy-ucomm VALUE 'FC2',
             tab3 LIKE sy-ucomm VALUE 'FC3',
           END OF c_tsw1.
*&SPWIZARD: DATA FOR TABSTRIP 'TSW1'
CONTROLS:  tsw1 TYPE TABSTRIP.
DATA: BEGIN OF g_tsw1,
        subscreen   LIKE sy-dynnr,
        prog        LIKE sy-repid VALUE 'Z1014304_MPP_AMAZON',
        pressed_tab LIKE sy-ucomm VALUE c_tsw1-tab3,
      END OF g_tsw1.
DATA:      ok_code LIKE sy-ucomm.

*&SPWIZARD: OUTPUT MODULE FOR TS 'TSW1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: SETS ACTIVE TAB
MODULE tsw1_active_tab_set OUTPUT.
  tsw1-activetab = g_tsw1-pressed_tab.
  CASE g_tsw1-pressed_tab.
    WHEN c_tsw1-tab1.
      g_tsw1-subscreen = '0101'.
    WHEN c_tsw1-tab2.
      g_tsw1-subscreen = '0102'.
    WHEN c_tsw1-tab3.
      g_tsw1-subscreen = '0103'.
    WHEN OTHERS.
*&SPWIZARD:      DO NOTHING
  ENDCASE.
****
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TS 'TSW1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GETS ACTIVE TAB
MODULE tsw1_active_tab_get INPUT.
  ok_code = sy-ucomm.
  CASE ok_code.
    WHEN c_tsw1-tab1.
      g_tsw1-pressed_tab = c_tsw1-tab1.
    WHEN c_tsw1-tab2.
      g_tsw1-pressed_tab = c_tsw1-tab2.
    WHEN c_tsw1-tab3.
      g_tsw1-pressed_tab = c_tsw1-tab3.
    WHEN OTHERS.
*&SPWIZARD:      DO NOTHING
  ENDCASE.
ENDMODULE.
***************************************************************************************************************************

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TB1' ITSELF
CONTROLS: tb1 TYPE TABLEVIEW USING SCREEN 0101.

*&SPWIZARD: LINES OF TABLECONTROL 'TB1'
DATA:     g_tb1_lines  LIKE sy-loopc.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TB1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE tb1_change_tc_attr OUTPUT.
  DESCRIBE TABLE it_cust LINES tb1-lines.
ENDMODULE.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TB1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GET LINES OF TABLECONTROL
MODULE tb1_get_lines OUTPUT.
  g_tb1_lines = sy-loopc.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TB1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: MODIFY TABLE
MODULE tb1_modify INPUT.
  MODIFY it_cust
    FROM wa_cust
    INDEX tb1-current_line.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TB1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: PROCESS USER COMMAND
MODULE tb1_user_command INPUT.
  ok_code = sy-ucomm.
  PERFORM user_ok_tc USING    'TB1'
                              'IT_CUST'
                              ' '
                     CHANGING ok_code.
  sy-ucomm = ok_code.
ENDMODULE.

*----------------------------------------------------------------------*
*   INCLUDE TABLECONTROL_FORMS                                         *
*----------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*&      Form  USER_OK_TC                                               *
*&---------------------------------------------------------------------*
FORM user_ok_tc USING    p_tc_name TYPE dynfnam
                         p_table_name
                         p_mark_name
                CHANGING p_ok      LIKE sy-ucomm.

*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
  DATA: l_ok     TYPE sy-ucomm,
        l_offset TYPE i.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

*&SPWIZARD: Table control specific operations                          *
*&SPWIZARD: evaluate TC name and operations                            *
  SEARCH p_ok FOR p_tc_name.
  IF sy-subrc <> 0.
    EXIT.
  ENDIF.
  l_offset = strlen( p_tc_name ) + 1.
  l_ok = p_ok+l_offset.
*&SPWIZARD: execute general and TC specific operations                 *
  CASE l_ok.
    WHEN 'INSR'.                      "insert row
      PERFORM fcode_insert_row USING    p_tc_name
                                        p_table_name.
      CLEAR p_ok.

    WHEN 'DELE'.                      "delete row
      PERFORM fcode_delete_row USING    p_tc_name
                                        p_table_name
                                        p_mark_name.
      CLEAR p_ok.

    WHEN 'P--' OR                     "top of list
         'P-'  OR                     "previous page
         'P+'  OR                     "next page
         'P++'.                       "bottom of list
      PERFORM compute_scrolling_in_tc USING p_tc_name
                                            l_ok.
      CLEAR p_ok.
*     WHEN 'L--'.                       "total left
*       PERFORM FCODE_TOTAL_LEFT USING P_TC_NAME.
*
*     WHEN 'L-'.                        "column left
*       PERFORM FCODE_COLUMN_LEFT USING P_TC_NAME.
*
*     WHEN 'R+'.                        "column right
*       PERFORM FCODE_COLUMN_RIGHT USING P_TC_NAME.
*
*     WHEN 'R++'.                       "total right
*       PERFORM FCODE_TOTAL_RIGHT USING P_TC_NAME.
*
    WHEN 'MARK'.                      "mark all filled lines
      PERFORM fcode_tc_mark_lines USING p_tc_name
                                        p_table_name
                                        p_mark_name   .
      CLEAR p_ok.

    WHEN 'DMRK'.                      "demark all filled lines
      PERFORM fcode_tc_demark_lines USING p_tc_name
                                          p_table_name
                                          p_mark_name .
      CLEAR p_ok.

*     WHEN 'SASCEND'   OR
*          'SDESCEND'.                  "sort column
*       PERFORM FCODE_SORT_TC USING P_TC_NAME
*                                   l_ok.

  ENDCASE.

ENDFORM.                              " USER_OK_TC

*&---------------------------------------------------------------------*
*&      Form  FCODE_INSERT_ROW                                         *
*&---------------------------------------------------------------------*
FORM fcode_insert_row
              USING    p_tc_name           TYPE dynfnam
                       p_table_name             .

*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
  DATA l_lines_name       LIKE feld-name.
  DATA l_selline          LIKE sy-stepl.
  DATA l_lastline         TYPE i.
  DATA l_line             TYPE i.
  DATA l_table_name       LIKE feld-name.
  FIELD-SYMBOLS <tc>                 TYPE cxtab_control.
  FIELD-SYMBOLS <table>              TYPE STANDARD TABLE.
  FIELD-SYMBOLS <lines>              TYPE i.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

  ASSIGN (p_tc_name) TO <tc>.

*&SPWIZARD: get the table, which belongs to the tc                     *
  CONCATENATE p_table_name '[]' INTO l_table_name. "table body
  ASSIGN (l_table_name) TO <table>.                "not headerline

*&SPWIZARD: get looplines of TableControl                              *
  CONCATENATE 'G_' p_tc_name '_LINES' INTO l_lines_name.
  ASSIGN (l_lines_name) TO <lines>.

*&SPWIZARD: get current line                                           *
  GET CURSOR LINE l_selline.
  IF sy-subrc <> 0.                   " append line to table
    l_selline = <tc>-lines + 1.
*&SPWIZARD: set top line                                               *
    IF l_selline > <lines>.
      <tc>-top_line = l_selline - <lines> + 1 .
    ELSE.
      <tc>-top_line = 1.
    ENDIF.
  ELSE.                               " insert line into table
    l_selline = <tc>-top_line + l_selline - 1.
    l_lastline = <tc>-top_line + <lines> - 1.
  ENDIF.
*&SPWIZARD: set new cursor line                                        *
  l_line = l_selline - <tc>-top_line + 1.

*&SPWIZARD: insert initial line                                        *
  INSERT INITIAL LINE INTO <table> INDEX l_selline.
  <tc>-lines = <tc>-lines + 1.
*&SPWIZARD: set cursor                                                 *
  SET CURSOR 1 l_line.

ENDFORM.                              " FCODE_INSERT_ROW

*&---------------------------------------------------------------------*
*&      Form  FCODE_DELETE_ROW                                         *
*&---------------------------------------------------------------------*
FORM fcode_delete_row
              USING    p_tc_name           TYPE dynfnam
                       p_table_name
                       p_mark_name   .

*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
  DATA l_table_name       LIKE feld-name.

  FIELD-SYMBOLS <tc>         TYPE cxtab_control.
  FIELD-SYMBOLS <table>      TYPE STANDARD TABLE.
  FIELD-SYMBOLS <wa>.
  FIELD-SYMBOLS <mark_field>.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

  ASSIGN (p_tc_name) TO <tc>.

*&SPWIZARD: get the table, which belongs to the tc                     *
  CONCATENATE p_table_name '[]' INTO l_table_name. "table body
  ASSIGN (l_table_name) TO <table>.                "not headerline

*&SPWIZARD: delete marked lines                                        *
  DESCRIBE TABLE <table> LINES <tc>-lines.

  LOOP AT <table> ASSIGNING <wa>.

*&SPWIZARD: access to the component 'FLAG' of the table header         *
    ASSIGN COMPONENT p_mark_name OF STRUCTURE <wa> TO <mark_field>.

    IF <mark_field> = 'X'.
      DELETE <table> INDEX syst-tabix.
      IF sy-subrc = 0.
        <tc>-lines = <tc>-lines - 1.
      ENDIF.
    ENDIF.
  ENDLOOP.

ENDFORM.                              " FCODE_DELETE_ROW

*&---------------------------------------------------------------------*
*&      Form  COMPUTE_SCROLLING_IN_TC
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_TC_NAME  name of tablecontrol
*      -->P_OK       ok code
*----------------------------------------------------------------------*
FORM compute_scrolling_in_tc USING    p_tc_name
                                      p_ok.
*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
  DATA l_tc_new_top_line     TYPE i.
  DATA l_tc_name             LIKE feld-name.
  DATA l_tc_lines_name       LIKE feld-name.
  DATA l_tc_field_name       LIKE feld-name.

  FIELD-SYMBOLS <tc>         TYPE cxtab_control.
  FIELD-SYMBOLS <lines>      TYPE i.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

  ASSIGN (p_tc_name) TO <tc>.
*&SPWIZARD: get looplines of TableControl                              *
  CONCATENATE 'G_' p_tc_name '_LINES' INTO l_tc_lines_name.
  ASSIGN (l_tc_lines_name) TO <lines>.


*&SPWIZARD: is no line filled?                                         *
  IF <tc>-lines = 0.
*&SPWIZARD: yes, ...                                                   *
    l_tc_new_top_line = 1.
  ELSE.
*&SPWIZARD: no, ...                                                    *
    CALL FUNCTION 'SCROLLING_IN_TABLE'
      EXPORTING
        entry_act      = <tc>-top_line
        entry_from     = 1
        entry_to       = <tc>-lines
        last_page_full = 'X'
        loops          = <lines>
        ok_code        = p_ok
        overlapping    = 'X'
      IMPORTING
        entry_new      = l_tc_new_top_line
      EXCEPTIONS
*       NO_ENTRY_OR_PAGE_ACT  = 01
*       NO_ENTRY_TO    = 02
*       NO_OK_CODE_OR_PAGE_GO = 03
        OTHERS         = 0.
  ENDIF.

*&SPWIZARD: get actual tc and column                                   *
  GET CURSOR FIELD l_tc_field_name
             AREA  l_tc_name.

  IF syst-subrc = 0.
    IF l_tc_name = p_tc_name.
*&SPWIZARD: et actual column                                           *
      SET CURSOR FIELD l_tc_field_name LINE 1.
    ENDIF.
  ENDIF.

*&SPWIZARD: set the new top line                                       *
  <tc>-top_line = l_tc_new_top_line.


ENDFORM.                              " COMPUTE_SCROLLING_IN_TC

*&---------------------------------------------------------------------*
*&      Form  FCODE_TC_MARK_LINES
*&---------------------------------------------------------------------*
*       marks all TableControl lines
*----------------------------------------------------------------------*
*      -->P_TC_NAME  name of tablecontrol
*----------------------------------------------------------------------*
FORM fcode_tc_mark_lines USING p_tc_name
                               p_table_name
                               p_mark_name.
*&SPWIZARD: EGIN OF LOCAL DATA-----------------------------------------*
  DATA l_table_name       LIKE feld-name.

  FIELD-SYMBOLS <tc>         TYPE cxtab_control.
  FIELD-SYMBOLS <table>      TYPE STANDARD TABLE.
  FIELD-SYMBOLS <wa>.
  FIELD-SYMBOLS <mark_field>.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

  ASSIGN (p_tc_name) TO <tc>.

*&SPWIZARD: get the table, which belongs to the tc                     *
  CONCATENATE p_table_name '[]' INTO l_table_name. "table body
  ASSIGN (l_table_name) TO <table>.                "not headerline

*&SPWIZARD: mark all filled lines                                      *
  LOOP AT <table> ASSIGNING <wa>.

*&SPWIZARD: access to the component 'FLAG' of the table header         *
    ASSIGN COMPONENT p_mark_name OF STRUCTURE <wa> TO <mark_field>.

    <mark_field> = 'X'.
  ENDLOOP.
ENDFORM.                                          "fcode_tc_mark_lines

*&---------------------------------------------------------------------*
*&      Form  FCODE_TC_DEMARK_LINES
*&---------------------------------------------------------------------*
*       demarks all TableControl lines
*----------------------------------------------------------------------*
*      -->P_TC_NAME  name of tablecontrol
*----------------------------------------------------------------------*
FORM fcode_tc_demark_lines USING p_tc_name
                                 p_table_name
                                 p_mark_name .
*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
  DATA l_table_name       LIKE feld-name.

  FIELD-SYMBOLS <tc>         TYPE cxtab_control.
  FIELD-SYMBOLS <table>      TYPE STANDARD TABLE.
  FIELD-SYMBOLS <wa>.
  FIELD-SYMBOLS <mark_field>.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

  ASSIGN (p_tc_name) TO <tc>.

*&SPWIZARD: get the table, which belongs to the tc                     *
  CONCATENATE p_table_name '[]' INTO l_table_name. "table body
  ASSIGN (l_table_name) TO <table>.                "not headerline

*&SPWIZARD: demark all filled lines                                    *
  LOOP AT <table> ASSIGNING <wa>.

*&SPWIZARD: access to the component 'FLAG' of the table header         *
    ASSIGN COMPONENT p_mark_name OF STRUCTURE <wa> TO <mark_field>.

    <mark_field> = space.
  ENDLOOP.
ENDFORM.                                          "fcode_tc_mark_lines

INCLUDE z1014304_mpp_amazon_user_coi01.

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TB2' ITSELF
CONTROLS: tb2 TYPE TABLEVIEW USING SCREEN 0102.

*&SPWIZARD: LINES OF TABLECONTROL 'TB2'
DATA:     g_tb2_lines  LIKE sy-loopc.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TB2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE tb2_change_tc_attr OUTPUT.
  DESCRIBE TABLE it_com LINES tb2-lines.
ENDMODULE.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TB2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GET LINES OF TABLECONTROL
MODULE tb2_get_lines OUTPUT.
  g_tb2_lines = sy-loopc.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TB2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: MODIFY TABLE
MODULE tb2_modify INPUT.
  MODIFY it_com
    FROM wa_com
    INDEX tb2-current_line.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TB2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: PROCESS USER COMMAND
MODULE tb2_user_command INPUT.
  ok_code = sy-ucomm.
  PERFORM user_ok_tc USING    'TB2'
                              'IT_COM'
                              ' '
                     CHANGING ok_code.
  sy-ucomm = ok_code.
ENDMODULE.

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TB3' ITSELF
CONTROLS: tb3 TYPE TABLEVIEW USING SCREEN 0103.

*&SPWIZARD: LINES OF TABLECONTROL 'TB3'
DATA:     g_tb3_lines  LIKE sy-loopc.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TB3'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE tb3_change_tc_attr OUTPUT.
  DESCRIBE TABLE it_purc LINES tb3-lines.
ENDMODULE.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TB3'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GET LINES OF TABLECONTROL
MODULE tb3_get_lines OUTPUT.
  g_tb3_lines = sy-loopc.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TB3'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: MODIFY TABLE
MODULE tb3_modify INPUT.
  MODIFY it_purc
    FROM wa_purc
    INDEX tb3-current_line.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TB3'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: PROCESS USER COMMAND
MODULE tb3_user_command INPUT.
  ok_code = sy-ucomm.
  PERFORM user_ok_tc USING    'TB3'
                              'IT_PURC'
                              ' '
                     CHANGING ok_code.
  sy-ucomm = ok_code.
ENDMODULE.

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TCW4' ITSELF
CONTROLS: tcw4 TYPE TABLEVIEW USING SCREEN 0200.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TCW4'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE tcw4_change_tc_attr OUTPUT.
  DESCRIBE TABLE it_purc LINES tcw4-lines.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TCW4'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: MODIFY TABLE
MODULE tcw4_modify INPUT.
  MODIFY it_purc
    FROM wa_purc
    INDEX tcw4-current_line.
ENDMODULE.

*&---------------------------------------------------------------------*
*& Report Z1014304_MPP_EKKO_EKPO_MARA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_MPP_EKKO_EKPO_MARA.



TYPES : BEGIN OF ty_ekko,
        EBELN TYPE ekko-ebeln,
        BUKRS TYPE ekko-bukrs,
        BSTYP TYPE ekko-bstyp,
        BSART TYPE ekko-bsart,
        LIFNR TYPE ekko-lifnr,
        END OF ty_ekko,

        BEGIN OF ty_ekpo,
         EBELN TYPE ekpo-ebeln,
         MATNR TYPE ekpo-matnr,
         EMATN TYPE ekpo-ematn,
         BUKRS TYPE ekpo-bukrs,
         WERKS TYPE ekpo-werks,
        END OF ty_ekpo,

        BEGIN OF ty_mara,
         MATNR TYPE mara-matnr,
         ERNAM TYPE mara-ernam,
         LAEDA TYPE mara-laeda,
         AENAM TYPE mara-aenam,
         VPSTA TYPE mara-vpsta,
        END OF ty_mara,

        BEGIN OF ty_lfa,
          LIFNR TYPE lfa1-lifnr,
          LAND1 TYPE lfa1-land1,
          NAME1 TYPE lfa1-name1,
          ORT02 TYPE lfa1-ort02,
          PFACH TYPE lfa1-pfach,
         END OF ty_lfa.

DATA : it_ekko TYPE TABLE of ty_ekko,
       wa_ekko TYPE ty_ekko,

       it_ekpo TYPE table of ty_ekpo,
       wa_ekpo TYPE ty_ekpo,

       it_mara TYPE TABLE OF ty_mara,
       wa_mara TYPE ty_mara,

       it_lfa TYPE TABLE OF ty_lfa,
       wa_lfa TYPE ty_lfa,

       g_ebeln TYPE ekko-ebeln,

       gv_ebeln TYPE char8,
       g_value  TYPE ekko-ebeln,

       gv_matnr type char8,
       g_value1 TYPE ekpo-ebeln,

       gv_lifnr TYPE char8,
       g_value2 TYPE ekko-lifnr,

       rb1,
       rb2.


SELECTION-SCREEN BEGIN OF SCREEN 50 as SUBSCREEN.
  select-OPTIONS s_ebeln for g_ebeln.
SELECTION-SCREEN END OF SCREEN 50.

call SCREEN 100.


*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'ZPF_100'.
  SET TITLEBAR 'ZEKKO'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

CASE sy-ucomm.
  WHEN 'E1' or 'BACK' or 'CANCEL'.
    leave PROGRAM.
  WHEN 'GD1'.
    PERFORM get_ekko.
  WHEN '&IC1'.
    IF RB1 = 'X' .
     get CURSOR FIELD gv_ebeln VALUE g_value.
    PERFORM get_ekpo.
    CALL SCREEN 101.
   ELSEIF RB2 = 'X'.
 " WHEN 'IC1'.
    get CURSOR FIELD gv_lifnr VALUE g_value2.
    PERFORM get_lfa.
    CALL SCREEN 104.
   ENDIF.

ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_ekko
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_ekko .

  SELECT   EBELN
           BUKRS
           BSTYP
           BSART
           LIFNR
    from ekko into TABLE it_ekko WHERE ebeln in s_ebeln.

    IF sy-subrc = 0 AND it_ekko IS NOT INITIAL.
      SORT it_ekko by ebeln.
  ELSE.
    MESSAGE 'Data not found' TYPE 'E'.
  ENDIF.




ENDFORM.

************************************************************************************************************************************

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TC1' ITSELF
CONTROLS: TC1 TYPE TABLEVIEW USING SCREEN 0100.

*&SPWIZARD: LINES OF TABLECONTROL 'TC1'
DATA:     G_TC1_LINES  LIKE SY-LOOPC.

DATA:     OK_CODE LIKE SY-UCOMM.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TC1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE TC1_CHANGE_TC_ATTR OUTPUT.
  DESCRIBE TABLE IT_EKKO LINES TC1-lines.
ENDMODULE.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TC1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GET LINES OF TABLECONTROL
MODULE TC1_GET_LINES OUTPUT.
  G_TC1_LINES = SY-LOOPC.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TC1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: MODIFY TABLE
MODULE TC1_MODIFY INPUT.
  MODIFY IT_EKKO
    FROM WA_EKKO
    INDEX TC1-CURRENT_LINE.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TC1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: PROCESS USER COMMAND
MODULE TC1_USER_COMMAND INPUT.
  OK_CODE = SY-UCOMM.
  PERFORM USER_OK_TC USING    'TC1'
                              'IT_EKKO'
                              ' '
                     CHANGING OK_CODE.
  SY-UCOMM = OK_CODE.
ENDMODULE.

*----------------------------------------------------------------------*
*   INCLUDE TABLECONTROL_FORMS                                         *
*----------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*&      Form  USER_OK_TC                                               *
*&---------------------------------------------------------------------*
 FORM USER_OK_TC USING    P_TC_NAME TYPE DYNFNAM
                          P_TABLE_NAME
                          P_MARK_NAME
                 CHANGING P_OK      LIKE SY-UCOMM.

*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
   DATA: L_OK              TYPE SY-UCOMM,
         L_OFFSET          TYPE I.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

*&SPWIZARD: Table control specific operations                          *
*&SPWIZARD: evaluate TC name and operations                            *
   SEARCH P_OK FOR P_TC_NAME.
   IF SY-SUBRC <> 0.
     EXIT.
   ENDIF.
   L_OFFSET = STRLEN( P_TC_NAME ) + 1.
   L_OK = P_OK+L_OFFSET.
*&SPWIZARD: execute general and TC specific operations                 *
   CASE L_OK.
     WHEN 'INSR'.                      "insert row
       PERFORM FCODE_INSERT_ROW USING    P_TC_NAME
                                         P_TABLE_NAME.
       CLEAR P_OK.

     WHEN 'DELE'.                      "delete row
       PERFORM FCODE_DELETE_ROW USING    P_TC_NAME
                                         P_TABLE_NAME
                                         P_MARK_NAME.
       CLEAR P_OK.

     WHEN 'P--' OR                     "top of list
          'P-'  OR                     "previous page
          'P+'  OR                     "next page
          'P++'.                       "bottom of list
       PERFORM COMPUTE_SCROLLING_IN_TC USING P_TC_NAME
                                             L_OK.
       CLEAR P_OK.
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
       PERFORM FCODE_TC_MARK_LINES USING P_TC_NAME
                                         P_TABLE_NAME
                                         P_MARK_NAME   .
       CLEAR P_OK.

     WHEN 'DMRK'.                      "demark all filled lines
       PERFORM FCODE_TC_DEMARK_LINES USING P_TC_NAME
                                           P_TABLE_NAME
                                           P_MARK_NAME .
       CLEAR P_OK.

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
               USING    P_TC_NAME           TYPE DYNFNAM
                        P_TABLE_NAME             .

*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
   DATA L_LINES_NAME       LIKE FELD-NAME.
   DATA L_SELLINE          LIKE SY-STEPL.
   DATA L_LASTLINE         TYPE I.
   DATA L_LINE             TYPE I.
   DATA L_TABLE_NAME       LIKE FELD-NAME.
   FIELD-SYMBOLS <TC>                 TYPE CXTAB_CONTROL.
   FIELD-SYMBOLS <TABLE>              TYPE STANDARD TABLE.
   FIELD-SYMBOLS <LINES>              TYPE I.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

   ASSIGN (P_TC_NAME) TO <TC>.

*&SPWIZARD: get the table, which belongs to the tc                     *
   CONCATENATE P_TABLE_NAME '[]' INTO L_TABLE_NAME. "table body
   ASSIGN (L_TABLE_NAME) TO <TABLE>.                "not headerline

*&SPWIZARD: get looplines of TableControl                              *
   CONCATENATE 'G_' P_TC_NAME '_LINES' INTO L_LINES_NAME.
   ASSIGN (L_LINES_NAME) TO <LINES>.

*&SPWIZARD: get current line                                           *
   GET CURSOR LINE L_SELLINE.
   IF SY-SUBRC <> 0.                   " append line to table
     L_SELLINE = <TC>-LINES + 1.
*&SPWIZARD: set top line                                               *
     IF L_SELLINE > <LINES>.
       <TC>-TOP_LINE = L_SELLINE - <LINES> + 1 .
     ELSE.
       <TC>-TOP_LINE = 1.
     ENDIF.
   ELSE.                               " insert line into table
     L_SELLINE = <TC>-TOP_LINE + L_SELLINE - 1.
     L_LASTLINE = <TC>-TOP_LINE + <LINES> - 1.
   ENDIF.
*&SPWIZARD: set new cursor line                                        *
   L_LINE = L_SELLINE - <TC>-TOP_LINE + 1.

*&SPWIZARD: insert initial line                                        *
   INSERT INITIAL LINE INTO <TABLE> INDEX L_SELLINE.
   <TC>-LINES = <TC>-LINES + 1.
*&SPWIZARD: set cursor                                                 *
   SET CURSOR 1 L_LINE.

 ENDFORM.                              " FCODE_INSERT_ROW

*&---------------------------------------------------------------------*
*&      Form  FCODE_DELETE_ROW                                         *
*&---------------------------------------------------------------------*
 FORM fcode_delete_row
               USING    P_TC_NAME           TYPE DYNFNAM
                        P_TABLE_NAME
                        P_MARK_NAME   .

*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
   DATA L_TABLE_NAME       LIKE FELD-NAME.

   FIELD-SYMBOLS <TC>         TYPE cxtab_control.
   FIELD-SYMBOLS <TABLE>      TYPE STANDARD TABLE.
   FIELD-SYMBOLS <WA>.
   FIELD-SYMBOLS <MARK_FIELD>.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

   ASSIGN (P_TC_NAME) TO <TC>.

*&SPWIZARD: get the table, which belongs to the tc                     *
   CONCATENATE P_TABLE_NAME '[]' INTO L_TABLE_NAME. "table body
   ASSIGN (L_TABLE_NAME) TO <TABLE>.                "not headerline

*&SPWIZARD: delete marked lines                                        *
   DESCRIBE TABLE <TABLE> LINES <TC>-LINES.

   LOOP AT <TABLE> ASSIGNING <WA>.

*&SPWIZARD: access to the component 'FLAG' of the table header         *
     ASSIGN COMPONENT P_MARK_NAME OF STRUCTURE <WA> TO <MARK_FIELD>.

     IF <MARK_FIELD> = 'X'.
       DELETE <TABLE> INDEX SYST-TABIX.
       IF SY-SUBRC = 0.
         <TC>-LINES = <TC>-LINES - 1.
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
 FORM COMPUTE_SCROLLING_IN_TC USING    P_TC_NAME
                                       P_OK.
*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
   DATA L_TC_NEW_TOP_LINE     TYPE I.
   DATA L_TC_NAME             LIKE FELD-NAME.
   DATA L_TC_LINES_NAME       LIKE FELD-NAME.
   DATA L_TC_FIELD_NAME       LIKE FELD-NAME.

   FIELD-SYMBOLS <TC>         TYPE cxtab_control.
   FIELD-SYMBOLS <LINES>      TYPE I.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

   ASSIGN (P_TC_NAME) TO <TC>.
*&SPWIZARD: get looplines of TableControl                              *
   CONCATENATE 'G_' P_TC_NAME '_LINES' INTO L_TC_LINES_NAME.
   ASSIGN (L_TC_LINES_NAME) TO <LINES>.


*&SPWIZARD: is no line filled?                                         *
   IF <TC>-LINES = 0.
*&SPWIZARD: yes, ...                                                   *
     L_TC_NEW_TOP_LINE = 1.
   ELSE.
*&SPWIZARD: no, ...                                                    *
     CALL FUNCTION 'SCROLLING_IN_TABLE'
          EXPORTING
               ENTRY_ACT             = <TC>-TOP_LINE
               ENTRY_FROM            = 1
               ENTRY_TO              = <TC>-LINES
               LAST_PAGE_FULL        = 'X'
               LOOPS                 = <LINES>
               OK_CODE               = P_OK
               OVERLAPPING           = 'X'
          IMPORTING
               ENTRY_NEW             = L_TC_NEW_TOP_LINE
          EXCEPTIONS
*              NO_ENTRY_OR_PAGE_ACT  = 01
*              NO_ENTRY_TO           = 02
*              NO_OK_CODE_OR_PAGE_GO = 03
               OTHERS                = 0.
   ENDIF.

*&SPWIZARD: get actual tc and column                                   *
   GET CURSOR FIELD L_TC_FIELD_NAME
              AREA  L_TC_NAME.

   IF SYST-SUBRC = 0.
     IF L_TC_NAME = P_TC_NAME.
*&SPWIZARD: et actual column                                           *
       SET CURSOR FIELD L_TC_FIELD_NAME LINE 1.
     ENDIF.
   ENDIF.

*&SPWIZARD: set the new top line                                       *
   <TC>-TOP_LINE = L_TC_NEW_TOP_LINE.


 ENDFORM.                              " COMPUTE_SCROLLING_IN_TC

*&---------------------------------------------------------------------*
*&      Form  FCODE_TC_MARK_LINES
*&---------------------------------------------------------------------*
*       marks all TableControl lines
*----------------------------------------------------------------------*
*      -->P_TC_NAME  name of tablecontrol
*----------------------------------------------------------------------*
FORM FCODE_TC_MARK_LINES USING P_TC_NAME
                               P_TABLE_NAME
                               P_MARK_NAME.
*&SPWIZARD: EGIN OF LOCAL DATA-----------------------------------------*
  DATA L_TABLE_NAME       LIKE FELD-NAME.

  FIELD-SYMBOLS <TC>         TYPE cxtab_control.
  FIELD-SYMBOLS <TABLE>      TYPE STANDARD TABLE.
  FIELD-SYMBOLS <WA>.
  FIELD-SYMBOLS <MARK_FIELD>.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

  ASSIGN (P_TC_NAME) TO <TC>.

*&SPWIZARD: get the table, which belongs to the tc                     *
   CONCATENATE P_TABLE_NAME '[]' INTO L_TABLE_NAME. "table body
   ASSIGN (L_TABLE_NAME) TO <TABLE>.                "not headerline

*&SPWIZARD: mark all filled lines                                      *
  LOOP AT <TABLE> ASSIGNING <WA>.

*&SPWIZARD: access to the component 'FLAG' of the table header         *
     ASSIGN COMPONENT P_MARK_NAME OF STRUCTURE <WA> TO <MARK_FIELD>.

     <MARK_FIELD> = 'X'.
  ENDLOOP.
ENDFORM.                                          "fcode_tc_mark_lines

*&---------------------------------------------------------------------*
*&      Form  FCODE_TC_DEMARK_LINES
*&---------------------------------------------------------------------*
*       demarks all TableControl lines
*----------------------------------------------------------------------*
*      -->P_TC_NAME  name of tablecontrol
*----------------------------------------------------------------------*
FORM FCODE_TC_DEMARK_LINES USING P_TC_NAME
                                 P_TABLE_NAME
                                 P_MARK_NAME .
*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
  DATA L_TABLE_NAME       LIKE FELD-NAME.

  FIELD-SYMBOLS <TC>         TYPE cxtab_control.
  FIELD-SYMBOLS <TABLE>      TYPE STANDARD TABLE.
  FIELD-SYMBOLS <WA>.
  FIELD-SYMBOLS <MARK_FIELD>.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

  ASSIGN (P_TC_NAME) TO <TC>.

*&SPWIZARD: get the table, which belongs to the tc                     *
   CONCATENATE P_TABLE_NAME '[]' INTO L_TABLE_NAME. "table body
   ASSIGN (L_TABLE_NAME) TO <TABLE>.                "not headerline

*&SPWIZARD: demark all filled lines                                    *
  LOOP AT <TABLE> ASSIGNING <WA>.

*&SPWIZARD: access to the component 'FLAG' of the table header         *
     ASSIGN COMPONENT P_MARK_NAME OF STRUCTURE <WA> TO <MARK_FIELD>.

     <MARK_FIELD> = SPACE.
  ENDLOOP.
ENDFORM.                                          "fcode_tc_mark_lines

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TC2' ITSELF
CONTROLS: TC2 TYPE TABLEVIEW USING SCREEN 0201.

*&SPWIZARD: LINES OF TABLECONTROL 'TC2'
DATA:     G_TC2_LINES  LIKE SY-LOOPC.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TC2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE TC2_CHANGE_TC_ATTR OUTPUT.
  DESCRIBE TABLE IT_EKPO LINES TC2-lines.
ENDMODULE.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TC2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GET LINES OF TABLECONTROL
MODULE TC2_GET_LINES OUTPUT.
  G_TC2_LINES = SY-LOOPC.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TC2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: MODIFY TABLE
MODULE TC2_MODIFY INPUT.
  MODIFY IT_EKPO
    FROM WA_EKPO
    INDEX TC2-CURRENT_LINE.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TC2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: PROCESS USER COMMAND
MODULE TC2_USER_COMMAND INPUT.
  OK_CODE = SY-UCOMM.
  PERFORM USER_OK_TC USING    'TC2'
                              'IT_EKPO'
                              ' '
                     CHANGING OK_CODE.
  SY-UCOMM = OK_CODE.
ENDMODULE.

***********************************************************************************************************************************
*&---------------------------------------------------------------------*
*& Form get_ekpo
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_ekpo .

SELECT EBELN
       MATNR
       EMATN
       BUKRS
       WERKS
  from ekpo INTO TABLE it_ekpo WHERE ebeln = g_value.

    IF sy-subrc = 0 AND it_ekpo IS NOT INITIAL.
      SORT it_ekpo by ebeln.
  ELSE.
    MESSAGE 'Data not found' TYPE 'E'.
  ENDIF.





ENDFORM.
**************************************************************************************************************************************

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TAB2' ITSELF
CONTROLS: TAB2 TYPE TABLEVIEW USING SCREEN 0101.

*&SPWIZARD: LINES OF TABLECONTROL 'TAB2'
DATA:     G_TAB2_LINES  LIKE SY-LOOPC.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TAB2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE TAB2_CHANGE_TC_ATTR OUTPUT.
  DESCRIBE TABLE IT_EKPO LINES TAB2-lines.
ENDMODULE.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TAB2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GET LINES OF TABLECONTROL
MODULE TAB2_GET_LINES OUTPUT.
  G_TAB2_LINES = SY-LOOPC.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TAB2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: MODIFY TABLE
MODULE TAB2_MODIFY INPUT.
  MODIFY IT_EKPO
    FROM WA_EKPO
    INDEX TAB2-CURRENT_LINE.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TAB2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: PROCESS USER COMMAND
MODULE TAB2_USER_COMMAND INPUT.
  OK_CODE = SY-UCOMM.
  PERFORM USER_OK_TC USING    'TAB2'
                              'IT_EKPO'
                              ' '
                     CHANGING OK_CODE.
  SY-UCOMM = OK_CODE.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0101 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0101 OUTPUT.
 SET PF-STATUS 'ZPF_201'.
 SET TITLEBAR 'ZEKPO'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0101  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0101 INPUT.
  CASE sy-ucomm.
  WHEN 'E2' or 'BACK' or 'CANCEL'.
    leave TO SCREEN 100.
   WHEN '&IC1'.
     get CURSOR  FIELD gv_matnr VALUE g_value1.
     PERFORM get_mara.
    call SCREEN 103.
*	WHEN .
*	WHEN OTHERS.
ENDCASE.

ENDMODULE.

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TAB3' ITSELF
CONTROLS: TAB3 TYPE TABLEVIEW USING SCREEN 0103.

*&SPWIZARD: LINES OF TABLECONTROL 'TAB3'
DATA:     G_TAB3_LINES  LIKE SY-LOOPC.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TAB3'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE TAB3_CHANGE_TC_ATTR OUTPUT.
  DESCRIBE TABLE IT_MARA LINES TAB3-lines.
ENDMODULE.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TAB3'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GET LINES OF TABLECONTROL
MODULE TAB3_GET_LINES OUTPUT.
  G_TAB3_LINES = SY-LOOPC.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TAB3'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: MODIFY TABLE
MODULE TAB3_MODIFY INPUT.
  MODIFY IT_MARA
    FROM WA_MARA
    INDEX TAB3-CURRENT_LINE.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TAB3'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: PROCESS USER COMMAND
MODULE TAB3_USER_COMMAND INPUT.
  OK_CODE = SY-UCOMM.
  PERFORM USER_OK_TC USING    'TAB3'
                              'IT_MARA'
                              ' '
                     CHANGING OK_CODE.
  SY-UCOMM = OK_CODE.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_mara
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*

***********************************************************************************************************************************

FORM get_mara .

SELECT  MATNR
        ERNAM
        LAEDA
        AENAM
        VPSTA

  FROM mara INTO TABLE it_mara WHERE matnr = g_value1.
   IF sy-subrc = 0 AND it_mara IS NOT INITIAL.
      SORT it_mara by matnr.
  ELSE.
    MESSAGE 'Data not found' TYPE 'E'.
  ENDIF.



ENDFORM.
*&---------------------------------------------------------------------*
*& Module STATUS_0103 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0103 OUTPUT.
 SET PF-STATUS 'ZPF_103'.
 SET TITLEBAR 'ZMARA'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0103  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0103 INPUT.

CASE sy-ucomm.
  WHEN 'E3' or 'CANCEL' or 'BACK' .
    leave to SCREEN 100.

ENDCASE.



ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_lfa
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_lfa .

SELECT  LIFNR
        LAND1
        NAME1
        ORT02
        PFACH
  from lfa1 INTO TABLE it_lfa WHERE lifnr = g_value2.

   IF sy-subrc = 0 AND it_lfa IS NOT INITIAL.
      SORT it_lfa by lifnr.
  ELSE.
    MESSAGE 'Data not found' TYPE 'E'.
  ENDIF.


ENDFORM.
***********************************************************************************************************************************
*&SPWIZARD: DECLARATION OF TABLECONTROL 'TAB4' ITSELF
CONTROLS: TAB4 TYPE TABLEVIEW USING SCREEN 0104.

*&SPWIZARD: LINES OF TABLECONTROL 'TAB4'
DATA:     G_TAB4_LINES  LIKE SY-LOOPC.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TAB4'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE TAB4_CHANGE_TC_ATTR OUTPUT.
  DESCRIBE TABLE IT_LFA LINES TAB4-lines.
ENDMODULE.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TAB4'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GET LINES OF TABLECONTROL
MODULE TAB4_GET_LINES OUTPUT.
  G_TAB4_LINES = SY-LOOPC.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TAB4'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: MODIFY TABLE
MODULE TAB4_MODIFY INPUT.
  MODIFY IT_LFA
    FROM WA_LFA
    INDEX TAB4-CURRENT_LINE.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TAB4'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: PROCESS USER COMMAND
MODULE TAB4_USER_COMMAND INPUT.
  OK_CODE = SY-UCOMM.
  PERFORM USER_OK_TC USING    'TAB4'
                              'IT_LFA'
                              ' '
                     CHANGING OK_CODE.
  SY-UCOMM = OK_CODE.
ENDMODULE.
*********************************************************************************************************************************
*&---------------------------------------------------------------------*
*& Module STATUS_0104 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0104 OUTPUT.
 SET PF-STATUS 'ZPF_104'.
 SET TITLEBAR 'ZLFA'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0104  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0104 INPUT.


CASE sy-ucomm.
  WHEN 'E4' or 'CANCEL' or 'BACK' .
    LEAVE TO SCREEN 100.
ENDCASE.


ENDMODULE.

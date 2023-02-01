*&---------------------------------------------------------------------*
*& Report Z1014304_MATERAIL_MASTER_IN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_materail_master_in.

TYPES :
  "Structure to Hold material master Details
  BEGIN OF ty_mat,
    matnr TYPE mara-matnr, "Material Number
    mtart TYPE mara-mtart, "Material Type
    mbrsh TYPE mara-mbrsh, "industrial Sector
    maktx TYPE makt-maktx, "Descritpion
    spras TYPE makt-spras, "Language
  END OF ty_mat.

DATA :
  "internal table and work area declartions for material master
  it_mat  TYPE TABLE OF ty_mat,
  wa_mat  TYPE ty_mat,
  "global variable declartion for matnr
  g_matnr TYPE mara-matnr.
"selection screen
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(25) in1.
  SELECT-OPTIONS s_matnr FOR g_matnr.
SELECTION-SCREEN END OF BLOCK b1.

"initialzing values for title and comment

INITIALIZATION.
  t1 = ' To display Material Master Details '.
  in1 = ' Enter Material Number '.
  s_matnr = ' Material Numaber '.


START-OF-SELECTION.
  "select query to fetch data from database table
  SELECT  mara~matnr
          mara~mtart
          mara~mbrsh
          makt~maktx
          makt~spras
     INTO TABLE it_mat
     FROM mara INNER JOIN makt
       ON mara~matnr = makt~matnr
    WHERE mara~matnr IN s_matnr.
    "Checking above statement
  IF sy-subrc <> 0 AND it_mat IS  INITIAL.
    MESSAGE 'Data Not Found' TYPE 'E'.
    "sorting internal table by matnr
    SORT it_mat BY matnr.
  ELSE.

    FORMAT COLOR 3 on.
    WRITE : / sy-uline+0(130),
            /1 sy-vline,
             2 'Material Number'    , 29 sy-vline,
             30'Material Type'      , 59 sy-vline,
             60'Industrial Sector'  , 79 sy-vline,
             80'Description'        , 120 sy-vline,
            122'Language'           , 130 sy-vline,
            / sy-uline+0(130).
    FORMAT COLOR 3 off.

    LOOP AT it_mat INTO wa_mat.

      WRITE :  /1 sy-vline,
               2 wa_mat-matnr, 29 sy-vline,
               30 wa_mat-mtart,59 sy-vline,
               60 wa_mat-mbrsh,79 sy-vline,
               80 wa_mat-maktx,120 sy-vline,
               122 wa_mat-spras,130 sy-vline,
               / sy-uline+0(130).
    ENDLOOP.                             "loop at it_mat...
  ENDIF.

TOP-OF-PAGE.
  WRITE : / 'Material Master Details' COLOR 7.

END-OF-PAGE.
  WRITE : / 'The END'.

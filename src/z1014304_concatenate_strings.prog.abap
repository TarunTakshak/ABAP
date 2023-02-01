*&---------------------------------------------------------------------*
*& Report Z1014304_CONCATENATE_STRINGS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_concatenate_strings.

TYPES :
"structure holds st_string
        BEGIN OF st_string,
          string1 TYPE string,
          string2 TYPE string,
          string3 TYPE string,
          string4 TYPE string,
        END OF st_string.
DATA :
"internal table and workarea holds st_string
       it_string TYPE TABLE OF st_string,
       wa_string TYPE st_string,
       final     TYPE string.

wa_string-string1 = 'welcome'.
wa_string-string2 = 'to'.
wa_string-string3 = 'sap'.
wa_string-string4 = 'training'.

APPEND wa_string TO it_string.
CLEAR wa_string.

LOOP AT it_string INTO wa_string.
  CONCATENATE wa_string-string1 wa_string-string2 wa_string-string3 wa_string-string4 INTO final SEPARATED BY space.
  WRITE :/ 'line order - ',final.
ENDLOOP.                               "LOOP AT it_string
SORT it_string DESCENDING.
LOOP AT it_string INTO wa_string.
 " CONCATENATE wa_string-string1 wa_string-string2 wa_string-string3 wa_string-string4 INTO final SEPARATED BY space.
  WRITE :/ 'Ascending order -',wa_string-string1,
          wa_string-string2,
          wa_string-string3,
          wa_string-string4.
ENDLOOP.                               "LOOP AT it_string
LOOP AT it_string INTO wa_string.
  CONCATENATE  wa_string-string1 wa_string-string2 wa_string-string3 wa_string-string4 INTO final SEPARATED BY space.
  WRITE :/ 'descending order -',final.
ENDLOOP.                               "LOOP AT it_string
LOOP AT it_string INTO wa_string.
  CONCATENATE wa_string-string4 wa_string-string3 wa_string-string2 wa_string-string1 INTO final SEPARATED BY space.
  WRITE :/ 'Reverse order -',final.
ENDLOOP.                               "LOOP AT it_string

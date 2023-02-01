*&---------------------------------------------------------------------*
*& Include          Z1014304_ALV_MARA_STR
*&---------------------------------------------------------------------*

TYPE-POOLS: slis.

TYPES :
"structure declartion for mara details
         BEGIN OF ty_mara,
          matnr TYPE mara-matnr,
          ernam TYPE mara-ernam,
          laeda TYPE mara-laeda,
          aenam TYPE mara-aenam,
          vpsta TYPE mara-vpsta,
        END OF ty_mara.

"parameter holds Material Number value
PARAMETERS : p_matnr TYPE mara-matnr.


DATA :
"Internal Table and Work Area declartion for mara
       it_mara TYPE TABLE OF ty_mara,
       wa_mara TYPE ty_mara,
"Internal Table and Work Area declartion for Slis
       it_fcat TYPE slis_t_fieldcat_alv,
       wa_fcat TYPE slis_fieldcat_alv.

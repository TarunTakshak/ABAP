*&---------------------------------------------------------------------*
*& Include          Z1014304_ALV_ALL_ENTRIES_STR
*&---------------------------------------------------------------------*
TYPES :
*structure declation to hold vbak and vbap details
        BEGIN OF ty_vbak,
        VBELN TYPE vbak-vbeln,         "Sales Document
        ERDAT TYPE vbak-erdat,         "Date on which the record was created
        ERZET TYPE vbak-erzet,         "Entry time
        ERNAM TYPE vbak-ernam,         "Name of Person
        END OF ty_vbak.
TYPES :
        BEGIN OF ty_vbap,
        vbeln TYPE vbap-vbeln,
        POSNR TYPE vbap-posnr,         "Sales Document Item
        MATNR TYPE vbap-matnr,         "Material Number
        MATWA TYPE vbap-matwa,         "Material Entered
        NETWR TYPE vbap-NETWR,         "Net Value of the Order Item
        END OF ty_vbap.


TYPES :
*structure declation to hold vbak and vbap details
        BEGIN OF ty_final,
        VBELN TYPE vbak-vbeln,         "Sales Document
        ERDAT TYPE vbak-erdat,         "Date on which the record was created
        ERZET TYPE vbak-erzet,         "Entry time
        ERNAM TYPE vbak-ernam,         "Name of Person
        POSNR TYPE vbap-posnr,         "Sales Document Item
        MATNR TYPE vbap-matnr,         "Material Number
        MATWA TYPE vbap-matwa,         "Material Entered
        NETWR TYPE vbap-NETWR,         "Net Value of the Order Item
        END OF ty_final.



 data : it_vbak TYPE TABLE Of ty_vbak,
        wa_vbak TYPE ty_vbak,

        it_vbap TYPE TABLE OF ty_vbap,
        wa_vbap TYPE ty_vbap,

        it_final TYPE TABLE of ty_final,
        wa_final TYPE ty_final,

        it_fcat TYPE slis_t_fieldcat_alv,
        wa_fcat TYPE slis_fieldcat_alv,

        it_sort TYPE slis_t_sortinfo_alv,
        wa_sort TYPE slis_sortinfo_alv,

        g_vbeln TYPE vbeln.

 SELECT-OPTIONS : s_vbeln for g_vbeln.

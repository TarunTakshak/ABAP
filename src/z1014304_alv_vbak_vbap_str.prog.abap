*&---------------------------------------------------------------------*
*& Include          Z1014304_ALV_VBAK_VBAP_STR
*&---------------------------------------------------------------------*


TYPE-pools : slis.

TYPES :
*structure declation to hold vbak and vbap details
        BEGIN OF ty_akap,
        VBELN TYPE vbak-vbeln,         "Sales Document
        ERDAT TYPE vbak-erdat,         "Date on which the record was created
        ERZET TYPE vbak-erzet,         "Entry time
        ERNAM TYPE vbak-ernam,         "Name of Person
        POSNR TYPE vbap-posnr,         "Sales Document Item
        MATNR TYPE vbap-matnr,         "Material Number
        MATWA TYPE vbap-matwa,         "Material Entered
        PMATN TYPE vbap-pmatn,         "Pricing Reference Material
        NETWR TYPE vbap-NETWR,         "Net Value of the Order Item
        END OF ty_akap.



DATA :
"internal table and work area declartion to hold vbap and vbak details
       it_akap TYPE TABLE of ty_akap,
       wa_akap TYPE ty_akap,
"internal table and work area declartion to hold slis
       it_fcat TYPE slis_t_fieldcat_alv,
       wa_fcat TYPE slis_fieldcat_alv,
 "internal table and work area declartion to hold sort
       it_sort TYPE slis_t_sortinfo_alv,
       wa_sort TYPE slis_sortinfo_alv,
"global variable delcartion for vbeln
       g_vbeln TYPE vbeln.

"select-option for g_vbeln
 select-OPTIONS s_vbeln for g_vbeln.

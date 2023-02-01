*&---------------------------------------------------------------------*
*& Include          Z1014304_ALV_INTER_AKAP_STR
*&---------------------------------------------------------------------*

TYPES : BEGIN OF ty_vbak,
          vbeln TYPE vbak-vbeln,
          erdat TYPE vbak-erdat,
          erzet TYPE vbak-erzet,
          ernam TYPE vbak-ernam,
        END OF ty_vbak,


        BEGIN OF ty_vbap,
          vbeln TYPE vbap-vbeln,
          posnr TYPE vbap-posnr,
          matnr TYPE vbap-matnr,
          matwa TYPE vbap-matwa,
        END OF ty_vbap,


        BEGIN OF ty_mara,
          matnr TYPE mara-matnr,
          laeda TYPE mara-laeda,
          aenam TYPE mara-aenam,
          vpsta TYPE mara-vpsta,
        END OF ty_mara.


  data : it_vbak TYPE TABLE of ty_vbak,
         wa_vbak TYPE ty_vbak,

         it_vbap TYPE TABLE of ty_vbap,
         wa_vbap TYPE ty_vbap,

         it_mara TYPE TABLE of ty_mara,
         wa_mara TYPE ty_mara,

         it_fcat TYPE slis_t_fieldcat_alv,
         wa_fcat TYPE slis_fieldcat_alv,


         it_fcat1 TYPE slis_t_fieldcat_alv,
         wa_fcat1 TYPE slis_fieldcat_alv,


         it_fcat2 TYPE slis_t_fieldcat_alv,
         wa_fcat2 TYPE slis_fieldcat_alv,

         it_header TYPE slis_t_listheader,
         wa_header TYPE slis_listheader,

         gs_layout TYPE slis_layout_alv,

         g_vbeln TYPE vbak-vbeln.


SELECT-OPTIONS : s_vbeln for g_vbeln.

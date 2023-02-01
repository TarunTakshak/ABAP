*&---------------------------------------------------------------------*
*& Include          Z1014304_FM_BSAD_STR
*&---------------------------------------------------------------------*
DATA : it_bsad type Z1014304_TT_BSAD,
       wa_bsad like LINE OF it_bsad,

       it_fcat TYPE slis_t_fieldcat_alv,
       wa_fcat TYPE slis_fieldcat_alv,

       it_header TYPE slis_t_listheader,
       wa_header TYPE slis_listheader,

        GS_LAYOUT TYPE SLIS_LAYOUT_ALV,

       g_kunnr type bsad-kunnr.

 select-options : s_kunnr for g_kunnr.

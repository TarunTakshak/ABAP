*&---------------------------------------------------------------------*
*& Include          Z1014304_ALV_VBRK_VBRP_STR
*&---------------------------------------------------------------------*

TYPES:
"structure to hold vbrk details
       BEGIN OF ty_vbrk,
         vbeln TYPE vbrk-vbeln,
         fkart TYPE vbrk-fkart,
         fktyp TYPE vbrk-fktyp,
         vbtyp TYPE vbrk-vbtyp,
         waerk TYPE vbrk-waerk,
       END OF ty_vbrk,
"structure to hold vbrp details
       BEGIN OF ty_vbrp,
         vbeln TYPE vbrp-vbeln,
         AUBEL TYPE vbrp-aubel,
         posnr TYPE vbrp-posnr,
         uepos TYPE vbrp-uepos,
         fkimg TYPE vbrp-fkimg,
         vrkme TYPE vbrp-vrkme,
       END OF ty_vbrp,
"structure to hold vbrk and vbrp details
       BEGIN OF ty_final,
         vbeln TYPE vbrk-vbeln,
         fkart TYPE vbrk-fkart,
         fktyp TYPE vbrk-fktyp,
         vbtyp TYPE vbrk-vbtyp,
         AUBEL TYPE vbrp-aubel,
         waerk TYPE vbrk-waerk,
         posnr TYPE vbrp-posnr,
         uepos TYPE vbrp-uepos,
         fkimg TYPE vbrp-fkimg,
         vrkme TYPE vbrp-vrkme,
       END OF ty_final.


DATA :
"internal table and workarea to hold vbrk details
       it_vbrk   TYPE TABLE OF ty_vbrk,
       wa_vbrk   TYPE ty_vbrk,
"internal table and workarea to hold vbrp details
       it_vbrp   TYPE TABLE OF ty_vbrp,
       wa_vbrp   TYPE ty_vbrp,
"internal table and workarea to hold vbrk and vbrp details
       it_final  TYPE TABLE OF ty_final,
       wa_final  TYPE ty_final,
"internal table and workarea for field-catlog
       it_fcat   TYPE slis_t_fieldcat_alv,
       wa_fcat   TYPE slis_fieldcat_alv,
"internal table and workarea for header
       it_header TYPE slis_t_listheader,
       wa_header TYPE slis_listheader,
"global variable declartion for layout design
       gs_layout TYPE slis_layout_alv,
"global variable declartion for vbeln
       g_vbeln   TYPE vbrk-vbeln.

"selection design for billing document
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
SELECTION-SCREEN COMMENT 2(35) in1.
SELECT-OPTIONS s_vbeln FOR g_vbeln.
SELECTION-SCREEN END  OF BLOCK b1.

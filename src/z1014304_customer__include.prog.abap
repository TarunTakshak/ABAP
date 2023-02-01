*&---------------------------------------------------------------------*
*& Include Z1014304_CUSTOMER__INCLUDE
*&---------------------------------------------------------------------*
" 1 customer details
TYPES : BEGIN OF ty_cust,
          kunnr TYPE kna1-kunnr,
          name1 TYPE kna1-name1,
          land1 TYPE kna1-land1,
          ort01 TYPE kna1-ort01,
          vbeln TYPE vbak-vbeln,
          erdat TYPE vbak-erdat,
          erzet TYPE vbak-erzet,
          ernam TYPE vbak-ernam,
          vgbe1 TYPE lips-vgbel,
          pstyv TYPE lips-pstyv,
          posnr TYPE lips-posnr,
          uepos TYPE vbrp-uepos,
          fkimg TYPE vbrp-fkimg,
        END OF ty_cust.

DATA : it_cust TYPE TABLE OF ty_cust,
       wa_cust TYPE ty_cust.

"2 customer details


TYPES : BEGIN OF ty_kna1,
          kunnr TYPE kna1-kunnr,
          name1 TYPE kna1-name1,
          land1 TYPE kna1-land1,
          ort01 TYPE kna1-ort01,
        END OF ty_kna1.

TYPES : BEGIN OF ty_vbak,
          vbeln TYPE vbak-vbeln,
          erdat TYPE vbak-erdat,
          erzet TYPE vbak-erzet,
          ernam TYPE vbak-ernam,
        END OF ty_vbak.

TYPES : BEGIN OF ty_lips,
          vgbe1 TYPE lips-vgbel,
          pstyv TYPE lips-pstyv,
          posnr TYPE lips-posnr,
        END OF ty_lips.

TYPES : BEGIN OF ty_vbrp,
          uepos TYPE vbrp-uepos,
          fkimg TYPE vbrp-fkimg,
        END OF ty_vbrp.

DATA : it_kna1 TYPE TABLE OF ty_kna1,
       wa_kna1 TYPE ty_kna1,
       it_vbak TYPE TABLE OF ty_vbak,
       wa_vbak TYPE ty_vbak,
       it_lips TYPE TABLE OF ty_lips,
       wa_lips TYPE ty_lips,
       it_vbrp TYPE TABLE OF ty_vbrp,
       wa_vbrp TYPE ty_vbrp,
       g_kunnr TYPE kunnr.

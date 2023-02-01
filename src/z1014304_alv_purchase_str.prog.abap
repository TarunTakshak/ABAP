
type-pools: slis.
TYPES : BEGIN OF ty_ekko,
          ebeln TYPE ekko-ebeln,
          bukrs TYPE ekko-bukrs,
          bstyp TYPE ekko-bstyp,
          bsart TYPE ekko-bsart,
          aedat TYPE ekko-aedat,
          lifnr TYPE ekko-lifnr,
        END OF ty_ekko,

        BEGIN OF ty_ekpo,
          ebeln TYPE ekpo-ebeln,
          ebelp TYPE ekpo-ebelp,
          menge TYPE ekpo-menge,
          meins TYPE ekpo-meins,
          peinh TYPE ekpo-peinh,
          netpr TYPE ekpo-netpr,
          adrn2 TYPE ekpo-adrn2,
        END OF ty_ekpo,

        BEGIN OF ty_final,
          ebeln TYPE ekko-ebeln,
          bukrs TYPE ekko-bukrs,
          bstyp TYPE ekko-bstyp,
          bsart TYPE ekko-bsart,
          aedat TYPE ekko-aedat,
          lifnr TYPE ekko-lifnr,
          ebelp TYPE ekpo-ebelp,
          menge TYPE ekpo-menge,
          meins TYPE ekpo-meins,
          peinh TYPE ekpo-peinh,
          netpr TYPE ekpo-netpr,
          adrn2 TYPE ekpo-adrn2,
          colour TYPE char5,
        END OF ty_final,

        BEGIN OF ty_lfa,
          LIFNR TYPE lfa1-lifnr,
          LAND1 TYPE lfa1-land1,
          NAME1 TYPE lfa1-name1,
          NAME2 TYPE lfa1-name2,
          END OF ty_lfa.

  DATA : it_ekko TYPE TABLE of ty_ekko,
         wa_ekko TYPE ty_ekko,

         it_ekpo TYPE TABLE of ty_ekpo,
         wa_ekpo TYPE ty_ekpo,

         it_final TYPE TABLE of ty_final,
         wa_final TYPE ty_final,

         it_lfa TYPE TABLE of ty_lfa,
         wa_lfa TYPE ty_lfa,

         it_fcat TYPE  slis_t_fieldcat_alv,
         wa_fcat TYPE slis_fieldcat_alv,

         it_header TYPE  slis_t_listheader,
         wa_header TYPE slis_listheader,

         it_sort TYPE  slis_t_sortinfo_alv,
         wa_sort TYPE slis_sortinfo_alv,

         it_event TYPE slis_t_event,
         wa_event like LINE OF it_event,

         gs_layout TYPE slis_layout_alv,

         g_ebeln TYPE ekko-ebeln.

SELECTION-SCREEN BEGIN OF BLOCK b1.
  SELECTION-SCREEN COMMENT 2(20) in1.
SELECT-OPTIONS s_ebeln for g_ebeln.
SELECTION-SCREEN END OF BLOCK b1.

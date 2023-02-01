*&---------------------------------------------------------------------*
*& Report Z1014304_CAR_BRANDS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_CAR_BRANDS.

TYPES :
    "Structure to hold car brands
       BEGIN OF st_car,
          brand TYPE string,
          top1  TYPE string,
          top2  TYPE string,
          top3  TYPE string,
       END OF st_car.

DATA :
     "internal table and workarea to hold car brands
       wa_car TYPE st_car,
       it_car TYPE TABLE OF st_car.

wa_car-brand = 'Maruthi'.
wa_car-top1  = 'ALTO'.
wa_car-top2  = 'Swift'.
wa_car-top3  = 'Dzire'.
APPEND wa_car TO it_car.

wa_car-brand = 'Hyundai'.
wa_car-top1  = 'Eon'.
wa_car-top2  = 'Grandi10'.
wa_car-top3  = 'i20'.
APPEND wa_car TO it_car.

wa_car-brand = 'Tata'.
wa_car-top1  = 'Tiago'.
wa_car-top2  = 'Altroz'.
wa_car-top3  = 'Nexon'.
APPEND wa_car TO it_car.

wa_car-brand = 'Toyota'.
wa_car-top1  = 'Fortuner'.
wa_car-top2  = 'Innova'.
wa_car-top3  = 'Glanza'.
APPEND wa_car TO it_car.

WRITE :/ sy-uline+0(40).

WRITE : /1 sy-vline,
         3  'brand',10 sy-vline,
         12 'top1', 20 sy-vline,
         23 'top2', 30 sy-vline,
         33 'top3', 40 sy-vline.

WRITE :/ sy-uline+0(40).

LOOP AT it_car INTO wa_car.

  WRITE : /1 sy-vline,
           2  wa_car-brand,10 sy-vline,
           12 wa_car-top1, 20 sy-vline,
           23 wa_car-top2, 30 sy-vline,
           33 wa_car-top3, 40 sy-vline,
           / sy-uline+0(40).

ENDLOOP.                               "loop at it_car...

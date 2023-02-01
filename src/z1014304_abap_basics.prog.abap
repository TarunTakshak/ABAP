
*&---------------------------------------------------------------------*
*& Report Z1014304_ABAP_BASICS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_abap_basics.

"Question 1

PARAMETERS : Business TYPE string.
*
TYPES : BEGIN OF st_customer,
          land1 TYPE kna1-land1,
          ort01 TYPE kna1-ort01,
          vbeln TYPE vbak-vbeln,
          erdat TYPE vbak-erdat,
        END OF st_customer.

DATA : wa_cust TYPE st_customer,
       it_cust TYPE TABLE OF st_customer.


TYPES : BEGIN OF st_vendor,
          lifnr TYPE lfa1-lifnr,
          land1 TYPE lfa1-land1,
          bukrs TYPE ekko-bukrs,
          waers TYPE ekko-waers,
        END OF st_vendor.

DATA : wa_vend TYPE st_vendor,
       it_vend TYPE TABLE OF st_vendor.

SELECT  kna1~land1
        kna1~ort01
        vbak~vbeln
        vbak~erdat
INTO TABLE it_cust FROM kna1 INNER JOIN vbak ON kna1~kunnr = vbak~kunnr WHERE kna1~kunnr = Business.

SELECT  lfa1~lifnr
        lfa1~land1
        ekko~bukrs
        ekko~waers
 INTO TABLE it_vend FROM lfa1 INNER JOIN ekko ON  lfa1~lifnr = ekko~lifnr where lfa1~lifnr = Business.

if it_cust IS NOT INITIAL.
  LOOP AT it_cust INTO wa_cust.
    WRITE: / wa_cust-land1,
             wa_cust-ort01,
             wa_cust-vbeln,
             wa_cust-erdat.
  ENDLOOP.

ELSEIF it_vend IS NOT INITIAL.
  LOOP AT it_vend INTO wa_vend.
    WRITE: / wa_vend-lifnr,
             wa_vend-land1,
             wa_vend-bukrs,
             wa_vend-waers.

  ENDLOOP.
ELSE.
  MESSAGE TEXT-001 TYPE 'E'.
ENDIF.



"question 2...........
*
*TYPES : BEGIN OF st_car,
*          brand TYPE string,
*          top1  TYPE string,
*          top2  TYPE string,
*          top3  TYPE string,
*        END OF st_car.
*
*DATA : wa_car TYPE st_car,
*       it_car TYPE TABLE OF st_car.
*
*wa_car-brand = 'Maruthi'.
*wa_car-top1  = 'ALTO'.
*wa_car-top2  = 'Swift'.
*wa_car-top3  = 'Dzire'.
*APPEND wa_car TO it_car.
*
*wa_car-brand = 'Hyundai'.
*wa_car-top1  = 'Eon'.
*wa_car-top2  = 'Grandi10'.
*wa_car-top3  = 'i20'.
*APPEND wa_car TO it_car.
*
*wa_car-brand = 'Tata'.
*wa_car-top1  = 'Tiago'.
*wa_car-top2  = 'Altroz'.
*wa_car-top3  = 'Nexon'.
*APPEND wa_car TO it_car.
*
*wa_car-brand = 'Toyota'.
*wa_car-top1  = 'Fortuner'.
*wa_car-top2  = 'Innova'.
*wa_car-top3  = 'Glanza'.
*APPEND wa_car TO it_car.
*
*WRITE :/ sy-uline+0(40).
*
*WRITE : /1 sy-vline,
*         3  'brand', 10 sy-vline,
*         12 'top1', 20 sy-vline,
*         23 'top2', 30 sy-vline,
*         33 'top3', 40 sy-vline.
*
*WRITE :/ sy-uline+0(40).
*
*LOOP AT it_car INTO wa_car.
*
*  WRITE : /1 sy-vline,
*           2  wa_car-brand, 10 sy-vline,
*           12 wa_car-top1, 20 sy-vline,
*           23 wa_car-top2, 30 sy-vline,
*           33 wa_car-top3, 40 sy-vline,
*           / sy-uline+0(40).
*
*ENDLOOP.

"question 4....

*PARAMETERS : a      TYPE i,
*             b      TYPE i,
*             arth   TYPE char3,
*             result TYPE i.
*DATA final TYPE i.
*IF arth = 'ADD'.
*  final = a + b.
*ELSEIF arth EQ 'sub'.
*  final = a - b.
*ELSEIF arth EQ 'MUL'.
*  final = a * b.
*ELSEIF arth = 'DIV'.
*  final = a DIV b.
*ELSEIF arth EQ 'MOD'.
*  final = a MOD b.
*ELSE.
*  WRITE 'Invalid'.
*ENDIF.
*
*IF final = result.
*  WRITE :/ 'True'.
*ELSE.
*  WRITE :/ 'False'.
*ENDIF.

"question 5..........

*TYPES : BEGIN OF st_cust,
*        kunnr TYPE kna1-kunnr,
*        land1 TYPE kna1-land1,
*        vbeln TYPE vbak-vbeln,
*        erdat TYPE vbak-erdat,
*        matnr TYPE vbap-matnr,
*        matkl TYPE vbap-matkl,
*        END OF st_cust.
*
*DATA : wa TYPE st_cust,
*       it TYPE TABLE of st_cust.
*
* SElect  kna1~kunnr
*         kna1~land1
*         vbak~vbeln
*         vbak~erdat
*         vbap~matnr
*         vbap~matkl
*   into TABLE it from kna1 INNER JOIN vbak on kna1~kunnr = VBAK~kunnr  INNER JOIN vbap on vbak~vbeln = vbap~vbeln.
*
*   IF sy-subrc = 0 and it is NOT INITIAL.
*     LOOP AT  it INTO wa.
*       WRITE : / wa-kunnr,
*                 wa-land1,
*                 wa-vbeln,
*                 wa-erdat,
*                 wa-matnr,
*                 wa-matkl .
*       WRITE sy-dbcnt.
*      "  WRITE sy-tfill.
*     ENDLOOP.
*
*   ENDIF.

"//question 10..........

*DATA : date     TYPE dats,
*       time     TYPE tims,
*       usrname  TYPE string,
*       language TYPE string.
*date = sy-datum.
*time = sy-uzeit.
*usrname = sy-uname.
*language = sy-langu.
*
*WRITE : / 'Current Date',date,
*        /  'Current Time',time,
*        /  'Login username',usrname,
*        /  'Login language',language.

"// question 14
*
* Data: gv_date type Sy-datum.
* gv_date = sy-datum + 3.
* WRITE gv_date.

*"//question 15
*end-of-page.
*uline.
*write :'page NO',1.

"// question 17

*TYPES : BEGIN OF st_mara,
*        MATNR TYPE mara-MATNR,
*        ERSDA TYPE mara-ERSDA,
*        VPSTA TYPE mara-VPSTA,
*        MTART TYPE mara-MTART,
*        MATKL TYPE mara-MATKL,
*        END OF st_mara.
*DATA : it TYPE TABLE of st_mara,
*       wa TYPE st_mara.
*
*select  MATNR
*        ERSDA
*        VPSTA
*        MTART
*        MATKL
*  FROM mara into TABLE it.
*   IF sy-subrc = 0 and it is NOT INITIAL.
*  LOOP AT it into wa.
*     WRITE : / wa-matnr,
*                wa-ersda,
*                wa-vpsta,
*                wa-mtart,
*                wa-matkl.
*  ENDLOOP.
*   endif.

"// question 18
*
*TYPES : BEGIN OF st_cust,
*        NAME1 TYPE KNA1-NAME1,
*        VTWEG TYPE knvp-VTWEG,
*        SPART TYPE knvp-SPART,
*        VKORG TYPE knvp-VKORG,
*        END OF st_cust.
*
* DATA : it TYPE TABLE OF st_cust,
*        wa TYPE st_cust.
*
* SELECT kna1~NAME1
*        knvp~VTWEG
*        knvp~SPART
*        knvp~VKORG
*        into table it FROM kna1 INNER JOIN knvp on kna1~kunnr = knvp~kunnr.
*   IF sy-subrc = 0 and it is NOT INITIAL.
*   LOOP AT it into wa.
*    WRITE : / wa-name1,
*              wa-vtweg,
*              wa-spart,
*              wa-vkorg.
*
*  ENDLOOP.
*  ENDIF.

"// question 19

*TYPES : BEGIN OF st_stud,
*          Student_roll_no TYPE numc7,
*          student_name    TYPE string,
*          Theory_marks    TYPE i,
*          Practical_marks TYPE i,
*          END OF ST_STUD.
*
*TYPES : BEGIN OF st_grade,
*          Student_roll_no TYPE numc7,
*          student_name    TYPE string,
*          grade           TYPE c,
*          END OF st_grade.
*
*  DATA : it TYPE TABLE OF st_stud,
*       wa TYPE st_stud.
*
*  DATA : it_g TYPE TABLE OF st_grade,
*         wa_g TYPE st_grade,
*         g_temp TYPE i.
*
*
*
*wa-Student_roll_no = '1014301'.
*wa-student_name = 'tarun'.
*wa-Theory_marks = 45.
*wa-Practical_marks = 35.
*APPEND wa TO it.
*
*wa-Student_roll_no = '1014302'.
*wa-student_name = 'takshak'.
*wa-Theory_marks = 35.
*wa-Practical_marks = 44.
*APPEND wa TO it.
*
*
*wa-Student_roll_no = '1014303'.
*wa-student_name = 'kuamr'.
*wa-Theory_marks = 32.
*wa-Practical_marks = 39.
*APPEND wa TO it.
*
*
*wa-Student_roll_no = '1014304'.
*wa-student_name = 'dhavan'.
*wa-Theory_marks = 25.
*wa-Practical_marks = 25.
*APPEND wa TO it.
*
*
*wa-Student_roll_no = '1014305'.
*wa-student_name = 'sandeep'.
*wa-Theory_marks = 21.
*wa-Practical_marks = 40.
*APPEND wa TO it.
*
*
*wa-Student_roll_no = '1014306'.
*wa-student_name = 'saiteja'.
*wa-Theory_marks = 38.
*wa-Practical_marks = 49.
*APPEND wa TO it.
*
*
*wa-Student_roll_no = '1014307'.
*wa-student_name = 'prasanth'.
*wa-Theory_marks = 50.
*wa-Practical_marks = 50.
*APPEND wa TO it.
*
*
*wa-Student_roll_no = '1014308'.
*wa-student_name = 'dilip'.
*wa-Theory_marks = 31.
*wa-Practical_marks = 28.
*APPEND wa TO it.
*
*
*wa-Student_roll_no = '1014309'.
*wa-student_name = 'phani'.
*wa-Theory_marks = 47.
*wa-Practical_marks = 47.
*APPEND wa TO it.
*
*
*
*wa-Student_roll_no = '1014310'.
*wa-student_name = 'adithya'.
*wa-Theory_marks = 44.
*wa-Practical_marks = 50.
*APPEND wa TO it.
*
*LOOP AT  it INTO wa.
* g_temp = wa-Theory_marks + wa-Practical_marks.
*
*IF g_temp > 70.
*  wa_g-Student_roll_no = wa-Student_roll_no.
*  wa_g-student_name = wa-student_name.
*  wa_g-grade = 'A'.
*  APPEND wa_g to it_g.
*  ELSEIF g_temp > 60 and g_temp < 70.
*  wa_g-Student_roll_no = wa-Student_roll_no.
*  wa_g-student_name = wa-student_name.
*  wa_g-grade = 'B'.
*  APPEND wa_g to it_g.
*  ELSEIF g_temp < 60.
*  wa_g-Student_roll_no = wa-Student_roll_no.
*  wa_g-student_name = wa-student_name.
*  wa_g-grade = 'C'.
*  APPEND wa_g to it_g.
*  ENDIF.
* endloop.
*
**write:/ sy-uline+0(33).
**
**write:/1 sy-vline ,
**        2 'Stu_Roll_No' , 15 sy-vline,
**        16 'Stu_Name'   , 25 sy-vline ,
**        26 'Grade'      , 33 sy-vline .
**
**write:/ sy-uline+0(33).
**
**
** LOOP AT it_g into wa_g.
**
**   WRITE:/1 sy-vline,
**          2 wa_g-student_roll_no , 15 sy-vline color 5,
**          16 wa_g-student_name , 25 sy-vline,
**          26 wa_g-grade , 33 sy-vline,
**         / sy-uline+0(33).
** ENDLOOP.
**
*"//question 16
*
*IF IT_G IS NOT INITIAL.
*
*  LOOP at it_g INTO wa_g.
*    if wa_g-grade = 'A'.
*      write:/1 wa_g-student_roll_no COLOR 5,
*             10 wa_g-student_name COLOR 5,
*             20 wa_g-grade COLOR 5.
*     ELSEIF wa_g-grade = 'B'.
*          write:/1 wa_g-student_roll_no COLOR 6,
*              10 wa_g-student_name COLOR 6,
*              20 wa_g-grade COLOR 6.
*      ELSEIF wa_g-grade = 'C'.
*             write:/1 wa_g-student_roll_no COLOR 7,
*             10 wa_g-student_name COLOR 7,
*             20 wa_g-grade COLOR 7.
*      ENDIF.
*      endloop.
*      endif.

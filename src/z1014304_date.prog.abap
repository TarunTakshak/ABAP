*&---------------------------------------------------------------------*
*& Report Z1014304_DATE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_date.
*
*PARAMETERS  :
*"parameter to hold input data
*             p_date TYPE d.

* DATA :
* "variables to hold date
*         g_month_days(2) TYPE c,
*        g_temp(2) type c,
*        g_day(2) type c.
*
* g_temp = p_date+4(2). "month
* g_day = p_date+6(2). "date
*
*
*IF g_temp = '01' or g_temp ='03' or g_temp = '05' or g_temp = '07' or g_temp = '08'  or g_temp = '10' or g_temp = '12'.
*  g_month_days = '31'.
*ELSEIF g_temp = '04' or g_temp = '06' or g_temp = '09' or g_temp = '11'.
*  g_month_days = '30'.
*ELSE.
*  g_month_days = '28'.
*ENDIF.
*WHILE g_day ne g_month_days.
*  WRITE :/ p_date.
*  p_date = p_date + 1.
*g_day = g_day + 1.
*ENDWHILE.


*
*PARAMETERS p_date TYPE dats.
*DATA g_final TYPE string.
*
*do.
*if p_date+6(2) <= 7.
*  CONCATENATE  p_date+6(2) p_date+4(2) p_date+0(4) INTO g_final SEPARATED BY '/'.
*  WRITE : / 'week1 ', g_final.
*  ELSEIF  p_date+6(2) > 7 and p_date+6(2) <= 14.
*  CONCATENATE  p_date+6(2) p_date+4(2) p_date+0(4) INTO g_final SEPARATED BY '/'.
*  WRITE : / 'week2 ', g_final.
*  ELSEIF  p_date+6(2) > 14 and p_date+6(2) <= 21.
*  CONCATENATE  p_date+6(2) p_date+4(2) p_date+0(4) INTO g_final SEPARATED BY '/'.
*  WRITE : / 'week3 ', g_final.
*  ELSEIF  p_date+6(2) > 21 and p_date+6(2) <= 28.
*  CONCATENATE  p_date+6(2) p_date+4(2) p_date+0(4) INTO g_final SEPARATED BY '/'.
*  WRITE : / 'week4 ', g_final.
*  ELSEIF  p_date+6(2) > 28 ."and p_date+6(2) <= 32.
*  CONCATENATE  p_date+6(2) p_date+4(2) p_date+0(4) INTO g_final SEPARATED BY '/'.
*  WRITE : / 'week5 ', g_final.
*  ENDIF.
*  p_date+6(2) = p_date+6(2) + 1.
*  IF p_date+6(2) = 32 ."and p_date+4(2) = '01' or p_date+4(2) = '03' or p_date+4(2) = '05' or p_date+4(2) = '07' or p_date+4(2) = '08' or p_date+4(2) = '10' or p_date+4(2) = '12'.
*    exit.
*"ELSEIF p_date+6(2) = 32 and p_date+4(2) = '04' or p_date+4(2) ='06' or p_date+4(2) = '09' or p_date+4(2) = '11'.
*  ENDIF.
*  ENDDO.


"TABLE
*PARAMETERS : p_num type int2.
*
*data : lv_temp TYPE int2 VALUE '0',
*       lv_result TYPE int2.
*do 11 times.
*  lv_result = p_num * lv_temp.
*  WRITE : / p_num,'*',lv_temp,'=',lv_result.
*  lv_temp = lv_temp + 1.
*ENDDO.



"CALENDER

PARAMETERS period(6) TYPE c.

DATA: month(2)        TYPE c,

      year(4)         TYPE c,

      workdate        LIKE sy-datum,

      monthday        TYPE i,

      pos             TYPE p,

      numdays         TYPE p,

      day_of_week_num LIKE scal-indicator,

      last_day        LIKE sy-datum.


month = period+0(2).
year = period+2(4).

WRITE:/ 'month =', month,/ 'year =',year.

CONCATENATE year month '01' INTO workdate.

WRITE:/ 'DATE =', workdate.

CALL FUNCTION 'DATE_COMPUTE_DAY'
  EXPORTING
    date = workdate
  IMPORTING
    day  = day_of_week_num.

"WRITE:/ 'the day is', day_of_week_num ,'th day of the week'.

WRITE: /20 'mon',30 'tue',40 'wed',50 'thu',60 'fri',70 'sat',80 'sun',

/.

monthday = 1.

CASE day_of_week_num.

  WHEN '1'.

    WRITE monthday UNDER 'mon'.

    pos = 10.

  WHEN '2'.

    WRITE monthday UNDER 'tue'.

    pos = 20.

  WHEN '3'.

    WRITE monthday UNDER 'wed'.

    pos = 30.

  WHEN '4'.

    WRITE monthday UNDER 'thu'.

    pos = 40.

  WHEN '5'.

    WRITE monthday UNDER 'fri'.

    pos = 50.

  WHEN '6'.

    WRITE monthday UNDER 'sat'.

    pos = 60.

  WHEN '7'.

    WRITE monthday UNDER 'sun'.

    pos = 70.

  WHEN OTHERS.

ENDCASE.

CALL FUNCTION 'HR_E_NUM_OF_DAYS_OF_MONTH'
  EXPORTING
    p_fecha        = workdate
  IMPORTING
    number_of_days = numdays.

WHILE monthday LT numdays.

  monthday = monthday + 1.

  pos = pos + 10.

  IF pos = 80.

    WRITE /.

    pos = 10.

  ENDIF.

  WRITE at pos monthday.

ENDWHILE.

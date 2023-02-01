*&---------------------------------------------------------------------*
*& Report Z1014304_STUDENT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_student.

TYPES :
"Structure to hold student details
        BEGIN OF st_stud,
          Student_roll_no TYPE numc7,
          student_name    TYPE string,
          Theory_marks    TYPE i,
          Practical_marks TYPE i,
        END OF st_stud.
*
TYPES :
"Structure to hold grade details
         BEGIN OF st_grade,
          Student_roll_no TYPE numc7,
          student_name    TYPE string,
          grade           TYPE c,
        END OF st_grade.

DATA :
 "internal table and workarea to hold student details
       it_stud TYPE TABLE OF st_stud,
       wa_stud TYPE st_stud.

DATA :
  "internal table and workarea to hold grade details
      it_g   TYPE TABLE OF st_grade,
       wa_g   TYPE st_grade,
       g_temp TYPE i.



wa_stud-Student_roll_no = '1014301'.
wa_stud-student_name = 'tarun'.
wa_stud-Theory_marks = 45.
wa_stud-Practical_marks = 35.
APPEND wa_stud TO it_stud.

wa_stud-Student_roll_no = '1014302'.
wa_stud-student_name = 'takshak'.
wa_stud-Theory_marks = 35.
wa_stud-Practical_marks = 44.
APPEND wa_stud TO it_stud.


wa_stud-Student_roll_no = '1014303'.
wa_stud-student_name = 'kuamr'.
wa_stud-Theory_marks = 32.
wa_stud-Practical_marks = 39.
APPEND wa_stud TO it_stud.


wa_stud-Student_roll_no = '1014304'.
wa_stud-student_name = 'dhavan'.
wa_stud-Theory_marks = 25.
wa_stud-Practical_marks = 25.
APPEND wa_stud TO it_stud.


wa_stud-Student_roll_no = '1014305'.
wa_stud-student_name = 'sandeep'.
wa_stud-Theory_marks = 21.
wa_stud-Practical_marks = 40.
APPEND wa_stud TO it_stud.


wa_stud-Student_roll_no = '1014306'.
wa_stud-student_name = 'saiteja'.
wa_stud-Theory_marks = 38.
wa_stud-Practical_marks = 49.
APPEND wa_stud TO it_stud.


wa_stud-Student_roll_no = '1014307'.
wa_stud-student_name = 'prasanth'.
wa_stud-Theory_marks = 50.
wa_stud-Practical_marks = 50.
APPEND wa_stud TO it_stud.


wa_stud-Student_roll_no = '1014308'.
wa_stud-student_name = 'dilip'.
wa_stud-Theory_marks = 31.
wa_stud-Practical_marks = 28.
APPEND wa_stud TO it_stud.


wa_stud-Student_roll_no = '1014309'.
wa_stud-student_name = 'phani'.
wa_stud-Theory_marks = 47.
wa_stud-Practical_marks = 47.
APPEND wa_stud TO it_stud.


wa_stud-Student_roll_no = '1014310'.
wa_stud-student_name = 'adithya'.
wa_stud-Theory_marks = 44.
wa_stud-Practical_marks = 50.
APPEND wa_stud TO it_stud.

LOOP AT  it_stud INTO wa_stud.
  g_temp = wa_stud-Theory_marks + wa_stud-Practical_marks.

  IF g_temp > 70.
    wa_g-Student_roll_no = wa_stud-Student_roll_no.
    wa_g-student_name = wa_stud-student_name.
    wa_g-grade = 'A'.
    APPEND wa_g TO it_g.

  ELSEIF g_temp > 60 AND g_temp < 70.
    wa_g-Student_roll_no = wa_stud-Student_roll_no.
    wa_g-student_name = wa_stud-student_name.
    wa_g-grade = 'B'.
    APPEND wa_g TO it_g.
  ELSEIF g_temp < 60.
    wa_g-Student_roll_no = wa_stud-Student_roll_no.
    wa_g-student_name = wa_stud-student_name.
    wa_g-grade = 'C'.
    APPEND wa_g TO it_g.
  ENDIF.
ENDLOOP.

  write:/ sy-uline+0(33).

  write:/1 sy-vline ,
         2 'Stu_Roll_No' , 15 sy-vline,
        16 'Stu_Name'   ,  25 sy-vline ,
        26 'Grade'      ,  33 sy-vline .

  write:/ sy-uline+0(33).


 LOOP AT it_g into wa_g.

  WRITE:/1 sy-vline,
         2 wa_g-student_roll_no , 15 sy-vline color 5,
        16 wa_g-student_name ,    25 sy-vline,
        26 wa_g-grade ,           33 sy-vline,
         / sy-uline+0(33).
 ENDLOOP.

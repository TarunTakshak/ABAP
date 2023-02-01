*&---------------------------------------------------------------------*
*& Report Z1014304_SYSTEM_VARIABLES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_system_variables.


DATA : date     TYPE dats,
       time     TYPE tims,
       usrname  TYPE string,
       language TYPE string.
date = sy-datum.
time = sy-uzeit.
usrname = sy-uname.
language = sy-langu.

WRITE : / 'Current Date',date,
        /  'Current Time',time,
        /  'Login username',usrname,
        /  'Login language',language.

*&---------------------------------------------------------------------*
*& Report Z1014304_TIMEZONE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_timezone.

DATA : g_time1            TYPE tznzone VALUE 'Greenwich',
       g_time2            TYPE tznzone VALUE 'Delhi',
       g_time3            TYPE tznzone VALUE 'Brasilia',
       g_time4            TYPE tznzone VALUE 'U.S',
       g_time5            TYPE tznzone VALUE 'austrila',
       g_time6            TYPE tznzone VALUE 'rus06',
       g_timestamp        TYPE tzonref-tstamps,
       g_timestamp_string TYPE string.

CONCATENATE sy-datum sy-uzeit INTO  g_timestamp_string.
g_timestamp = g_timestamp_string.

WRITE : / g_timestamp TIME ZONE g_time1,
        / g_timestamp TIME ZONE g_time2,
        / g_timestamp TIME ZONE g_time3,
        / g_timestamp TIME ZONE g_time4,
        / g_timestamp TIME ZONE g_time5,
        / g_timestamp TIME ZONE g_time6.

*&---------------------------------------------------------------------*
*& Report Z1014304_DATACONVERSION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_DATACONVERSION.
*data : g_char(10)  TYPE c,
*       g_num(6)    TYPE n,
*       g_int       TYPE i,
*       g_packed    TYPE p,
*       g_float     TYPE f,
*       g_string    TYPE string,
*       g_date      TYPE dats,
*       g_time      TYPE tims.
*
*
*g_char ='Tarun'.
*g_num  ='123'.
*g_int = '456789'.
*g_packed = 4.
*g_float = 12345678.
*g_string = 'takshak'.
*g_date = '20220501'.
*g_time = 034460.
*
*
*g_string = g_packed.
*g_num = g_packed.
*g_char = g_packed.
*g_int = g_packed.
*g_packed = g_packed.
*g_float = g_packed.
*g_date = g_packed.
*g_time = g_packed.
*
*
*
*WRITE :/  "g_string.
*          g_char.
*          g_num.
*          g_int.
*          g_packed.
*          g_float.
*          g_date.
*          g_time.
*
*"// char to float
*data : g_char(5) TYPE c,
*       g_float(8) TYPE f.
*
*       "g_char = 12345.
*      g_char = 'abc123'.
*      g_float = g_char.
*
*WRITE: g_char , g_float.

*// char to int
*data : g_char(5) TYPE c,
*       g_int(8) TYPE i.
*
*      g_char = 12345.
*     " g_char = 'abc123'.
*      g_int = g_char.
*WRITE: g_char , g_int.

*// char to packed
*data : g_char(5) TYPE c,
*       g_packed(8) TYPE p.
*
*       "g_char = 12345.
*      g_char = 'abc123'.
*      g_packed = g_char.
*
*WRITE: g_char , g_packed.

*// char to date
*data : g_char(5) TYPE c,
*       g_date TYPE dats.
*
*       "g_char = 12345.
*      g_char = 'abc123'.
*      g_date = g_char.
*
*WRITE: g_char , g_date.

*// char to hexadecimal
*data : g_char(5) TYPE c,
*       g_hexadecimal(8) TYPE x.
*
*
*      g_char = 'AB'.
*      g_hexadecimal = g_char.
*
*WRITE: g_char ,g_hexadecimal.

*// char to numc
*  data : g_char(5) TYPE c,
*       g_numc(8) TYPE n.
*
*       "g_char = 12345.
*      g_char = 'ab1234'.
*      g_numc = g_char.
*
*WRITE: g_char ,g_numc.

*// char to string
*data : g_char(5) TYPE c,
*       g_string TYPE string.
*
*       "g_char = 12345.
*      g_char = 'ab12324'.
*      g_string = g_char.
*
*WRITE: g_char ,g_string.

*// char to time
data : g_char(5) TYPE c,
       g_time    TYPE tims.


      g_char = 'abcd12'.
      g_time = g_char.

WRITE: g_char ,g_time.

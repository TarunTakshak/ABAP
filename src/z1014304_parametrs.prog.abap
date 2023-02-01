*&---------------------------------------------------------------------*
*& Report Z1014304_PARAMETRS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_PARAMETRS.
PARAMETERS : a type i ," NO-DISPLAY,
             b type i.
data c type i.
     "// arthmatic operator
     c = a + b.
     WRITE / c.
      "// sub operator
     c = a - b.
     WRITE / c.
      "// mul operator
     c = a * b.
     WRITE / c.
      "// divison operator
     c = a / b.
     WRITE / c.
      "// modulus operator
     c = a mod b.
     WRITE / c.

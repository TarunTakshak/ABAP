*&---------------------------------------------------------------------*
*& Report Z1014304_ARTHEMATIC_OPERATIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_ARTHEMATIC_OPERATIONS.

PARAMETERS : p_a      TYPE i,
             p_b      TYPE i,
             p_arth   TYPE char3,
             p_result TYPE i.
DATA g_final TYPE i.
IF p_arth = 'ADD'.
 g_final = p_a + p_b.
ELSEIF p_arth EQ 'sub'.
 g_final = p_a - p_b.
ELSEIF p_arth EQ 'MUL'.
 g_final = p_a * p_b.
ELSEIF p_arth = 'DIV'.
 g_final = p_a DIV p_b.
ELSEIF p_arth EQ 'MOD'.
 g_final = p_a MOD p_b.
ELSE.
  WRITE 'Invalid'.
ENDIF.

IF g_final = p_result.
  WRITE :/ 'True'.
ELSE.
  WRITE :/ 'False'.
ENDIF.

*&---------------------------------------------------------------------*
*& Report Z1014304_BKPF_VBFA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_bkpf_vbfa.

include z1014304_bkpf_vbfa_str.

include z1014304_bkpf_vbfa_main.

INITIALIZATION.
t1 = 'ACCOUNTNG DETAILS'.
in1 = 'ENTER THE DETAILS'.

START-OF-SELECTION.

PERFORM get_bkpf_vbfa.

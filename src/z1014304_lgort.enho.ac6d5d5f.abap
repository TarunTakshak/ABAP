"Name: \PR:SAPMV50A\FO:USEREXIT_SAVE_DOCUMENT\SE:BEGIN\EI
ENHANCEMENT 0 Z1014304_LGORT.
*
  IF sy-uname = 'TAKSHAKT'.
    IF lips-lgort is INITIAL.
      MESSAGE 'Fill the Storage Location' TYPE 'E'.
    ENDIF.
  ENDIF.
ENDENHANCEMENT.

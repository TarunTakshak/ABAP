*&---------------------------------------------------------------------*
*& Report ZTT_WRITE_ACCESS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztt_write_access.


**
**
**
**DATA : it TYPE TABLE OF z1014304_t_btran,
**       wa TYPE z1014304_t_btran.
**
**SELECT * FROM z1014304_t_btran INTO TABLE it.
**
**wa-transcatiON_ID = 'abc'.
**wa-id = 'CUST123'.
**wa-card_no = '123456789'.
**wa-account_no = '098765'.
**wa-branch_id = 'branch1234'.
**
**"inserting data to internal table.
**" insert wa INTO it index 20.
**
**"inserting data to database table.
***INSERT z1014304_t_btran FROM wa.
***INSERT INTO z1014304_t_btran values wa.
**
**wa-transcatiON_ID = 'update test'.
**wa-id = 'UPDATE123'.
**wa-card_no = '12789'.
**wa-account_no = '065'.
**wa-branch_id = '1234'.
**
**"Updating data to database table.
***UPDATE  z1014304_t_btran from wa.
**
**wa-transcatiON_ID = 'pqrst'.
**wa-id = 'UPDATE123'.
**wa-card_no = '12789'.
**wa-account_no = '065'.
**wa-branch_id = '1234'.
**
**"Modifying data to internal table.
**"MODIFY it from wa index 5.
**
**"Modifying data to database table.
**MODIFY z1014304_t_btran from wa.
**
**
**"deleting data from database table.
***DELETE FROM z1014304_t_btran WHERE transcatiON_ID = 'modify'.
**
**"deleting data from internal table.
**"delete it INDEX 21.
**
**
**IF sy-subrc <> 0 AND it IS INITIAL.
**  MESSAGE 'DATA NOT FOUND' TYPE 'E'.
**ELSE.
**  LOOP AT it INTO wa .
**    WRITE : /1   wa-transcation_id,
**             20  wa-id,
**             30  wa-card_no,
**             50  wa-account_no,
**             60  wa-branch_id,
**             70  wa-atm_id,
**             80  wa-transcation_type,
**             90  wa-transcation_date,
**             100 wa-transcation_time,
**             110 wa-avaliable_balance,
**             120 wa-currency.
**  ENDLOOP.
**ENDIF.

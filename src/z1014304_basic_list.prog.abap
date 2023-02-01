*&---------------------------------------------------------------------*
*& Report Z1014304_BASIC_LIST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1014304_basic_list.


TYPES:
  "structure Declartion for customer details
  BEGIN OF ty_cust,
    id          TYPE   z_1014304_de_id,
    first_name  TYPE   z_1014304_de_name,
    middle_name TYPE   z_1014304_de_mname,
    last_name   TYPE   z_1014304_de_last_nam,
  END OF ty_cust,
  "structure Declartion for transcation details
  BEGIN OF ty_transc,
    transcation_id   TYPE z_1014304_de_t_id,
    transcation_type TYPE z_1014304_de_transcation_type,
    transcation_date TYPE z_1014304_de_bdate,
    transcation_time TYPE z_1014304_de_btime,
    id               TYPE z_1014304_de_id,
  END OF ty_transc.

DATA :
  "internal table and Work area Declartions for  customer and trnascation details
  it_cust          TYPE TABLE OF ty_cust,
  it_transc        TYPE TABLE OF ty_transc,
  wa_cust          TYPE ty_cust,
  wa_transc        TYPE ty_transc,
  "global variable decalrtion
  g_transcation_id TYPE z_1014304_de_t_id,
  g_field          TYPE z_1014304_de_id,
  g_value          TYPE z_1014304_de_id.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 8(20) lb1.
    PARAMETERS :p_traid TYPE z_1014304_de_t_id.
  SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK b1.

"iniializing values for lb1 and p_traid

INITIALIZATION.
  lb1 = 'Transcation Id'.
  p_traid ='TR9876543210004'.

AT SELECTION-SCREEN ON p_traid.
  SELECT SINGLE transcation_id FROM z1014304_t_btran INTO g_transcation_id WHERE transcation_id = p_traid.
  IF sy-subrc <> 0.
    MESSAGE 'Enter Valid Transcation Id' TYPE 'E'.
  ENDIF.



START-OF-SELECTION.
  "select query to fetch data from database table
  SELECT  transcation_id
          transcation_type
          transcation_date
          transcation_time
          id
     FROM z1014304_t_btran INTO CORRESPONDING FIELDS OF TABLE it_transc
  WHERE transcation_id = p_traid.
  IF sy-subrc = 0.
    WRITE :/ sy-uline+0(101),
           /1 sy-vline,
            2 'Transcation Id',19 sy-vline,
            20'Transcation Type',44 sy-vline,
            45'Transcation Date', 64 sy-vline,
            65'Transcation Time', 87 sy-vline,
            88'Customer Id',101 sy-vline.
    WRITE :/ sy-uline+0(101).
    LOOP AT it_transc INTO wa_transc.
      WRITE :/1 sy-vline.
      WRITE : 2 wa_transc-transcation_id, 19 sy-vline,
               20 wa_transc-transcation_type,44 sy-vline,
               45 wa_transc-transcation_date,64 sy-vline,
               65 wa_transc-transcation_time, 87 sy-vline,
               88 wa_transc-id              , 101 sy-vline.

      WRITE :/ sy-uline+0(101).


    ENDLOOP.                           "loop at it_transc...
  ENDIF.

AT LINE-SELECTION.


   GET CURSOR FIELD g_field VALUE g_value.

  "select query to fetch data from database table
  SELECT  id
          first_name
          middle_name
          last_name
    FROM z1014304_t_custm INTO CORRESPONDING FIELDS OF TABLE it_cust
  WHERE id =  g_value.


  IF sy-subrc = 0.

    CASE sy-lsind.
      WHEN 1.
        WRITE :/ sy-uline+0(65),
               /1 sy-vline,
                2'Customer Id', 13 sy-vline,
                20'First Name', 30 sy-vline,
                35'Middle Name',49 sy-vline,
                50'Last Name',  65 sy-vline.
        WRITE :/ sy-uline+0(65).
        LOOP AT it_cust INTO wa_cust.
          WRITE :/1 sy-vline.
          WRITE :  2 wa_cust-id, 13 sy-vline,
                   20 wa_cust-first_name,30 sy-vline,
                   35 wa_cust-middle_name,49 sy-vline,
                   50 wa_cust-last_name, 65  sy-vline.
        "  HIDE wa_cust-id.
          WRITE :/ sy-uline+0(65).
        ENDLOOP.                       "loop at it_cust...
    ENDCASE.
  ENDIF.

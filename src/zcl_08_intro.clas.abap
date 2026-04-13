CLASS zcl_08_intro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_intro IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    DATA var TYPE string.                      "step 1
    DATA var TYPE /lrn/s4d430_ind.    "step 2

    DATA ls_/lrn/s4d430_ind TYPE /lrn/s4d430_ind.
    ls_/lrn/s4d430_ind-id = '0002'.
    ls_/lrn/s4d430_ind-description = 'Wert-1'.

    INSERT INTO /lrn/s4d430_ind VALUES @ls_/lrn/s4d430_ind.
    SELECT FROM /lrn/s4d430_ind FIELDS * INTO TABLE @DATA(lt_result).
    out->write( lt_result ).

  ENDMETHOD.
ENDCLASS.

CLASS zcl_08_final_task DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_08_final_task IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM z08cust_orders_r( p_customerid = '000001' )
      FIELDS
        OrderID,
        Amount,
        Currency,
        \_Customer-FirstName,
        \_Customer-LastName,
        \_Customer-City,
        \_Customer-Postcode
      INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.

ENDCLASS.

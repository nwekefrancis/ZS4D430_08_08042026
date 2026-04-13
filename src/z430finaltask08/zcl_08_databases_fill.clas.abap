CLASS zcl_08_databases_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zcl_08_databases_fill IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "------------------------------------------------------------
    " 1. Internal tables
    "------------------------------------------------------------
    DATA: lt_customers TYPE TABLE OF z08customers,
          lt_orders    TYPE TABLE OF z08cust_orders.

    "------------------------------------------------------------
    " 2. Delete old test data first
    "------------------------------------------------------------
    DELETE FROM z08cust_orders.
    DELETE FROM z08customers.

    "------------------------------------------------------------
    " 3. Fill customer table
    "------------------------------------------------------------
    APPEND VALUE z08customers(
      client        = sy-mandt
      customerid    = '000001'
      first_name    = 'Anna'
      last_name     = 'Meyer'
      city          = 'Berlin'
      street        = 'Hauptstr. 1'
      postcode      = '10115'
      zzemail_zcu   = 'anna.meyer@example.com'
      zzphone_zcu   = '+49111111111'
    ) TO lt_customers.

    APPEND VALUE z08customers(
      client        = sy-mandt
      customerid    = '000002'
      first_name    = 'John'
      last_name     = 'Smith'
      city          = 'Hamburg'
      street        = 'Allee 12'
      postcode      = '20095'
      zzemail_zcu   = 'john.smith@example.com'
      zzphone_zcu   = '+49222222222'
    ) TO lt_customers.

    APPEND VALUE z08customers(
      client        = sy-mandt
      customerid    = '000003'
      first_name    = 'Maria'
      last_name     = 'Khan'
      city          = 'Munich'
      street        = 'Ring 7'
      postcode      = '80331'
      zzemail_zcu   = 'maria.khan@example.com'
      zzphone_zcu   = '+49333333333'
    ) TO lt_customers.

    "------------------------------------------------------------
    " 4. Fill order table
    "------------------------------------------------------------
    APPEND VALUE z08cust_orders(
      client      = sy-mandt
      orderid     = '000001'
      customerid  = '000001'
      amount      = '120.50'
      currency    = 'EUR'
    ) TO lt_orders.

    APPEND VALUE z08cust_orders(
      client      = sy-mandt
      orderid     = '000002'
      customerid  = '000001'
      amount      = '79.50'
      currency    = 'EUR'
    ) TO lt_orders.

    APPEND VALUE z08cust_orders(
      client      = sy-mandt
      orderid     = '000003'
      customerid  = '000002'
      amount      = '200.00'
      currency    = 'EUR'
    ) TO lt_orders.

    APPEND VALUE z08cust_orders(
      client      = sy-mandt
      orderid     = '000004'
      customerid  = '000003'
      amount      = '50.00'
      currency    = 'EUR'
    ) TO lt_orders.

    "------------------------------------------------------------
    " 5. Insert customer data
    "------------------------------------------------------------
    INSERT z08customers FROM TABLE @lt_customers.

    IF sy-subrc = 0.
      out->write( 'Customer data inserted successfully.' ).
    ELSE.
      out->write( 'Error inserting customer data.' ).
    ENDIF.

    "------------------------------------------------------------
    " 6. Insert order data
    "------------------------------------------------------------
    INSERT z08cust_orders FROM TABLE @lt_orders.

    IF sy-subrc = 0.
      out->write( 'Order data inserted successfully.' ).
    ELSE.
      out->write( 'Error inserting order data.' ).
    ENDIF.

    "------------------------------------------------------------
    " 7. Final confirmation
    "------------------------------------------------------------
    out->write( 'Sample data fill finished.' ).

  ENDMETHOD.

ENDCLASS.

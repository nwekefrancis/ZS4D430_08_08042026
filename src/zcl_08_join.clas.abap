CLASS zcl_08_join DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_join IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/carrier
        FIELDS carrier_id,
               name,
               currency_code
         INTO TABLE @DATA(lt_carrier).
    out->write( lt_carrier ).
    out->write( '-----------------------------------------------------------' ).


    SELECT FROM /dmo/connection
         FIELDS carrier_id,
                connection_id,
                airport_from_id,
                airport_to_id
         INTO TABLE @DATA(lt_connection).
    out->write( lt_connection ).
    out->write( '-----------------------------------------------------------' ).


    SELECT FROM /dmo/carrier AS a LEFT OUTER JOIN /dmo/connection AS c
        ON a~carrier_id = c~carrier_id

        FIELDS a~carrier_id,
              name AS carrier_name,
              connection_id,
              airport_from_id,
              airport_to_id

*         WHERE a~carrier_id = c~carrier_id
          WHERE a~currency_code = 'EUR'
    into table @DATA(result).
    out->write( result ).


  ENDMETHOD.
ENDCLASS.

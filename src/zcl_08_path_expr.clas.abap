CLASS zcl_08_path_expr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_08_PATH_EXPR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Ex. 12
    SELECT
    FROM Z08_C_EMPLOYEEQUERY
    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,
           DepartmentDescription,
           AssistantName,
           \_Department\_Head-LastName as Headname oRDER BY EmployeeId
    INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.

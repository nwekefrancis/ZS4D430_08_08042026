extend view entity Z08_C_EmployeeQueryP with

association [1..1] to I_Country as _ZZCountryZEM
    on $projection.ZZCountryZEM = _ZZCountryZEM.Country

{
  Employee.ZZCountryZEM as ZZCountryZEM,
  Employee.ZZTitle      as ZZTitleZEM,
  
  concat_with_space(Employee.FirstName, Employee.LastName, 1 ) as ZZFullNameZEM,
  _ZZCountryZEM.IsEuropeanUnionMember as ZZEUBasedZem
    

}

@AbapCatalog: {
  viewEnhancementCategory: [#PROJECTION_LIST],
  extensibility.dataSources: [ 'Customer' ],
  extensibility.elementSuffix: 'ZCU'
}
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customers Read'
define view entity Z08CUSTOMERS_R
  as select from z08customers as Customer
{
  key Customer.customerid  as CustomerID,
      Customer.first_name  as FirstName,
      Customer.last_name   as LastName,
      Customer.city        as City,
      Customer.street      as Street,
      Customer.postcode    as Postcode
}

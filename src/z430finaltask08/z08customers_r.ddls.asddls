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
      @EndUserText.label: 'Customer Number'
  key Customer.customerid  as CustomerID,
      @EndUserText.label: 'First Name'
      Customer.first_name  as FirstName,
      @EndUserText.label: 'Last Name'
      Customer.last_name   as LastName,
      @EndUserText.label: 'City'
      Customer.city        as City,
      @EndUserText.label: 'Street'
      Customer.street      as Street,
      @EndUserText.label: 'PostCode'
      Customer.postcode    as Postcode
}

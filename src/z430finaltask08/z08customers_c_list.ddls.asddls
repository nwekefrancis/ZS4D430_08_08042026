@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Revenue List'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z08CUSTOMERS_C_LIST 
    as select from z08cust_orders as Orders
      inner join z08customers as Customers
        on Orders.customerid = Customers.customerid
{
      key Customers.customerid as CustomerID,
      Customers.first_name as FirstName,
      Customers.last_name  as LastName,

  @Semantics.amount.currencyCode: 'Currency'
      sum( Orders.amount ) as TotalAmount,

      Orders.currency      as Currency
}

group by
  Customers.customerid,
  Customers.first_name,
  Customers.last_name,
  Orders.currency

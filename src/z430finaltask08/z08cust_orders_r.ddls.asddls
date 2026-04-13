@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Orders Read Data Def'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z08CUST_ORDERS_R
  with parameters
    p_customerid : z08_customer_id
  as select from z08cust_orders
    association [1..1] to Z08CUSTOMERS_R as _Customer 
     on $projection.CustomerID = _Customer.CustomerID
{
  key orderid    as OrderID,
      customerid as CustomerID,
      @Semantics.amount.currencyCode: 'Currency'
      amount     as Amount,
      currency   as Currency,
      _Customer
}
where customerid = $parameters.p_customerid

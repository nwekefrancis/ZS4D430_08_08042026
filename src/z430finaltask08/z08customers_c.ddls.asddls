@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customers Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity Z08CUSTOMERS_C as select from Z08CUSTOMERS_R
{
     
    key CustomerID,
    
    FirstName,
    
    LastName,
    
    City,
    
    Street,
    
    Postcode
}

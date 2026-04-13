@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS View'
@Metadata.ignorePropagatedAnnotations: true
define view entity zs4d01_airport as select from /dmo/airport
{
    key airport_id as Airport,
    name as Name,
    city as City,
    country as Country
}

@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZEXAM08_ACMAT'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_EXAM08_ACMAT
  as select from ZEXAM08_ACMAT as Acmat
{
  key matid as Matid,
  factory_warehouse as FactoryWarehouse,
  @Semantics.quantity.unitOfMeasure: 'UnitMeas'
  quant_warehouse as QuantWarehouse,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  unit_meas as UnitMeas,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.user.lastChangedBy: true
  changed_by as ChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}

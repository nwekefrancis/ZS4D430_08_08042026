@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Warehouse utilization per warehouse'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_ZEXAM08_ACMAT 
    as select from zexam08_acmat
{
  key factory_warehouse as FactoryWarehouse,

  @Semantics.quantity.unitOfMeasure: 'UnitMeas'
  sum( quant_warehouse ) as TotalQuantity,

  unit_meas as UnitMeas
}
group by factory_warehouse, unit_meas

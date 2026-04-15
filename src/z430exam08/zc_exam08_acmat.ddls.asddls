@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZEXAM08_ACMAT'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_EXAM08_ACMAT
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_EXAM08_ACMAT
  association [1..1] to ZR_EXAM08_ACMAT as _BaseEntity on $projection.MATID = _BaseEntity.MATID
{
  key Matid,
  FactoryWarehouse,
  @Semantics: {
    Quantity.Unitofmeasure: 'UnitMeas'
  }
  QuantWarehouse,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  UnitMeas,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    User.Lastchangedby: true
  }
  ChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}

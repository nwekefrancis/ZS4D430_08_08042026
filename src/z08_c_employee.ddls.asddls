@AbapCatalog: { dataMaintenance: #RESTRICTED,
                viewEnhancementCategory: [ #NONE ] }

//@AbapCatalog.viewEnhancementCategory: [#NONE]
//@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Mitarbeiter (Projection) Ex. 09'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { dataClass: #MASTER,
                            serviceQuality: #D,
                            sizeCategory: #M}
define view entity Z08_C_Employee as select from Z08_R_Employee
{
    key EmployeeId,
    FirstName,
    LastName,
    BirthDate,
    EntryDate,
    DepartmentId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    AnnualSalary,
    @EndUserText.label: 'Currency Key'
    CurrencyCode,
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt
}

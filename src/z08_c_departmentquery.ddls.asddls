@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Process Data Sets in CDS Views. Workers (Projection) Ex. 16'
@Metadata.ignorePropagatedAnnotations: true
//define view entity Z08_C_DEPARTMENTQUERY as select distinct from Z08_C_EMPLOYEEQUERY // comented because 'distict' was just to show its capability
define view entity Z08_C_DEPARTMENTQUERY
  with parameters
    p_target_curr : /dmo/currency_code,
    @EndUserText.label: 'Datume der Bewertung'
    @Environment.systemField: #USER_DATE
    p_date        : abap.dats
  as select from     Z08_C_EmployeeQueryP( p_target_curr: $parameters.p_target_curr , p_date: $parameters.p_date  ) as e
    right outer join Z08_R_DEPARTMENT                                                                               as d on e.DepartmentId = d.Id

{

  d.Id,
  d.Description,

  //  Task 2  Using Aggregations
  avg( e.CompanyAffiliation as abap.dec( 11, 1 ) ) as AverageAffiliation, //Here aggregator avg( ) is used
  @Semantics.amount.currencyCode: 'CurrencyCodeTarget'
  sum( e.AnnualSalaryConverted )                   as TotalSalary, //Task 2.4 -> TotalSalary
  e.CurrencyCodeTarget
}

//  Task 2 Using Grouping
group by // grouping  gives similar outcome like 'distict'. Note one can also group without 'aggragator'
  d.Id,
  d.Description,
  e.CurrencyCodeTarget

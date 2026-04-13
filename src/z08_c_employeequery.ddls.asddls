@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mitarbeiter (Projection) Ex. 12, Ex. 13, Ex. 14'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z08_C_EMPLOYEEQUERY
  as select from Z08_R_Employee
{
  key EmployeeId,
      FirstName,
      LastName,
      DepartmentId,

      _Department.Description                                                  as DepartmentDescription,
      //      _Department._Assistant.LastName as AssistantName,

      //    Ex 14 starts here
      //    Ex. 14 Task 1 start
      concat_with_space( _Department._Assistant.FirstName,
                        _Department._Assistant.LastName, 1 )                   as AssistantName,
      //    Ex. 14 Task 1 stops



      @EndUserText.label: 'Employee Role'
      case EmployeeId
        when _Department.DepartmentHead then 'H'
        when _Department.DepartmentAssistant then 'A'
        else ''
      end                                                                      as EmployerRole,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      AnnualSalary,
      CurrencyCode,

      //      Ex. 14 Task 3 start
      cast( 'USD' as /dmo/currency_code )                                      as CurrencyCodeUSD,

      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
      @EndUserText.label: 'AnnualSalaryCoverted'
      currency_conversion( amount => AnnualSalary,
                  source_currency => CurrencyCode,
                  target_currency => $projection.CurrencyCodeUSD,
               exchange_rate_date => $session.system_date )                    as AnnualSalaryConverted,
      //      Ex. 14 Task 3 Ends -> End of Ex. 14

      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
      @EndUserText.label: 'Monthly Syslaty'
      cast( cast( $projection.AnnualSalaryConverted as abap.fltp  )
           / 12.0 as abap.dec( 10, 2 )  )                                      as MonthlySalaryConverted,

      //      dats_days_between( EntryDate, $session.system_date ) as CompanyAffiliation,
      //      Ex. 14 Task 2 start
      division( dats_days_between( EntryDate, $session.system_date ), 365, 1 ) as CompanyAffiliation,
      //      Ex. 14 Task 2 ends


      /* Associations */
      _Department
}

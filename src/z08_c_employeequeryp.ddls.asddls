@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mitarbeiter (Projection) Ex. 15'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z08_C_EmployeeQueryP
    with parameters 
        p_target_curr : /dmo/currency_code,   // EX. 15
        p_date : abap.dats                    // EX. 15
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
//      cast( 'USD' as /dmo/currency_code )                                      as CurrencyCodeUSD,

      @Semantics.amount.currencyCode: 'CurrencyCodeTarget'
      @EndUserText.label: 'Annual Salary Coverted'
      currency_conversion( amount => AnnualSalary,
                  source_currency => CurrencyCode,
                  target_currency => $parameters.p_target_curr,                 // EX. 15.  changed to §parameter...
               exchange_rate_date => $parameters.p_date )                    as AnnualSalaryConverted,
      //      Ex. 14 Task 3 Ends -> End of Ex. 14

      @Semantics.amount.currencyCode: 'CurrencyCodeTarget'
      @EndUserText.label: 'Monthly Syslary'
      cast( cast( $projection.AnnualSalaryConverted as abap.fltp  )
           / 12.0 as abap.dec( 10, 2 )  )                                      as MonthlySalaryConverted,
      $parameters.p_target_curr as CurrencyCodeTarget,                          // EX. 15 

      //      dats_days_between( EntryDate, $session.system_date ) as CompanyAffiliation,
      //      Ex. 14 Task 2 start
      division( dats_days_between( EntryDate, $parameters.p_date ), 365, 1 ) as CompanyAffiliation, // EX. 15 changed to §papameter
      //      Ex. 14 Task 2 ends


      /* Associations */
      _Department
}

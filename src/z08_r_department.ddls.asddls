@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Department'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z08_R_DEPARTMENT as select from z08depment
    association [0..*] to Z08_R_Employee as _Employer
        on $projection.Id = _Employer.DepartmentId
    association [0..1] to Z08_R_Employee as _Head
        on $projection.DepartmentHead = _Head.EmployeeId    
    association [1..1] to Z08_R_Employee as _Assistant
        on $projection.DepartmentAssistant = _Assistant.EmployeeId
{
    key id as Id,
    description as Description,
    department_head as DepartmentHead,
    department_assistant as DepartmentAssistant,
    created_by as CreatedBy,
    created_at as CreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt,
    _Employer,
    _Head,
    _Assistant
}

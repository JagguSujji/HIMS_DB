CREATE     PROCEDURE [dbo].[USP_EmployeeDepartment_Get]

(
@EmployeeId BIGINT
)

AS
BEGIN


SELECT

ED.EmployeeDepartmentId,
D.DepartmentId,
D.DepartmentName,
ED.IsPrimaryDepartment

FROM dbo.EmployeeDepartment ED

INNER JOIN dbo.Department D
ON ED.DepartmentId=D.DepartmentId

WHERE ED.EmployeeId=@EmployeeId;


END

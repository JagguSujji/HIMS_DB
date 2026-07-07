CREATE     PROCEDURE [dbo].[USP_Department_GetAll]

AS
BEGIN


SELECT

DepartmentId,
DepartmentCode,
DepartmentName,
DepartmentTypeId,
IsClinical,
IsActive

FROM dbo.Department

WHERE IsActive=1

ORDER BY DepartmentName;


END

CREATE     PROCEDURE [dbo].[USP_EmploymentType_GetAll]

AS
BEGIN


SELECT

EmploymentTypeId,
EmploymentTypeCode,
EmploymentTypeName

FROM dbo.EmploymentType

WHERE IsActive=1;


END

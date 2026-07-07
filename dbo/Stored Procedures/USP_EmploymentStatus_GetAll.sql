



CREATE     PROCEDURE [dbo].[USP_EmploymentStatus_GetAll]
AS
BEGIN

SELECT *

FROM EmploymentStatus

WHERE IsActive=1

END

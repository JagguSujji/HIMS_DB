

CREATE     PROCEDURE [dbo].[USP_Employee_GetAll]
AS
BEGIN

SELECT *
FROM Employee
WHERE IsActive=1
ORDER BY FirstName;

END

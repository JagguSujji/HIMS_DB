


/***********************************************************
 Employee Directory Report
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_Employee_Directory_Report]
AS
BEGIN

SELECT

E.EmployeeNumber,
E.FirstName,
E.LastName,
D.DesignationName

FROM Employee E

LEFT JOIN Designation D

ON E.DesignationId=D.DesignationId

WHERE E.IsActive=1;

END

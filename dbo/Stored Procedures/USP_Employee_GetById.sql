/*==========================================================
 MODULE 11
 HR & PAYROLL MANAGEMENT
 Missing Stored Procedures Only
==========================================================*/


/***********************************************************
 Employee Get
 Table: Employee
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Employee_GetById]
(
 @EmployeeId INT
)
AS
BEGIN

SELECT *
FROM Employee
WHERE EmployeeId=@EmployeeId;

END

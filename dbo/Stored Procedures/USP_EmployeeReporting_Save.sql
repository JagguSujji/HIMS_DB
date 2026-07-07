


/***********************************************************
 Employee Reporting Manager
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_EmployeeReporting_Save]
(
 @EmployeeId INT,
 @ReportingManagerId INT
)
AS
BEGIN

INSERT INTO EmployeeReporting
(
 EmployeeId,
 ReportingManagerId,
 EffectiveFrom,
 IsPrimaryManager
)

VALUES
(
 @EmployeeId,
 @ReportingManagerId,
 GETDATE(),
 1
)

END

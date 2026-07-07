


/***********************************************************
 Employee Shift
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_EmployeeShift_Save]
(
 @EmployeeId INT,
 @ShiftTypeId INT,
 @EffectiveFrom DATE,
 @EffectiveTo DATE
)
AS
BEGIN

INSERT INTO EmployeeShift
(
 EmployeeId,
 ShiftTypeId,
 EffectiveFrom,
 EffectiveTo,
 IsCurrent,
 CreatedOn
)

VALUES
(
 @EmployeeId,
 @ShiftTypeId,
 @EffectiveFrom,
 @EffectiveTo,
 1,
 GETDATE()
)

END

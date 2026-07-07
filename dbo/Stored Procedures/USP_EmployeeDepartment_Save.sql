CREATE     PROCEDURE [dbo].[USP_EmployeeDepartment_Save]
(
 @EmployeeId BIGINT,
 @DepartmentId BIGINT,
 @IsPrimaryDepartment BIT,
 @EffectiveFrom DATE
)

AS
BEGIN


INSERT INTO dbo.EmployeeDepartment
(
EmployeeId,
DepartmentId,
IsPrimaryDepartment,
EffectiveFrom
)

VALUES
(
@EmployeeId,
@DepartmentId,
@IsPrimaryDepartment,
@EffectiveFrom
);


END

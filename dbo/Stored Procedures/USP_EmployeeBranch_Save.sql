CREATE     PROCEDURE [dbo].[USP_EmployeeBranch_Save]

(
 @EmployeeId BIGINT,
 @BranchId BIGINT,
 @IsPrimaryBranch BIT,
 @EffectiveFrom DATE
)

AS
BEGIN


INSERT INTO dbo.EmployeeBranch
(
EmployeeId,
BranchId,
IsPrimaryBranch,
EffectiveFrom
)

VALUES
(
@EmployeeId,
@BranchId,
@IsPrimaryBranch,
@EffectiveFrom
);


END

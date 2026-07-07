CREATE     PROCEDURE [dbo].[USP_UserRole_Assign]
(
    @UserId BIGINT,
    @RoleId BIGINT,
    @BranchId BIGINT,
    @CreatedBy BIGINT
)
AS
BEGIN

INSERT INTO dbo.UserRole
(
 UserId,
 RoleId,
 BranchId,
 IsActive,
 CreatedBy,
 CreatedOn
)

VALUES
(
 @UserId,
 @RoleId,
 @BranchId,
 1,
 @CreatedBy,
 GETDATE()
);

END

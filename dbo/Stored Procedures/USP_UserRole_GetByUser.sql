CREATE     PROCEDURE [dbo].[USP_UserRole_GetByUser]
(
 @UserId BIGINT
)
AS
BEGIN


SELECT

UR.UserRoleId,
R.RoleId,
R.RoleName,
UR.BranchId,
UR.IsActive

FROM dbo.UserRole UR

INNER JOIN dbo.Role R
ON UR.RoleId=R.RoleId

WHERE

UR.UserId=@UserId
AND UR.IsActive=1;


END

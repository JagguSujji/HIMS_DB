CREATE     PROCEDURE [dbo].[USP_UserRole_Remove]
(
 @UserRoleId BIGINT
)
AS
BEGIN


UPDATE dbo.UserRole

SET

IsActive=0

WHERE UserRoleId=@UserRoleId;


END




/************************************************************
 User Permission Check
************************************************************/

CREATE     PROCEDURE [dbo].[USP_User_HasPermission]
(
 @UserId INT,
 @PermissionCode VARCHAR(100)
)
AS
BEGIN


SELECT

CASE WHEN COUNT(*)>0
THEN 1
ELSE 0
END HasPermission


FROM UserRole UR

INNER JOIN RolePermission RP
ON UR.RoleId=RP.RoleId

INNER JOIN Permission P
ON RP.PermissionId=P.PermissionId

WHERE UR.UserId=@UserId
AND P.PermissionCode=@PermissionCode
AND RP.CanView=1;


END

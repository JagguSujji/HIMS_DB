CREATE     PROCEDURE [dbo].[USP_Permission_GetAll]
AS
BEGIN


SELECT

PermissionId,
ModuleName,
ScreenName,
ActionName,
PermissionCode,
IsActive

FROM dbo.Permission

ORDER BY ModuleName,ScreenName;


END

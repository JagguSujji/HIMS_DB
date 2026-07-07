CREATE     PROCEDURE [dbo].[USP_RolePermission_GetByRole]
(
@RoleId BIGINT
)
AS
BEGIN


SELECT

RP.RolePermissionId,
P.PermissionId,
P.ModuleName,
P.ScreenName,
P.ActionName,

RP.CanView,
RP.CanCreate,
RP.CanEdit,
RP.CanDelete,
RP.CanApprove,
RP.CanPrint,
RP.CanExport


FROM dbo.RolePermission RP

INNER JOIN dbo.Permission P

ON RP.PermissionId=P.PermissionId


WHERE RP.RoleId=@RoleId;


END

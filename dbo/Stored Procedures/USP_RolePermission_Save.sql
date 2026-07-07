CREATE     PROCEDURE [dbo].[USP_RolePermission_Save]
(
 @RoleId BIGINT,
 @PermissionId BIGINT,
 @CanView BIT,
 @CanCreate BIT,
 @CanEdit BIT,
 @CanDelete BIT,
 @CanApprove BIT,
 @CanPrint BIT,
 @CanExport BIT
)

AS
BEGIN


IF EXISTS
(
 SELECT 1
 FROM dbo.RolePermission
 WHERE RoleId=@RoleId
 AND PermissionId=@PermissionId
)

BEGIN

UPDATE dbo.RolePermission

SET

CanView=@CanView,
CanCreate=@CanCreate,
CanEdit=@CanEdit,
CanDelete=@CanDelete,
CanApprove=@CanApprove,
CanPrint=@CanPrint,
CanExport=@CanExport

WHERE

RoleId=@RoleId
AND PermissionId=@PermissionId;


END

ELSE

BEGIN


INSERT INTO dbo.RolePermission
(
RoleId,
PermissionId,
CanView,
CanCreate,
CanEdit,
CanDelete,
CanApprove,
CanPrint,
CanExport,
CreatedOn
)

VALUES
(
@RoleId,
@PermissionId,
@CanView,
@CanCreate,
@CanEdit,
@CanDelete,
@CanApprove,
@CanPrint,
@CanExport,
GETDATE()
);


END


END

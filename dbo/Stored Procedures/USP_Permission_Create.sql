CREATE     PROCEDURE [dbo].[USP_Permission_Create]
(
@ModuleName VARCHAR(100),
@ScreenName VARCHAR(100),
@ActionName VARCHAR(100),
@PermissionCode VARCHAR(100),
@Description VARCHAR(500),
@CreatedBy BIGINT
)

AS
BEGIN


INSERT INTO dbo.Permission
(
ModuleName,
ScreenName,
ActionName,
PermissionCode,
Description,
IsActive,
CreatedBy,
CreatedOn
)

VALUES
(
@ModuleName,
@ScreenName,
@ActionName,
@PermissionCode,
@Description,
1,
@CreatedBy,
GETDATE()
);


END

CREATE     PROCEDURE [dbo].[USP_Menu_Create]
(
 @MenuCode VARCHAR(50),
 @MenuName VARCHAR(100),
 @ParentMenuId BIGINT=NULL,
 @ApplicationId BIGINT
)

AS
BEGIN


INSERT INTO dbo.Menu
(
MenuCode,
MenuName,
ParentMenuId,
ApplicationId,
IsActive
)

VALUES
(
@MenuCode,
@MenuName,
@ParentMenuId,
@ApplicationId,
1
);


END

CREATE     PROCEDURE [dbo].[USP_RoleMenu_Save]
(
 @RoleId BIGINT,
 @MenuId BIGINT
)

AS
BEGIN


IF NOT EXISTS
(
SELECT 1
FROM dbo.RoleMenu
WHERE RoleId=@RoleId
AND MenuId=@MenuId
)

BEGIN


INSERT INTO dbo.RoleMenu
(
RoleId,
MenuId
)

VALUES
(
@RoleId,
@MenuId
);


END


END

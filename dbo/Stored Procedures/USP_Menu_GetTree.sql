CREATE     PROCEDURE [dbo].[USP_Menu_GetTree]
(
 @ApplicationId BIGINT
)

AS
BEGIN


SELECT

MenuId,
MenuCode,
MenuName,
ParentMenuId,
ApplicationId,
IsActive

FROM dbo.Menu

WHERE

ApplicationId=@ApplicationId

AND IsActive=1

ORDER BY MenuName;


END

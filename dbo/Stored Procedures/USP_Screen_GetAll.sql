CREATE     PROCEDURE [dbo].[USP_Screen_GetAll]

AS
BEGIN


SELECT

ScreenId,
ScreenCode,
ScreenName,
ModuleName,
IsActive

FROM dbo.Screen

WHERE IsActive=1

ORDER BY ModuleName;


END

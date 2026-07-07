


CREATE     PROCEDURE [dbo].[USP_RoleScreen_Get]
(
 @RoleId INT
)
AS
BEGIN

SELECT

RS.RoleScreenId,
S.ScreenCode,
S.ScreenName

FROM RoleScreen RS

INNER JOIN Screen S

ON RS.ScreenId=S.ScreenId

WHERE RS.RoleId=@RoleId;

END

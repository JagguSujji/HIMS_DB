


/************************************************************
 Role Screen Permission
************************************************************/

CREATE     PROCEDURE [dbo].[USP_RoleScreen_Save]
(
 @RoleId INT,
 @ScreenId INT
)
AS
BEGIN


IF NOT EXISTS
(
SELECT 1
FROM RoleScreen
WHERE RoleId=@RoleId
AND ScreenId=@ScreenId
)

BEGIN

INSERT INTO RoleScreen
(
RoleId,
ScreenId
)

VALUES
(
@RoleId,
@ScreenId
)

END

END

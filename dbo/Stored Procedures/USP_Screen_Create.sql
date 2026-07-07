


/************************************************************
 Screen Management
************************************************************/

CREATE     PROCEDURE [dbo].[USP_Screen_Create]
(
 @ScreenCode VARCHAR(50),
 @ScreenName VARCHAR(100),
 @ModuleName VARCHAR(100)
)
AS
BEGIN

INSERT INTO Screen
(
 ScreenCode,
 ScreenName,
 ModuleName,
 IsActive
)

VALUES
(
 @ScreenCode,
 @ScreenName,
 @ModuleName,
 1
)

END

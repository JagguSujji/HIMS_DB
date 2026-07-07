



/************************************************************
 AI INTENT MANAGEMENT
************************************************************/

CREATE     PROCEDURE [dbo].[USP_AIIntent_Create]
(
 @IntentCode VARCHAR(50),
 @IntentName VARCHAR(200),
 @Description VARCHAR(500)
)
AS
BEGIN

INSERT INTO AIIntent
(
 IntentCode,
 IntentName,
 Description,
 IsActive
)
VALUES
(
 @IntentCode,
 @IntentName,
 @Description,
 1
)

END

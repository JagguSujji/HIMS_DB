


/************************************************************
 AI REQUEST RESPONSE LOGGING
************************************************************/


CREATE     PROCEDURE [dbo].[USP_AIRequest_Log]
(
 @UserId INT,
 @IntentId INT,
 @Prompt NVARCHAR(MAX),
 @ModelId INT
)
AS
BEGIN

INSERT INTO AIRequestLog
(
 UserId,
 IntentId,
 Prompt,
 ModelId,
 RequestTime
)
VALUES
(
 @UserId,
 @IntentId,
 @Prompt,
 @ModelId,
 GETDATE()
)

SELECT SCOPE_IDENTITY() RequestId

END

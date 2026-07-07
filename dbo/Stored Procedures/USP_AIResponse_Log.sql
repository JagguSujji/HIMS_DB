


CREATE     PROCEDURE [dbo].[USP_AIResponse_Log]
(
 @AIRequestLogId INT,
 @ResponseText NVARCHAR(MAX),
 @TokensUsed INT
)
AS
BEGIN

INSERT INTO AIResponseLog
(
 AIRequestLogId,
 ResponseText,
 TokensUsed,
 ResponseTime
)
VALUES
(
 @AIRequestLogId,
 @ResponseText,
 @TokensUsed,
 GETDATE()
)

END

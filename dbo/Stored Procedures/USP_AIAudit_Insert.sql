


CREATE     PROCEDURE [dbo].[USP_AIAudit_Insert]
(
 @UserId INT,
 @PromptTemplateId INT,
 @AIModelId INT,
 @TokensUsed INT,
 @Cost DECIMAL(18,4),
 @WasAccepted BIT,
 @Remarks VARCHAR(500)
)
AS
BEGIN

INSERT INTO AIAuditLog
(
 UserId,
 PromptTemplateId,
 AIModelId,
 RequestTime,
 TokensUsed,
 Cost,
 WasAccepted,
 Remarks
)
VALUES
(
 @UserId,
 @PromptTemplateId,
 @AIModelId,
 GETDATE(),
 @TokensUsed,
 @Cost,
 @WasAccepted,
 @Remarks
)

END

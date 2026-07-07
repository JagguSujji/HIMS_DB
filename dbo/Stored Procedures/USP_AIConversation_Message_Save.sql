


CREATE     PROCEDURE [dbo].[USP_AIConversation_Message_Save]
(
 @ConversationId INT,
 @Message NVARCHAR(MAX),
 @SenderType VARCHAR(50)
)
AS
BEGIN

INSERT INTO AIConversationMessage
(
 ConversationId,
 Message,
 SenderType
)
VALUES
(
 @ConversationId,
 @Message,
 @SenderType
)

END

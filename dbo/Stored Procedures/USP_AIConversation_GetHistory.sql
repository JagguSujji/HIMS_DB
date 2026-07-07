


CREATE     PROCEDURE [dbo].[USP_AIConversation_GetHistory]
(
 @ConversationId INT
)
AS
BEGIN

SELECT *
FROM AIConversationMessage
WHERE ConversationId=@ConversationId
ORDER BY MessageId

END

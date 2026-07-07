


CREATE     PROCEDURE [dbo].[USP_AIConversation_Context_Save]
(
 @ConversationId INT,
 @KeyName VARCHAR(100),
 @ValueText NVARCHAR(MAX)
)
AS
BEGIN

INSERT INTO AIConversationContext
(
 ConversationId,
 KeyName,
 ValueText,
 CreatedOn
)
VALUES
(
 @ConversationId,
 @KeyName,
 @ValueText,
 GETDATE()
)

END

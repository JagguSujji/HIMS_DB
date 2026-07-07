


/************************************************************
 AI CONVERSATION MANAGEMENT
************************************************************/


CREATE     PROCEDURE [dbo].[USP_AIConversation_Create]
(
 @UserId INT
)
AS
BEGIN

INSERT INTO ConversationSession
(
 UserId,
 StartedOn
)
VALUES
(
 @UserId,
 GETDATE()
)

SELECT SCOPE_IDENTITY() ConversationId

END

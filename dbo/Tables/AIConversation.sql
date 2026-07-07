CREATE TABLE [dbo].[AIConversation] (
    [ConversationId] BIGINT   IDENTITY (1, 1) NOT NULL,
    [UserId]         INT      NULL,
    [StartedOn]      DATETIME DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ConversationId] ASC)
);


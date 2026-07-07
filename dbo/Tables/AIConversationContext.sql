CREATE TABLE [dbo].[AIConversationContext] (
    [ContextId]      BIGINT        IDENTITY (1, 1) NOT NULL,
    [ConversationId] BIGINT        NULL,
    [KeyName]        VARCHAR (100) NULL,
    [ValueText]      TEXT          NULL,
    [CreatedOn]      DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ContextId] ASC)
);


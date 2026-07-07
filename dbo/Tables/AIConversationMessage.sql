CREATE TABLE [dbo].[AIConversationMessage] (
    [MessageId]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [ConversationId] BIGINT         NULL,
    [Message]        NVARCHAR (MAX) NULL,
    [SenderType]     VARCHAR (20)   NULL,
    PRIMARY KEY CLUSTERED ([MessageId] ASC)
);


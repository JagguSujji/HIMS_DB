CREATE TABLE [dbo].[ConversationSession] (
    [SessionId] INT      NOT NULL,
    [UserId]    INT      NULL,
    [StartedOn] DATETIME NULL,
    [EndedOn]   DATETIME NULL,
    PRIMARY KEY CLUSTERED ([SessionId] ASC)
);


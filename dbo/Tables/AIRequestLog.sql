CREATE TABLE [dbo].[AIRequestLog] (
    [AIRequestLogId] INT            IDENTITY (1, 1) NOT NULL,
    [UserId]         INT            NULL,
    [IntentId]       INT            NULL,
    [Prompt]         NVARCHAR (MAX) NULL,
    [ModelId]        INT            NULL,
    [RequestTime]    DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([AIRequestLogId] ASC)
);


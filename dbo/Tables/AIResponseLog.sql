CREATE TABLE [dbo].[AIResponseLog] (
    [AIResponseLogId] INT            IDENTITY (1, 1) NOT NULL,
    [AIRequestLogId]  INT            NULL,
    [ResponseText]    NVARCHAR (MAX) NULL,
    [TokensUsed]      INT            NULL,
    [ResponseTime]    DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([AIResponseLogId] ASC)
);


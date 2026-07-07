CREATE TABLE [dbo].[AIAuditLog] (
    [AuditId]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [UserId]           INT             NULL,
    [PromptTemplateId] BIGINT          NULL,
    [AIModelId]        INT             NULL,
    [RequestTime]      DATETIME2 (7)   NULL,
    [ResponseTime]     DATETIME2 (7)   NULL,
    [TokensUsed]       INT             NULL,
    [Cost]             DECIMAL (18, 4) NULL,
    [WasAccepted]      BIT             NULL,
    [Remarks]          NVARCHAR (MAX)  NULL,
    PRIMARY KEY CLUSTERED ([AuditId] ASC)
);


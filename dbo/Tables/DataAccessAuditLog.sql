CREATE TABLE [dbo].[DataAccessAuditLog] (
    [AccessLogId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserId]      BIGINT         NULL,
    [EntityName]  NVARCHAR (100) NULL,
    [EntityId]    BIGINT         NULL,
    [ActionType]  NVARCHAR (50)  NULL,
    [AccessedOn]  DATETIME2 (7)  DEFAULT (getutcdate()) NULL,
    [IPAddress]   NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([AccessLogId] ASC)
);


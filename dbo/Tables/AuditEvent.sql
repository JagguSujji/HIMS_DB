CREATE TABLE [dbo].[AuditEvent] (
    [AuditId]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [EventType] VARCHAR (50)  NULL,
    [TableName] VARCHAR (100) NULL,
    [RecordId]  BIGINT        NULL,
    [OldValue]  TEXT          NULL,
    [NewValue]  TEXT          NULL,
    [ChangedBy] BIGINT        NULL,
    [ChangedOn] DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AuditId] ASC)
);


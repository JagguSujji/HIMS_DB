CREATE TABLE [dbo].[EntityFieldAuditLog] (
    [AuditId]    BIGINT         IDENTITY (1, 1) NOT NULL,
    [TableName]  NVARCHAR (100) NULL,
    [ColumnName] NVARCHAR (100) NULL,
    [RecordId]   BIGINT         NULL,
    [OldValue]   NVARCHAR (MAX) NULL,
    [NewValue]   NVARCHAR (MAX) NULL,
    [ChangedBy]  BIGINT         NULL,
    [ChangedOn]  DATETIME2 (7)  DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([AuditId] ASC)
);


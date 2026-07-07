CREATE TABLE [dbo].[AuditLog] (
    [AuditId]   INT            NOT NULL,
    [TableName] VARCHAR (100)  NULL,
    [RecordId]  INT            NULL,
    [Action]    VARCHAR (50)   NULL,
    [OldValue]  NVARCHAR (MAX) NULL,
    [NewValue]  NVARCHAR (MAX) NULL,
    [ChangedOn] DATETIME       NULL,
    [ChangedBy] INT            NULL,
    PRIMARY KEY CLUSTERED ([AuditId] ASC)
);


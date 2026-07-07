CREATE TABLE [dbo].[LabQualityAuditLog] (
    [AuditId]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [EntityName]  NVARCHAR (100) NOT NULL,
    [EntityId]    BIGINT         NOT NULL,
    [ActionType]  NVARCHAR (50)  NOT NULL,
    [OldValue]    NVARCHAR (MAX) NULL,
    [NewValue]    NVARCHAR (MAX) NULL,
    [PerformedBy] BIGINT         NULL,
    [PerformedOn] DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([AuditId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_QA_Entity]
    ON [dbo].[LabQualityAuditLog]([EntityName] ASC, [EntityId] ASC);


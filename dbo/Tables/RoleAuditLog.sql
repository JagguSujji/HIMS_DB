CREATE TABLE [dbo].[RoleAuditLog] (
    [RoleAuditId] INT           IDENTITY (1, 1) NOT NULL,
    [RoleId]      INT           NULL,
    [Action]      NVARCHAR (50) NULL,
    [ChangedOn]   DATETIME      DEFAULT (getdate()) NULL,
    [ChangedBy]   INT           NULL,
    PRIMARY KEY CLUSTERED ([RoleAuditId] ASC)
);


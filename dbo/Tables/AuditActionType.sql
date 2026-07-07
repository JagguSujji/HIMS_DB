CREATE TABLE [dbo].[AuditActionType] (
    [AuditActionTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [AuditActionCode]   VARCHAR (20)   NULL,
    [AuditActionName]   NVARCHAR (100) NULL,
    [IsActive]          BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([AuditActionTypeId] ASC)
);


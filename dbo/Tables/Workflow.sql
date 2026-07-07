CREATE TABLE [dbo].[Workflow] (
    [WorkflowId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [WorkflowCode] NVARCHAR (30)  NOT NULL,
    [WorkflowName] NVARCHAR (150) NOT NULL,
    [ModuleName]   NVARCHAR (100) NOT NULL,
    [Description]  NVARCHAR (500) NULL,
    [IsActive]     BIT            CONSTRAINT [DF_Workflow_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedBy]    BIGINT         NOT NULL,
    [CreatedOn]    DATETIME2 (7)  CONSTRAINT [DF_Workflow_CreatedOn] DEFAULT (sysdatetime()) NOT NULL,
    [ModifiedBy]   BIGINT         NULL,
    [ModifiedOn]   DATETIME2 (7)  NULL,
    [DeletedBy]    BIGINT         NULL,
    [DeletedOn]    DATETIME2 (7)  NULL,
    [IsDeleted]    BIT            CONSTRAINT [DF_Workflow_IsDeleted] DEFAULT ((0)) NOT NULL,
    [RowVersion]   ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([WorkflowId] ASC),
    CONSTRAINT [UQ_Workflow_Code] UNIQUE NONCLUSTERED ([WorkflowCode] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Workflow_Module]
    ON [dbo].[Workflow]([ModuleName] ASC);


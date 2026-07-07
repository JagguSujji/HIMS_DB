CREATE TABLE [dbo].[WorkflowStep] (
    [WorkflowStepId]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [WorkflowId]         BIGINT         NOT NULL,
    [StepNumber]         INT            NOT NULL,
    [StepCode]           NVARCHAR (30)  NOT NULL,
    [StepName]           NVARCHAR (150) NOT NULL,
    [RoleId]             BIGINT         NOT NULL,
    [IsApprovalRequired] BIT            CONSTRAINT [DF_WorkflowStep_IsApprovalRequired] DEFAULT ((1)) NOT NULL,
    [CanReject]          BIT            CONSTRAINT [DF_WorkflowStep_CanReject] DEFAULT ((1)) NOT NULL,
    [CanReturn]          BIT            CONSTRAINT [DF_WorkflowStep_CanReturn] DEFAULT ((1)) NOT NULL,
    [IsFinalStep]        BIT            CONSTRAINT [DF_WorkflowStep_IsFinal] DEFAULT ((0)) NOT NULL,
    [IsActive]           BIT            CONSTRAINT [DF_WorkflowStep_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedBy]          BIGINT         NOT NULL,
    [CreatedOn]          DATETIME2 (7)  CONSTRAINT [DF_WorkflowStep_CreatedOn] DEFAULT (sysdatetime()) NOT NULL,
    [ModifiedBy]         BIGINT         NULL,
    [ModifiedOn]         DATETIME2 (7)  NULL,
    [DeletedBy]          BIGINT         NULL,
    [DeletedOn]          DATETIME2 (7)  NULL,
    [IsDeleted]          BIT            CONSTRAINT [DF_WorkflowStep_IsDeleted] DEFAULT ((0)) NOT NULL,
    [RowVersion]         ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([WorkflowStepId] ASC),
    CONSTRAINT [FK_WorkflowStep_Workflow] FOREIGN KEY ([WorkflowId]) REFERENCES [dbo].[Workflow] ([WorkflowId])
);


GO
CREATE NONCLUSTERED INDEX [IX_WorkflowStep_Workflow]
    ON [dbo].[WorkflowStep]([WorkflowId] ASC);


CREATE TABLE [dbo].[WorkflowInstance] (
    [WorkflowInstanceId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [WorkflowId]         BIGINT          NOT NULL,
    [ModuleName]         NVARCHAR (100)  NOT NULL,
    [RecordId]           BIGINT          NOT NULL,
    [CurrentStepId]      BIGINT          NOT NULL,
    [Status]             NVARCHAR (30)   NOT NULL,
    [StartedBy]          BIGINT          NOT NULL,
    [StartedOn]          DATETIME2 (7)   CONSTRAINT [DF_WorkflowInstance_StartedOn] DEFAULT (sysdatetime()) NOT NULL,
    [CompletedOn]        DATETIME2 (7)   NULL,
    [Remarks]            NVARCHAR (1000) NULL,
    [IsActive]           BIT             CONSTRAINT [DF_WorkflowInstance_IsActive] DEFAULT ((1)) NOT NULL,
    [RowVersion]         ROWVERSION      NOT NULL,
    PRIMARY KEY CLUSTERED ([WorkflowInstanceId] ASC),
    CONSTRAINT [FK_WorkflowInstance_CurrentStep] FOREIGN KEY ([CurrentStepId]) REFERENCES [dbo].[WorkflowStep] ([WorkflowStepId]),
    CONSTRAINT [FK_WorkflowInstance_Workflow] FOREIGN KEY ([WorkflowId]) REFERENCES [dbo].[Workflow] ([WorkflowId])
);


GO
CREATE NONCLUSTERED INDEX [IX_WorkflowInstance_Record]
    ON [dbo].[WorkflowInstance]([ModuleName] ASC, [RecordId] ASC);


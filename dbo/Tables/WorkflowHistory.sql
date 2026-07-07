CREATE TABLE [dbo].[WorkflowHistory] (
    [WorkflowHistoryId]  BIGINT          IDENTITY (1, 1) NOT NULL,
    [WorkflowInstanceId] BIGINT          NOT NULL,
    [WorkflowStepId]     BIGINT          NOT NULL,
    [ActionTaken]        NVARCHAR (50)   NOT NULL,
    [ActionBy]           BIGINT          NOT NULL,
    [ActionDate]         DATETIME2 (7)   CONSTRAINT [DF_WorkflowHistory_ActionDate] DEFAULT (sysdatetime()) NOT NULL,
    [Comments]           NVARCHAR (1000) NULL,
    [PreviousStatus]     NVARCHAR (30)   NULL,
    [NewStatus]          NVARCHAR (30)   NULL,
    [RowVersion]         ROWVERSION      NOT NULL,
    PRIMARY KEY CLUSTERED ([WorkflowHistoryId] ASC),
    CONSTRAINT [FK_WorkflowHistory_Instance] FOREIGN KEY ([WorkflowInstanceId]) REFERENCES [dbo].[WorkflowInstance] ([WorkflowInstanceId]),
    CONSTRAINT [FK_WorkflowHistory_Step] FOREIGN KEY ([WorkflowStepId]) REFERENCES [dbo].[WorkflowStep] ([WorkflowStepId])
);


GO
CREATE NONCLUSTERED INDEX [IX_WorkflowHistory_Instance]
    ON [dbo].[WorkflowHistory]([WorkflowInstanceId] ASC);


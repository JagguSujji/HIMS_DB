CREATE TABLE [dbo].[TaskHistory] (
    [TaskHistoryId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [TaskId]        BIGINT          NOT NULL,
    [ActionName]    NVARCHAR (100)  NOT NULL,
    [OldStatusId]   BIGINT          NULL,
    [NewStatusId]   BIGINT          NULL,
    [Remarks]       NVARCHAR (1000) NULL,
    [ActionBy]      BIGINT          NOT NULL,
    [ActionOn]      DATETIME2 (7)   CONSTRAINT [DF_TaskHistory_ActionOn] DEFAULT (sysdatetime()) NOT NULL,
    [RowVersion]    ROWVERSION      NOT NULL,
    PRIMARY KEY CLUSTERED ([TaskHistoryId] ASC),
    CONSTRAINT [FK_TaskHistory_Task] FOREIGN KEY ([TaskId]) REFERENCES [dbo].[TaskMaster] ([TaskId])
);


GO
CREATE NONCLUSTERED INDEX [IX_TaskHistory_Task]
    ON [dbo].[TaskHistory]([TaskId] ASC);


CREATE TABLE [dbo].[TaskAssignment] (
    [TaskAssignmentId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [TaskId]           BIGINT          NOT NULL,
    [AssignedToUserId] BIGINT          NOT NULL,
    [AssignedByUserId] BIGINT          NOT NULL,
    [AssignedRoleId]   BIGINT          NULL,
    [AssignedOn]       DATETIME2 (7)   CONSTRAINT [DF_TaskAssignment_AssignedOn] DEFAULT (sysdatetime()) NOT NULL,
    [AcceptedOn]       DATETIME2 (7)   NULL,
    [StartedOn]        DATETIME2 (7)   NULL,
    [CompletedOn]      DATETIME2 (7)   NULL,
    [StatusId]         BIGINT          NOT NULL,
    [Remarks]          NVARCHAR (1000) NULL,
    [IsActive]         BIT             CONSTRAINT [DF_TaskAssignment_IsActive] DEFAULT ((1)) NOT NULL,
    [RowVersion]       ROWVERSION      NOT NULL,
    PRIMARY KEY CLUSTERED ([TaskAssignmentId] ASC),
    CONSTRAINT [FK_TaskAssignment_Task] FOREIGN KEY ([TaskId]) REFERENCES [dbo].[TaskMaster] ([TaskId])
);


GO
CREATE NONCLUSTERED INDEX [IX_TaskAssignment_Task]
    ON [dbo].[TaskAssignment]([TaskId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TaskAssignment_User]
    ON [dbo].[TaskAssignment]([AssignedToUserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TaskAssignment_Status]
    ON [dbo].[TaskAssignment]([StatusId] ASC);


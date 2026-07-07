CREATE TABLE [dbo].[FeedbackAssignment] (
    [FeedbackAssignmentId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [FeedbackTicketId]     BIGINT          NOT NULL,
    [FromDepartmentId]     INT             NULL,
    [ToDepartmentId]       INT             NULL,
    [FromEmployeeId]       BIGINT          NULL,
    [ToEmployeeId]         BIGINT          NULL,
    [AssignedBy]           BIGINT          NOT NULL,
    [AssignedOn]           DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    [AcceptedOn]           DATETIME2 (7)   NULL,
    [StartedOn]            DATETIME2 (7)   NULL,
    [CompletedOn]          DATETIME2 (7)   NULL,
    [AssignmentRemarks]    NVARCHAR (1000) NULL,
    [IsCurrentAssignment]  BIT             DEFAULT ((1)) NOT NULL,
    [CreatedOn]            DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    [RowVersion]           ROWVERSION      NOT NULL,
    CONSTRAINT [PK_FeedbackAssignment] PRIMARY KEY CLUSTERED ([FeedbackAssignmentId] ASC),
    CONSTRAINT [FK_FeedbackAssignment_AssignedBy] FOREIGN KEY ([AssignedBy]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_FeedbackAssignment_FromDepartment] FOREIGN KEY ([FromDepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    CONSTRAINT [FK_FeedbackAssignment_FromEmployee] FOREIGN KEY ([FromEmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_FeedbackAssignment_Ticket] FOREIGN KEY ([FeedbackTicketId]) REFERENCES [dbo].[FeedbackTicket] ([FeedbackTicketId]),
    CONSTRAINT [FK_FeedbackAssignment_ToDepartment] FOREIGN KEY ([ToDepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    CONSTRAINT [FK_FeedbackAssignment_ToEmployee] FOREIGN KEY ([ToEmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId])
);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackAssignment_Ticket]
    ON [dbo].[FeedbackAssignment]([FeedbackTicketId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackAssignment_Current]
    ON [dbo].[FeedbackAssignment]([IsCurrentAssignment] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackAssignment_ToEmployee]
    ON [dbo].[FeedbackAssignment]([ToEmployeeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackAssignment_ToDepartment]
    ON [dbo].[FeedbackAssignment]([ToDepartmentId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackAssignment_AssignedOn]
    ON [dbo].[FeedbackAssignment]([AssignedOn] ASC);


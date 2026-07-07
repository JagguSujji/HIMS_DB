CREATE TABLE [dbo].[FeedbackActivityLog] (
    [FeedbackActivityLogId]  BIGINT          IDENTITY (1, 1) NOT NULL,
    [FeedbackTicketId]       BIGINT          NOT NULL,
    [ActivityType]           NVARCHAR (50)   NOT NULL,
    [PreviousStatusId]       INT             NULL,
    [CurrentStatusId]        INT             NULL,
    [PreviousDepartmentId]   INT             NULL,
    [CurrentDepartmentId]    INT             NULL,
    [PreviousEmployeeId]     BIGINT          NULL,
    [CurrentEmployeeId]      BIGINT          NULL,
    [ActivityDescription]    NVARCHAR (MAX)  NULL,
    [ActionTakenBy]          BIGINT          NOT NULL,
    [ActionDate]             DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    [IPAddress]              NVARCHAR (50)   NULL,
    [DeviceName]             NVARCHAR (100)  NULL,
    [BrowserName]            NVARCHAR (100)  NULL,
    [Remarks]                NVARCHAR (1000) NULL,
    [CreatedOn]              DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    [RowVersion]             ROWVERSION      NOT NULL,
    [FeedbackActivityTypeId] INT             NOT NULL,
    CONSTRAINT [PK_FeedbackActivityLog] PRIMARY KEY CLUSTERED ([FeedbackActivityLogId] ASC),
    CONSTRAINT [FK_FeedbackActivityLog_ActionTakenBy] FOREIGN KEY ([ActionTakenBy]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_FeedbackActivityLog_CurrentDepartment] FOREIGN KEY ([CurrentDepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    CONSTRAINT [FK_FeedbackActivityLog_CurrentEmployee] FOREIGN KEY ([CurrentEmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_FeedbackActivityLog_CurrentStatus] FOREIGN KEY ([CurrentStatusId]) REFERENCES [dbo].[FeedbackStatus] ([FeedbackStatusId]),
    CONSTRAINT [FK_FeedbackActivityLog_PreviousDepartment] FOREIGN KEY ([PreviousDepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    CONSTRAINT [FK_FeedbackActivityLog_PreviousEmployee] FOREIGN KEY ([PreviousEmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_FeedbackActivityLog_PreviousStatus] FOREIGN KEY ([PreviousStatusId]) REFERENCES [dbo].[FeedbackStatus] ([FeedbackStatusId]),
    CONSTRAINT [FK_FeedbackActivityLog_Ticket] FOREIGN KEY ([FeedbackTicketId]) REFERENCES [dbo].[FeedbackTicket] ([FeedbackTicketId])
);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackActivityLog_Ticket]
    ON [dbo].[FeedbackActivityLog]([FeedbackTicketId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackActivityLog_ActionDate]
    ON [dbo].[FeedbackActivityLog]([ActionDate] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackActivityLog_ActivityType]
    ON [dbo].[FeedbackActivityLog]([ActivityType] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackActivityLog_ActionTakenBy]
    ON [dbo].[FeedbackActivityLog]([ActionTakenBy] ASC);


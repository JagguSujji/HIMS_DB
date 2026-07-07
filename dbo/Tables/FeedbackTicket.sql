CREATE TABLE [dbo].[FeedbackTicket] (
    [FeedbackTicketId]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [TicketNumber]              NVARCHAR (30)  NOT NULL,
    [PatientId]                 BIGINT         NULL,
    [VisitId]                   BIGINT         NULL,
    [AdmissionId]               BIGINT         NULL,
    [EncounterId]               BIGINT         NULL,
    [FeedbackTypeId]            INT            NOT NULL,
    [FeedbackSourceId]          INT            NOT NULL,
    [FeedbackCategoryId]        INT            NOT NULL,
    [FeedbackStatusId]          INT            NOT NULL,
    [PriorityLevelId]           INT            NOT NULL,
    [DepartmentId]              INT            NULL,
    [CurrentAssignedEmployeeId] BIGINT         NULL,
    [Subject]                   NVARCHAR (250) NOT NULL,
    [Description]               NVARCHAR (MAX) NOT NULL,
    [Rating]                    DECIMAL (3, 2) NULL,
    [IncidentDate]              DATETIME2 (7)  NULL,
    [ExpectedResponseOn]        DATETIME2 (7)  NULL,
    [ExpectedResolutionOn]      DATETIME2 (7)  NULL,
    [FirstResponseOn]           DATETIME2 (7)  NULL,
    [ResolvedOn]                DATETIME2 (7)  NULL,
    [ClosedOn]                  DATETIME2 (7)  NULL,
    [IsAnonymous]               BIT            DEFAULT ((0)) NOT NULL,
    [IsPatientSatisfied]        BIT            NULL,
    [ReportedByName]            NVARCHAR (150) NULL,
    [ReportedMobile]            NVARCHAR (20)  NULL,
    [ReportedEmail]             NVARCHAR (150) NULL,
    [ResolutionSummary]         NVARCHAR (MAX) NULL,
    [ClosedBy]                  BIGINT         NULL,
    [IsActive]                  BIT            DEFAULT ((1)) NOT NULL,
    [Remarks]                   NVARCHAR (500) NULL,
    [CreatedBy]                 BIGINT         NULL,
    [CreatedOn]                 DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    [ModifiedBy]                BIGINT         NULL,
    [ModifiedOn]                DATETIME2 (7)  NULL,
    [RowVersion]                ROWVERSION     NOT NULL,
    CONSTRAINT [PK_FeedbackTicket] PRIMARY KEY CLUSTERED ([FeedbackTicketId] ASC),
    CONSTRAINT [FK_FeedbackTicket_Admission] FOREIGN KEY ([AdmissionId]) REFERENCES [dbo].[Admission] ([AdmissionId]),
    CONSTRAINT [FK_FeedbackTicket_AssignedEmployee] FOREIGN KEY ([CurrentAssignedEmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_FeedbackTicket_Category] FOREIGN KEY ([FeedbackCategoryId]) REFERENCES [dbo].[FeedbackCategory] ([FeedbackCategoryId]),
    CONSTRAINT [FK_FeedbackTicket_ClosedBy] FOREIGN KEY ([ClosedBy]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_FeedbackTicket_Department] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    CONSTRAINT [FK_FeedbackTicket_Encounter] FOREIGN KEY ([EncounterId]) REFERENCES [dbo].[Encounter] ([EncounterId]),
    CONSTRAINT [FK_FeedbackTicket_Patient] FOREIGN KEY ([PatientId]) REFERENCES [dbo].[Patient] ([PatientId]),
    CONSTRAINT [FK_FeedbackTicket_Priority] FOREIGN KEY ([PriorityLevelId]) REFERENCES [dbo].[PriorityLevel] ([PriorityLevelId]),
    CONSTRAINT [FK_FeedbackTicket_Source] FOREIGN KEY ([FeedbackSourceId]) REFERENCES [dbo].[FeedbackSource] ([FeedbackSourceId]),
    CONSTRAINT [FK_FeedbackTicket_Status] FOREIGN KEY ([FeedbackStatusId]) REFERENCES [dbo].[FeedbackStatus] ([FeedbackStatusId]),
    CONSTRAINT [FK_FeedbackTicket_Type] FOREIGN KEY ([FeedbackTypeId]) REFERENCES [dbo].[FeedbackType] ([FeedbackTypeId]),
    CONSTRAINT [FK_FeedbackTicket_Visit] FOREIGN KEY ([VisitId]) REFERENCES [dbo].[Visit] ([VisitId]),
    CONSTRAINT [UQ_FeedbackTicket_TicketNumber] UNIQUE NONCLUSTERED ([TicketNumber] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackTicket_Status]
    ON [dbo].[FeedbackTicket]([FeedbackStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackTicket_Category]
    ON [dbo].[FeedbackTicket]([FeedbackCategoryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackTicket_Department]
    ON [dbo].[FeedbackTicket]([DepartmentId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackTicket_AssignedEmployee]
    ON [dbo].[FeedbackTicket]([CurrentAssignedEmployeeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackTicket_Patient]
    ON [dbo].[FeedbackTicket]([PatientId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackTicket_CreatedOn]
    ON [dbo].[FeedbackTicket]([CreatedOn] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackTicket_Priority]
    ON [dbo].[FeedbackTicket]([PriorityLevelId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FeedbackTicket_TicketNumber]
    ON [dbo].[FeedbackTicket]([TicketNumber] ASC);


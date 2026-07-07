CREATE TABLE [dbo].[OTSchedule] (
    [OTScheduleId]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [OTId]               BIGINT        NOT NULL,
    [SurgeryId]          BIGINT        NOT NULL,
    [PatientId]          BIGINT        NOT NULL,
    [ScheduledDate]      DATETIME2 (7) NOT NULL,
    [EstimatedStartTime] DATETIME2 (7) NULL,
    [EstimatedEndTime]   DATETIME2 (7) NULL,
    [ActualStartTime]    DATETIME2 (7) NULL,
    [ActualEndTime]      DATETIME2 (7) NULL,
    [Status]             NVARCHAR (30) DEFAULT ('SCHEDULED') NOT NULL,
    [Priority]           NVARCHAR (30) DEFAULT ('NORMAL') NOT NULL,
    [CreatedOn]          DATETIME2 (7) DEFAULT (sysdatetime()) NOT NULL,
    [OTDate]             DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([OTScheduleId] ASC),
    CONSTRAINT [FK_OTSchedule_OT] FOREIGN KEY ([OTId]) REFERENCES [dbo].[OperatingTheatre] ([OTId])
);


GO
CREATE NONCLUSTERED INDEX [IX_OTSchedule_OT]
    ON [dbo].[OTSchedule]([OTId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_OTSchedule_Date]
    ON [dbo].[OTSchedule]([ScheduledDate] ASC);


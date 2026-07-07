CREATE TABLE [dbo].[OTSurgicalProcedureLog] (
    [ProcedureLogId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [OTScheduleId]   BIGINT          NOT NULL,
    [EventTime]      DATETIME2 (7)   NOT NULL,
    [EventType]      NVARCHAR (50)   NOT NULL,
    [Description]    NVARCHAR (1000) NULL,
    [RecordedBy]     BIGINT          NULL,
    PRIMARY KEY CLUSTERED ([ProcedureLogId] ASC),
    CONSTRAINT [FK_OTProcedure_Schedule] FOREIGN KEY ([OTScheduleId]) REFERENCES [dbo].[OTSchedule] ([OTScheduleId])
);


GO
CREATE NONCLUSTERED INDEX [IX_OTProcedure_Schedule]
    ON [dbo].[OTSurgicalProcedureLog]([OTScheduleId] ASC);


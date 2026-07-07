CREATE TABLE [dbo].[OTRecoveryRecord] (
    [RecoveryId]         BIGINT         IDENTITY (1, 1) NOT NULL,
    [OTScheduleId]       BIGINT         NOT NULL,
    [RecoveryStartTime]  DATETIME2 (7)  NOT NULL,
    [RecoveryEndTime]    DATETIME2 (7)  NULL,
    [PainScore]          INT            NULL,
    [ConsciousnessLevel] NVARCHAR (50)  NULL,
    [Status]             NVARCHAR (30)  DEFAULT ('IN_RECOVERY') NOT NULL,
    [Notes]              NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([RecoveryId] ASC),
    CONSTRAINT [FK_OTRecovery_Schedule] FOREIGN KEY ([OTScheduleId]) REFERENCES [dbo].[OTSchedule] ([OTScheduleId])
);


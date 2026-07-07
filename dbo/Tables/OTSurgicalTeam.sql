CREATE TABLE [dbo].[OTSurgicalTeam] (
    [TeamId]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [OTScheduleId] BIGINT        NOT NULL,
    [ProviderId]   BIGINT        NOT NULL,
    [Role]         NVARCHAR (50) NOT NULL,
    [IsLead]       BIT           DEFAULT ((0)) NOT NULL,
    [AssignedOn]   DATETIME2 (7) DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([TeamId] ASC),
    CONSTRAINT [FK_OTTeam_Schedule] FOREIGN KEY ([OTScheduleId]) REFERENCES [dbo].[OTSchedule] ([OTScheduleId])
);


GO
CREATE NONCLUSTERED INDEX [IX_OTTeam_Schedule]
    ON [dbo].[OTSurgicalTeam]([OTScheduleId] ASC);


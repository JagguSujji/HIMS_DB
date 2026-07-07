CREATE TABLE [dbo].[OTAnesthesiaRecord] (
    [AnesthesiaId]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [OTScheduleId]     BIGINT         NOT NULL,
    [AnesthesiaTypeId] BIGINT         NOT NULL,
    [InductionTime]    DATETIME2 (7)  NULL,
    [RecoveryTime]     DATETIME2 (7)  NULL,
    [ASAClass]         NVARCHAR (10)  NULL,
    [Notes]            NVARCHAR (MAX) NULL,
    [CreatedOn]        DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([AnesthesiaId] ASC),
    CONSTRAINT [FK_OTAnesthesia_Schedule] FOREIGN KEY ([OTScheduleId]) REFERENCES [dbo].[OTSchedule] ([OTScheduleId])
);


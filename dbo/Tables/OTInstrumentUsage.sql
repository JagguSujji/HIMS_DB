CREATE TABLE [dbo].[OTInstrumentUsage] (
    [InstrumentUsageId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [OTScheduleId]        BIGINT         NOT NULL,
    [InstrumentSetId]     BIGINT         NOT NULL,
    [IssuedOn]            DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    [ReturnedOn]          DATETIME2 (7)  NULL,
    [SterilizationStatus] NVARCHAR (30)  DEFAULT ('PENDING') NOT NULL,
    [Remarks]             NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([InstrumentUsageId] ASC),
    CONSTRAINT [FK_OTInstrument_Schedule] FOREIGN KEY ([OTScheduleId]) REFERENCES [dbo].[OTSchedule] ([OTScheduleId])
);


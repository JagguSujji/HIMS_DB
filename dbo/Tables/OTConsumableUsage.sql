CREATE TABLE [dbo].[OTConsumableUsage] (
    [ConsumableUsageId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [OTScheduleId]      BIGINT          NOT NULL,
    [ItemId]            BIGINT          NOT NULL,
    [Quantity]          DECIMAL (10, 2) NOT NULL,
    [BatchId]           BIGINT          NULL,
    [UsedAt]            DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ConsumableUsageId] ASC),
    CONSTRAINT [FK_OTConsumable_Schedule] FOREIGN KEY ([OTScheduleId]) REFERENCES [dbo].[OTSchedule] ([OTScheduleId])
);


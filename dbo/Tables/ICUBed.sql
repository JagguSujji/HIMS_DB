CREATE TABLE [dbo].[ICUBed] (
    [ICUBedId]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [ICUUnitId]           BIGINT        NOT NULL,
    [BedId]               BIGINT        NOT NULL,
    [BedCategory]         NVARCHAR (50) NULL,
    [IsVentilatorReady]   BIT           DEFAULT ((0)) NOT NULL,
    [IsMonitoringEnabled] BIT           DEFAULT ((1)) NOT NULL,
    [Status]              NVARCHAR (30) DEFAULT ('AVAILABLE') NOT NULL,
    [CreatedOn]           DATETIME2 (7) DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ICUBedId] ASC),
    CONSTRAINT [FK_ICUBed_Unit] FOREIGN KEY ([ICUUnitId]) REFERENCES [dbo].[ICUUnit] ([ICUUnitId])
);


GO
CREATE NONCLUSTERED INDEX [IX_ICUBed_Unit]
    ON [dbo].[ICUBed]([ICUUnitId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ICUBed_Status]
    ON [dbo].[ICUBed]([Status] ASC);


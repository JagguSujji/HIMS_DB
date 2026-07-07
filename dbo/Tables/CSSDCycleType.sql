CREATE TABLE [dbo].[CSSDCycleType] (
    [CycleTypeId]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [CycleCode]       NVARCHAR (30)  NOT NULL,
    [CycleName]       NVARCHAR (150) NOT NULL,
    [Description]     NVARCHAR (500) NULL,
    [TemperatureMin]  DECIMAL (5, 2) NULL,
    [TemperatureMax]  DECIMAL (5, 2) NULL,
    [PressureLevel]   NVARCHAR (50)  NULL,
    [DurationMinutes] INT            NULL,
    [IsActive]        BIT            DEFAULT ((1)) NOT NULL,
    [CreatedOn]       DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([CycleTypeId] ASC),
    CONSTRAINT [UQ_CSSD_CycleCode] UNIQUE NONCLUSTERED ([CycleCode] ASC)
);


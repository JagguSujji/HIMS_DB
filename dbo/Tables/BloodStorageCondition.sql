CREATE TABLE [dbo].[BloodStorageCondition] (
    [BloodStorageConditionId] INT            IDENTITY (1, 1) NOT NULL,
    [ConditionCode]           VARCHAR (20)   NULL,
    [ConditionName]           NVARCHAR (100) NULL,
    [TemperatureRange]        NVARCHAR (100) NULL,
    [IsActive]                BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([BloodStorageConditionId] ASC)
);


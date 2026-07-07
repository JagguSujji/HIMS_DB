CREATE TABLE [dbo].[DrugStorageCondition] (
    [DrugStorageConditionId] INT            IDENTITY (1, 1) NOT NULL,
    [StorageCode]            VARCHAR (20)   NULL,
    [StorageName]            NVARCHAR (100) NULL,
    [TemperatureRange]       NVARCHAR (100) NULL,
    [IsActive]               BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([DrugStorageConditionId] ASC)
);


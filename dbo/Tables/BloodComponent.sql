CREATE TABLE [dbo].[BloodComponent] (
    [BloodComponentId]   INT            IDENTITY (1, 1) NOT NULL,
    [BloodComponentCode] VARCHAR (20)   NULL,
    [BloodComponentName] NVARCHAR (100) NULL,
    [StorageTemperature] NVARCHAR (100) NULL,
    [ShelfLifeDays]      INT            NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([BloodComponentId] ASC)
);


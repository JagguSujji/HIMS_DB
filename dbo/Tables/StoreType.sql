CREATE TABLE [dbo].[StoreType] (
    [StoreTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [StoreTypeCode] VARCHAR (20)   NULL,
    [StoreTypeName] NVARCHAR (100) NULL,
    [IsActive]      BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([StoreTypeId] ASC)
);


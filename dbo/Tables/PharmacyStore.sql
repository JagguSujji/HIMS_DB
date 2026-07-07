CREATE TABLE [dbo].[PharmacyStore] (
    [StoreId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [StoreCode] NVARCHAR (30)  NOT NULL,
    [StoreName] NVARCHAR (150) NOT NULL,
    [BranchId]  BIGINT         NULL,
    [Location]  NVARCHAR (200) NULL,
    [StoreType] NVARCHAR (30)  DEFAULT ('MAIN') NOT NULL,
    [IsActive]  BIT            DEFAULT ((1)) NOT NULL,
    [CreatedOn] DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([StoreId] ASC),
    CONSTRAINT [UQ_PharmacyStore_Code] UNIQUE NONCLUSTERED ([StoreCode] ASC)
);


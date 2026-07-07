CREATE TABLE [dbo].[SupplierMaster] (
    [SupplierId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [SupplierName] NVARCHAR (200) NULL,
    [Contact]      NVARCHAR (100) NULL,
    [Email]        NVARCHAR (100) NULL,
    [IsActive]     BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([SupplierId] ASC)
);


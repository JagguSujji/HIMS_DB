CREATE TABLE [dbo].[PurchaseType] (
    [PurchaseTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [PurchaseTypeCode] VARCHAR (20)   NULL,
    [PurchaseTypeName] NVARCHAR (100) NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([PurchaseTypeId] ASC),
    UNIQUE NONCLUSTERED ([PurchaseTypeCode] ASC)
);


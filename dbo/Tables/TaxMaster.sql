CREATE TABLE [dbo].[TaxMaster] (
    [TaxId]    INT            IDENTITY (1, 1) NOT NULL,
    [TaxName]  NVARCHAR (100) NULL,
    [TaxRate]  DECIMAL (5, 2) NULL,
    [IsActive] BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([TaxId] ASC)
);


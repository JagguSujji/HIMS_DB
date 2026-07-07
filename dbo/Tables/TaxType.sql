CREATE TABLE [dbo].[TaxType] (
    [TaxTypeId]     INT            IDENTITY (1, 1) NOT NULL,
    [TaxCode]       VARCHAR (20)   NULL,
    [TaxName]       NVARCHAR (100) NULL,
    [TaxPercentage] DECIMAL (8, 2) NULL,
    [IsActive]      BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([TaxTypeId] ASC)
);


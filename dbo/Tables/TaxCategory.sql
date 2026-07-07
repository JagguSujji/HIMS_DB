CREATE TABLE [dbo].[TaxCategory] (
    [TaxCategoryId]   INT            IDENTITY (1, 1) NOT NULL,
    [TaxCategoryCode] VARCHAR (20)   NULL,
    [TaxCategoryName] NVARCHAR (100) NULL,
    [TaxTypeId]       INT            NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([TaxCategoryId] ASC),
    FOREIGN KEY ([TaxTypeId]) REFERENCES [dbo].[TaxType] ([TaxTypeId])
);


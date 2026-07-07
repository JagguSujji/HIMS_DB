CREATE TABLE [dbo].[Currency] (
    [CurrencyId]     INT            IDENTITY (1, 1) NOT NULL,
    [CurrencyCode]   VARCHAR (10)   NULL,
    [CurrencyName]   NVARCHAR (100) NULL,
    [CurrencySymbol] VARCHAR (10)   NULL,
    [DecimalPlaces]  INT            DEFAULT ((2)) NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([CurrencyId] ASC)
);


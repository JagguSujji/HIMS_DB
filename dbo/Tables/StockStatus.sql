CREATE TABLE [dbo].[StockStatus] (
    [StockStatusId]   INT            IDENTITY (1, 1) NOT NULL,
    [StockStatusCode] VARCHAR (20)   NULL,
    [StockStatusName] NVARCHAR (100) NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([StockStatusId] ASC)
);


CREATE TABLE [dbo].[DrugStockBatch] (
    [BatchId]     INT           NOT NULL,
    [DrugId]      INT           NULL,
    [BatchNumber] VARCHAR (100) NULL,
    [ExpiryDate]  DATE          NULL,
    [Quantity]    INT           NULL,
    PRIMARY KEY CLUSTERED ([BatchId] ASC)
);


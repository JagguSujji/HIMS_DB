CREATE TABLE [dbo].[StockLedger] (
    [StockLedgerId]   BIGINT   IDENTITY (1, 1) NOT NULL,
    [ItemId]          INT      NULL,
    [Quantity]        INT      NULL,
    [TransactionDate] DATETIME NULL,
    PRIMARY KEY CLUSTERED ([StockLedgerId] ASC)
);


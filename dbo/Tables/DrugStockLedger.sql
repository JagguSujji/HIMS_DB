CREATE TABLE [dbo].[DrugStockLedger] (
    [StockLedgerId]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [DrugId]          BIGINT          NOT NULL,
    [BatchId]         BIGINT          NULL,
    [StoreId]         BIGINT          NOT NULL,
    [TransactionType] NVARCHAR (30)   NOT NULL,
    [Quantity]        DECIMAL (18, 2) NOT NULL,
    [UnitCost]        DECIMAL (18, 2) NULL,
    [ReferenceType]   NVARCHAR (50)   NULL,
    [ReferenceId]     BIGINT          NULL,
    [TransactionDate] DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([StockLedgerId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_StockLedger_Drug]
    ON [dbo].[DrugStockLedger]([DrugId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_StockLedger_Store]
    ON [dbo].[DrugStockLedger]([StoreId] ASC);


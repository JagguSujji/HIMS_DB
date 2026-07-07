CREATE TABLE [dbo].[DrugStockBalance] (
    [StockBalanceId]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [DrugId]            BIGINT          NOT NULL,
    [StoreId]           BIGINT          NOT NULL,
    [BatchId]           BIGINT          NULL,
    [QuantityAvailable] DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [QuantityReserved]  DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [ExpiryDate]        DATE            NULL,
    [LastUpdated]       DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([StockBalanceId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_StockBalance_Unique]
    ON [dbo].[DrugStockBalance]([DrugId] ASC, [StoreId] ASC, [BatchId] ASC);


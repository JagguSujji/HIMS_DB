CREATE TABLE [dbo].[DrugStockMovement] (
    [MovementId]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [DrugId]        BIGINT          NOT NULL,
    [BatchId]       BIGINT          NULL,
    [FromStoreId]   BIGINT          NULL,
    [ToStoreId]     BIGINT          NULL,
    [MovementType]  NVARCHAR (30)   NOT NULL,
    [Quantity]      DECIMAL (18, 2) NOT NULL,
    [ReferenceType] NVARCHAR (50)   NULL,
    [ReferenceId]   BIGINT          NULL,
    [MovementDate]  DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([MovementId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_StockMovement_Drug]
    ON [dbo].[DrugStockMovement]([DrugId] ASC);


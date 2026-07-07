CREATE TABLE [dbo].[InventoryTransaction] (
    [TransactionId]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [ItemId]          BIGINT          NOT NULL,
    [StoreId]         BIGINT          NULL,
    [BatchId]         BIGINT          NULL,
    [TransactionType] VARCHAR (30)    NULL,
    [Quantity]        DECIMAL (18, 2) NULL,
    [ReferenceType]   VARCHAR (50)    NULL,
    [ReferenceId]     BIGINT          NULL,
    [TransactionDate] DATETIME        DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([TransactionId] ASC)
);


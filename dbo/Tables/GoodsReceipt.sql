CREATE TABLE [dbo].[GoodsReceipt] (
    [GRNId]           BIGINT   IDENTITY (1, 1) NOT NULL,
    [PurchaseOrderId] BIGINT   NULL,
    [ReceivedDate]    DATETIME NULL,
    PRIMARY KEY CLUSTERED ([GRNId] ASC)
);


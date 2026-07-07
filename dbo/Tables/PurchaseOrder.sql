CREATE TABLE [dbo].[PurchaseOrder] (
    [PurchaseOrderId] BIGINT   IDENTITY (1, 1) NOT NULL,
    [VendorId]        INT      NULL,
    [OrderDate]       DATETIME NULL,
    PRIMARY KEY CLUSTERED ([PurchaseOrderId] ASC)
);


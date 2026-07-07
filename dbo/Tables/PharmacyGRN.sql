CREATE TABLE [dbo].[PharmacyGRN] (
    [GRNId]           BIGINT          IDENTITY (1, 1) NOT NULL,
    [PurchaseOrderId] BIGINT          NULL,
    [StoreId]         BIGINT          NOT NULL,
    [ReceivedDate]    DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    [ReceivedBy]      BIGINT          NULL,
    [InvoiceNumber]   NVARCHAR (100)  NULL,
    [TotalAmount]     DECIMAL (18, 2) NULL,
    PRIMARY KEY CLUSTERED ([GRNId] ASC)
);


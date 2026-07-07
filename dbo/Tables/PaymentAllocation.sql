CREATE TABLE [dbo].[PaymentAllocation] (
    [PaymentAllocationId] INT             IDENTITY (1, 1) NOT NULL,
    [PaymentId]           INT             NULL,
    [InvoiceId]           INT             NULL,
    [AllocatedAmount]     DECIMAL (18, 2) NULL,
    [CreatedOn]           DATETIME        DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([PaymentAllocationId] ASC)
);


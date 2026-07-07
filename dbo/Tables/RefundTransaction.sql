CREATE TABLE [dbo].[RefundTransaction] (
    [RefundId]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [PaymentId]  BIGINT          NOT NULL,
    [Amount]     DECIMAL (18, 2) NULL,
    [Reason]     NVARCHAR (500)  NULL,
    [RefundedOn] DATETIME2 (7)   DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([RefundId] ASC)
);


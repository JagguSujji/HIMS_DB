CREATE TABLE [dbo].[Payment] (
    [PaymentId]            BIGINT          IDENTITY (1, 1) NOT NULL,
    [BillId]               BIGINT          NULL,
    [PaymentDate]          DATETIME        NULL,
    [Amount]               DECIMAL (18, 2) NULL,
    [PaymentModeId]        INT             NULL,
    [TransactionReference] NVARCHAR (100)  NULL,
    [ReceivedBy]           INT             NULL,
    [PaymentStatusId]      INT             NULL,
    [CurrencyId]           BIGINT          NULL,
    [ExchangeRate]         DECIMAL (10, 4) DEFAULT ((1)) NULL,
    [PaymentGateway]       VARCHAR (50)    NULL,
    PRIMARY KEY CLUSTERED ([PaymentId] ASC)
);


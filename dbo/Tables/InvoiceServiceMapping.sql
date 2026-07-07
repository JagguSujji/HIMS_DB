CREATE TABLE [dbo].[InvoiceServiceMapping] (
    [MappingId]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [InvoiceId]   BIGINT          NULL,
    [ServiceId]   BIGINT          NULL,
    [EncounterId] BIGINT          NULL,
    [Quantity]    INT             NULL,
    [Amount]      DECIMAL (18, 2) NULL,
    PRIMARY KEY CLUSTERED ([MappingId] ASC)
);


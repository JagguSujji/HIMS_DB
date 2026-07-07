CREATE TABLE [dbo].[InvoiceLineItem] (
    [InvoiceLineId]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [InvoiceId]       BIGINT          NOT NULL,
    [ServiceId]       BIGINT          NULL,
    [ItemDescription] NVARCHAR (300)  NOT NULL,
    [Quantity]        DECIMAL (18, 2) DEFAULT ((1)) NOT NULL,
    [UnitPrice]       DECIMAL (18, 2) NOT NULL,
    [Amount]          DECIMAL (18, 2) NOT NULL,
    [ServiceName]     VARCHAR (50)    NULL,
    PRIMARY KEY CLUSTERED ([InvoiceLineId] ASC)
);


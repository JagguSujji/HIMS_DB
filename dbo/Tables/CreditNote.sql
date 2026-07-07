CREATE TABLE [dbo].[CreditNote] (
    [CreditNoteId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [InvoiceId]    BIGINT          NOT NULL,
    [Amount]       DECIMAL (18, 2) NULL,
    [Reason]       NVARCHAR (500)  NULL,
    [CreatedOn]    DATETIME2 (7)   DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([CreditNoteId] ASC)
);


CREATE TABLE [dbo].[InvoiceHeader] (
    [InvoiceId]       INT             NOT NULL,
    [PatientId]       INT             NULL,
    [VisitId]         INT             NULL,
    [TotalAmount]     DECIMAL (10, 2) NULL,
    [Status]          VARCHAR (50)    NULL,
    [CreatedOn]       DATETIME        NULL,
    [DiscountAmount]  DECIMAL (18, 2) DEFAULT ((0)) NULL,
    [TaxAmount]       DECIMAL (18, 2) DEFAULT ((0)) NULL,
    [InsuranceAmount] DECIMAL (18, 2) DEFAULT ((0)) NULL,
    [PaidAmount]      DECIMAL (18, 2) DEFAULT ((0)) NULL,
    [BalanceAmount]   AS              ([TotalAmount]-isnull([PaidAmount],(0))),
    PRIMARY KEY CLUSTERED ([InvoiceId] ASC)
);


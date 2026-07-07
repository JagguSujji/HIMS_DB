CREATE TABLE [dbo].[PaymentTerm] (
    [PaymentTermId]   INT            IDENTITY (1, 1) NOT NULL,
    [PaymentTermCode] VARCHAR (20)   NULL,
    [PaymentTermName] NVARCHAR (100) NULL,
    [DueDays]         INT            NULL,
    [IsAdvance]       BIT            NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([PaymentTermId] ASC)
);


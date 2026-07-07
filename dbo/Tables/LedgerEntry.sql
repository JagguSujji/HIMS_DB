CREATE TABLE [dbo].[LedgerEntry] (
    [LedgerEntryId] INT             IDENTITY (1, 1) NOT NULL,
    [AccountId]     INT             NULL,
    [EntryDate]     DATETIME        DEFAULT (getdate()) NULL,
    [DebitAmount]   DECIMAL (18, 2) DEFAULT ((0)) NULL,
    [CreditAmount]  DECIMAL (18, 2) DEFAULT ((0)) NULL,
    [ReferenceType] NVARCHAR (50)   NULL,
    [ReferenceId]   INT             NULL,
    [Description]   NVARCHAR (500)  NULL,
    PRIMARY KEY CLUSTERED ([LedgerEntryId] ASC),
    FOREIGN KEY ([AccountId]) REFERENCES [dbo].[ChartOfAccounts] ([AccountId])
);


CREATE TABLE [dbo].[ChartOfAccounts] (
    [AccountId]   INT            IDENTITY (1, 1) NOT NULL,
    [AccountCode] NVARCHAR (50)  NOT NULL,
    [AccountName] NVARCHAR (200) NOT NULL,
    [AccountType] NVARCHAR (50)  NULL,
    [IsActive]    BIT            DEFAULT ((1)) NULL,
    [CreatedOn]   DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([AccountId] ASC)
);


CREATE TABLE [dbo].[DrugExpiryAlert] (
    [ExpiryAlertId] BIGINT        IDENTITY (1, 1) NOT NULL,
    [DrugId]        BIGINT        NOT NULL,
    [BatchId]       BIGINT        NOT NULL,
    [StoreId]       BIGINT        NOT NULL,
    [ExpiryDate]    DATE          NOT NULL,
    [AlertType]     NVARCHAR (30) NOT NULL,
    [IsResolved]    BIT           DEFAULT ((0)) NOT NULL,
    [CreatedOn]     DATETIME2 (7) DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ExpiryAlertId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ExpiryAlert_Status]
    ON [dbo].[DrugExpiryAlert]([IsResolved] ASC);


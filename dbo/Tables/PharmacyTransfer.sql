CREATE TABLE [dbo].[PharmacyTransfer] (
    [TransferId]  BIGINT          IDENTITY (1, 1) NOT NULL,
    [FromStoreId] BIGINT          NOT NULL,
    [ToStoreId]   BIGINT          NOT NULL,
    [DrugId]      BIGINT          NOT NULL,
    [BatchId]     BIGINT          NULL,
    [Quantity]    DECIMAL (18, 2) NOT NULL,
    [Status]      NVARCHAR (30)   DEFAULT ('PENDING') NOT NULL,
    [RequestedBy] BIGINT          NULL,
    [ApprovedBy]  BIGINT          NULL,
    [RequestedOn] DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([TransferId] ASC)
);


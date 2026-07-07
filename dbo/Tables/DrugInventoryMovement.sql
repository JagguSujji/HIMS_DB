CREATE TABLE [dbo].[DrugInventoryMovement] (
    [MovementId]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [DrugId]       BIGINT        NOT NULL,
    [BatchId]      BIGINT        NULL,
    [MovementType] NVARCHAR (50) NULL,
    [Quantity]     INT           NULL,
    [ReferenceId]  BIGINT        NULL,
    [MovementDate] DATETIME2 (7) DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([MovementId] ASC)
);


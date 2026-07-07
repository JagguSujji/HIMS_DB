CREATE TABLE [dbo].[StockMovement] (
    [MovementId]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [ItemId]        BIGINT          NULL,
    [Quantity]      DECIMAL (10, 2) NULL,
    [MovementType]  NVARCHAR (50)   NULL,
    [ReferenceType] NVARCHAR (100)  NULL,
    [ReferenceId]   BIGINT          NULL,
    [MovementDate]  DATETIME2 (7)   DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([MovementId] ASC)
);


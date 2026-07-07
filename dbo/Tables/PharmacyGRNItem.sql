CREATE TABLE [dbo].[PharmacyGRNItem] (
    [GRNItemId]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [GRNId]            BIGINT          NOT NULL,
    [DrugId]           BIGINT          NOT NULL,
    [BatchNumber]      NVARCHAR (100)  NOT NULL,
    [ExpiryDate]       DATE            NOT NULL,
    [QuantityReceived] DECIMAL (18, 2) NOT NULL,
    [UnitCost]         DECIMAL (18, 2) NULL,
    PRIMARY KEY CLUSTERED ([GRNItemId] ASC),
    CONSTRAINT [FK_GRNItem_GRN] FOREIGN KEY ([GRNId]) REFERENCES [dbo].[PharmacyGRN] ([GRNId])
);


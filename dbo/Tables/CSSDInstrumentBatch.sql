CREATE TABLE [dbo].[CSSDInstrumentBatch] (
    [InstrumentBatchId] BIGINT        IDENTITY (1, 1) NOT NULL,
    [BatchId]           BIGINT        NOT NULL,
    [InstrumentSetId]   BIGINT        NOT NULL,
    [OTId]              BIGINT        NULL,
    [SourceModule]      NVARCHAR (50) NULL,
    [Status]            NVARCHAR (30) DEFAULT ('PENDING') NOT NULL,
    [SterilizedOn]      DATETIME2 (7) NULL,
    [ExpiryDate]        DATETIME2 (7) NULL,
    [IsReleased]        BIT           DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([InstrumentBatchId] ASC),
    CONSTRAINT [FK_CSSDInstrument_Batch] FOREIGN KEY ([BatchId]) REFERENCES [dbo].[CSSDBatch] ([BatchId])
);


GO
CREATE NONCLUSTERED INDEX [IX_CSSDInstrument_Batch]
    ON [dbo].[CSSDInstrumentBatch]([BatchId] ASC);


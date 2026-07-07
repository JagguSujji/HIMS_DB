CREATE TABLE [dbo].[CSSDInstrumentLog] (
    [LogId]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [InstrumentSetId] BIGINT         NOT NULL,
    [ActionType]      NVARCHAR (50)  NOT NULL,
    [BatchId]         BIGINT         NULL,
    [Location]        NVARCHAR (100) NULL,
    [RecordedBy]      BIGINT         NULL,
    [RecordedOn]      DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    [Remarks]         NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([LogId] ASC),
    CONSTRAINT [FK_CSSDLog_Batch] FOREIGN KEY ([BatchId]) REFERENCES [dbo].[CSSDBatch] ([BatchId])
);


GO
CREATE NONCLUSTERED INDEX [IX_CSSDLog_Instrument]
    ON [dbo].[CSSDInstrumentLog]([InstrumentSetId] ASC);


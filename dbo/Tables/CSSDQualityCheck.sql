CREATE TABLE [dbo].[CSSDQualityCheck] (
    [QCId]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [BatchId]  BIGINT         NOT NULL,
    [TestType] NVARCHAR (50)  NOT NULL,
    [Result]   NVARCHAR (30)  NOT NULL,
    [TestedBy] BIGINT         NULL,
    [TestedOn] DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    [Remarks]  NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([QCId] ASC),
    CONSTRAINT [FK_CSSDQC_Batch] FOREIGN KEY ([BatchId]) REFERENCES [dbo].[CSSDBatch] ([BatchId])
);


GO
CREATE NONCLUSTERED INDEX [IX_CSSDQC_Batch]
    ON [dbo].[CSSDQualityCheck]([BatchId] ASC);


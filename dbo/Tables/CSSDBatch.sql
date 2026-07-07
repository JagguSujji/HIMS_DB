CREATE TABLE [dbo].[CSSDBatch] (
    [BatchId]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [CycleTypeId] BIGINT         NOT NULL,
    [BatchNumber] NVARCHAR (50)  NOT NULL,
    [StartedOn]   DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    [CompletedOn] DATETIME2 (7)  NULL,
    [MachineName] NVARCHAR (100) NULL,
    [OperatorId]  BIGINT         NULL,
    [Status]      NVARCHAR (30)  DEFAULT ('IN_PROGRESS') NOT NULL,
    [Remarks]     NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([BatchId] ASC),
    CONSTRAINT [FK_CSSDBatch_Cycle] FOREIGN KEY ([CycleTypeId]) REFERENCES [dbo].[CSSDCycleType] ([CycleTypeId])
);


GO
CREATE NONCLUSTERED INDEX [IX_CSSDBatch_Status]
    ON [dbo].[CSSDBatch]([Status] ASC);


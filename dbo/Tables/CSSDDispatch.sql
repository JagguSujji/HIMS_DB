CREATE TABLE [dbo].[CSSDDispatch] (
    [DispatchId]        BIGINT        IDENTITY (1, 1) NOT NULL,
    [BatchId]           BIGINT        NOT NULL,
    [DestinationModule] NVARCHAR (50) NOT NULL,
    [DestinationId]     BIGINT        NULL,
    [DispatchedOn]      DATETIME2 (7) DEFAULT (sysdatetime()) NOT NULL,
    [ReceivedBy]        BIGINT        NULL,
    [ReceivedOn]        DATETIME2 (7) NULL,
    [Status]            NVARCHAR (30) DEFAULT ('DISPATCHED') NOT NULL,
    PRIMARY KEY CLUSTERED ([DispatchId] ASC),
    CONSTRAINT [FK_CSSDDispatch_Batch] FOREIGN KEY ([BatchId]) REFERENCES [dbo].[CSSDBatch] ([BatchId])
);


GO
CREATE NONCLUSTERED INDEX [IX_CSSDDispatch_Status]
    ON [dbo].[CSSDDispatch]([Status] ASC);


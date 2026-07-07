CREATE TABLE [dbo].[InstrumentStatusHistory] (
    [StatusHistoryId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [InstrumentSetId] BIGINT         NOT NULL,
    [PreviousStatus]  NVARCHAR (50)  NULL,
    [CurrentStatus]   NVARCHAR (50)  NOT NULL,
    [ChangedOn]       DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    [ChangedBy]       BIGINT         NULL,
    [Reason]          NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([StatusHistoryId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_InstrumentStatus_Set]
    ON [dbo].[InstrumentStatusHistory]([InstrumentSetId] ASC);


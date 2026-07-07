CREATE TABLE [dbo].[CriticalLabAlertLog] (
    [AlertId]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [LabResultId]    BIGINT         NOT NULL,
    [AlertLevel]     NVARCHAR (50)  NULL,
    [Message]        NVARCHAR (500) NULL,
    [IsAcknowledged] BIT            DEFAULT ((0)) NULL,
    [CreatedOn]      DATETIME2 (7)  DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([AlertId] ASC)
);


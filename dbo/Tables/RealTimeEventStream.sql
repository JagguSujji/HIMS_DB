CREATE TABLE [dbo].[RealTimeEventStream] (
    [EventId]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [EventType]    NVARCHAR (100) NULL,
    [Payload]      NVARCHAR (MAX) NULL,
    [SourceModule] NVARCHAR (100) NULL,
    [CreatedOn]    DATETIME2 (7)  DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([EventId] ASC)
);


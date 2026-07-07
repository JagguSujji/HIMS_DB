CREATE TABLE [dbo].[AssetUsageLog] (
    [UsageId]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [AssetId]      BIGINT         NOT NULL,
    [UsedByUserId] BIGINT         NULL,
    [StartTime]    DATETIME2 (7)  NOT NULL,
    [EndTime]      DATETIME2 (7)  NULL,
    [Purpose]      NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([UsageId] ASC)
);


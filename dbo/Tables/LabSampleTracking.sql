CREATE TABLE [dbo].[LabSampleTracking] (
    [TrackingId]  BIGINT         IDENTITY (1, 1) NOT NULL,
    [LabSampleId] BIGINT         NOT NULL,
    [Location]    NVARCHAR (100) NULL,
    [Status]      NVARCHAR (50)  NULL,
    [UpdatedOn]   DATETIME2 (7)  DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([TrackingId] ASC)
);


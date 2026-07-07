CREATE TABLE [dbo].[AssetIncident] (
    [IncidentId]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [AssetId]          BIGINT          NOT NULL,
    [IncidentDate]     DATETIME2 (7)   NOT NULL,
    [ReportedBy]       BIGINT          NULL,
    [IssueDescription] NVARCHAR (1000) NOT NULL,
    [Severity]         NVARCHAR (30)   NOT NULL,
    [Status]           NVARCHAR (30)   CONSTRAINT [DF_AssetIncident_Status] DEFAULT ('OPEN') NOT NULL,
    [ResolvedDate]     DATETIME2 (7)   NULL,
    [ResolutionNotes]  NVARCHAR (1000) NULL,
    [CreatedOn]        DATETIME2 (7)   CONSTRAINT [DF_AssetIncident_CreatedOn] DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([IncidentId] ASC),
    CONSTRAINT [FK_AssetIncident_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([AssetId])
);


GO
CREATE NONCLUSTERED INDEX [IX_AssetIncident_Asset]
    ON [dbo].[AssetIncident]([AssetId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AssetIncident_Status]
    ON [dbo].[AssetIncident]([Status] ASC);


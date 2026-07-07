CREATE TABLE [dbo].[AssetMaintenance] (
    [MaintenanceId]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [AssetId]         BIGINT          NOT NULL,
    [MaintenanceType] NVARCHAR (30)   NOT NULL,
    [ScheduledDate]   DATETIME2 (7)   NULL,
    [StartDate]       DATETIME2 (7)   NULL,
    [EndDate]         DATETIME2 (7)   NULL,
    [VendorName]      NVARCHAR (150)  NULL,
    [TechnicianName]  NVARCHAR (150)  NULL,
    [Cost]            DECIMAL (18, 2) NULL,
    [Description]     NVARCHAR (1000) NULL,
    [Remarks]         NVARCHAR (1000) NULL,
    [Status]          NVARCHAR (30)   CONSTRAINT [DF_AssetMaintenance_Status] DEFAULT ('SCHEDULED') NOT NULL,
    [CreatedBy]       BIGINT          NOT NULL,
    [CreatedOn]       DATETIME2 (7)   CONSTRAINT [DF_AssetMaintenance_CreatedOn] DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([MaintenanceId] ASC),
    CONSTRAINT [FK_AssetMaintenance_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([AssetId])
);


GO
CREATE NONCLUSTERED INDEX [IX_AssetMaintenance_Asset]
    ON [dbo].[AssetMaintenance]([AssetId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AssetMaintenance_Status]
    ON [dbo].[AssetMaintenance]([Status] ASC);


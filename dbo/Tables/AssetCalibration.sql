CREATE TABLE [dbo].[AssetCalibration] (
    [CalibrationId]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [AssetId]           BIGINT          NOT NULL,
    [CalibrationDate]   DATETIME2 (7)   NOT NULL,
    [NextDueDate]       DATETIME2 (7)   NULL,
    [PerformedBy]       NVARCHAR (150)  NOT NULL,
    [CertificateNumber] NVARCHAR (100)  NULL,
    [Result]            NVARCHAR (30)   NOT NULL,
    [Remarks]           NVARCHAR (1000) NULL,
    [CreatedOn]         DATETIME2 (7)   CONSTRAINT [DF_AssetCalibration_CreatedOn] DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([CalibrationId] ASC),
    CONSTRAINT [FK_AssetCalibration_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([AssetId])
);


GO
CREATE NONCLUSTERED INDEX [IX_AssetCalibration_Asset]
    ON [dbo].[AssetCalibration]([AssetId] ASC);


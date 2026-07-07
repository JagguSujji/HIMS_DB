CREATE TABLE [dbo].[LabSampleCollection] (
    [LabSampleId]  BIGINT         IDENTITY (1, 1) NOT NULL,
    [LabOrderId]   BIGINT         NOT NULL,
    [SampleTypeId] INT            NOT NULL,
    [CollectedOn]  DATETIME2 (7)  NULL,
    [CollectedBy]  BIGINT         NULL,
    [Barcode]      NVARCHAR (100) NULL,
    [Status]       NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([LabSampleId] ASC)
);


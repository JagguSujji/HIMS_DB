CREATE TABLE [dbo].[RadiologyImageStorage] (
    [ImageId]           BIGINT          IDENTITY (1, 1) NOT NULL,
    [RadiologyResultId] BIGINT          NOT NULL,
    [ImageUrl]          NVARCHAR (1000) NULL,
    [DicomUid]          NVARCHAR (200)  NULL,
    [UploadedOn]        DATETIME2 (7)   DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([ImageId] ASC)
);


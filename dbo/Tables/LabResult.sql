CREATE TABLE [dbo].[LabResult] (
    [LabResultId]  BIGINT       IDENTITY (1, 1) NOT NULL,
    [LabOrderId]   BIGINT       NULL,
    [ResultDate]   DATETIME     NULL,
    [ResultStatus] VARCHAR (30) NULL,
    [ReviewedBy]   BIGINT       NULL,
    [ReviewedOn]   DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([LabResultId] ASC)
);


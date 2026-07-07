CREATE TABLE [dbo].[RadiologyResult] (
    [RadiologyResultId] BIGINT   IDENTITY (1, 1) NOT NULL,
    [RadiologyOrderId]  BIGINT   NULL,
    [ResultDate]        DATETIME NULL,
    PRIMARY KEY CLUSTERED ([RadiologyResultId] ASC)
);


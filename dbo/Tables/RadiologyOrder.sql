CREATE TABLE [dbo].[RadiologyOrder] (
    [RadiologyOrderId] BIGINT   IDENTITY (1, 1) NOT NULL,
    [PatientId]        BIGINT   NULL,
    [OrderDate]        DATETIME NULL,
    PRIMARY KEY CLUSTERED ([RadiologyOrderId] ASC)
);


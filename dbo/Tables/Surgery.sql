CREATE TABLE [dbo].[Surgery] (
    [SurgeryId]     BIGINT   IDENTITY (1, 1) NOT NULL,
    [PatientId]     BIGINT   NULL,
    [SurgeryDate]   DATETIME NULL,
    [SurgeryTypeId] INT      NULL,
    PRIMARY KEY CLUSTERED ([SurgeryId] ASC)
);


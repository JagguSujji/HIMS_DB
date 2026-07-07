CREATE TABLE [dbo].[LabEquipmentCalibration] (
    [CalibrationId]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [EquipmentId]       BIGINT         NOT NULL,
    [CalibrationDate]   DATETIME2 (7)  NOT NULL,
    [NextDueDate]       DATETIME2 (7)  NOT NULL,
    [CalibratedBy]      BIGINT         NULL,
    [Status]            NVARCHAR (30)  NOT NULL,
    [CertificateNumber] NVARCHAR (100) NULL,
    [Remarks]           NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([CalibrationId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Calibration_Equipment]
    ON [dbo].[LabEquipmentCalibration]([EquipmentId] ASC);


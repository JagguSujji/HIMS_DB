CREATE TABLE [dbo].[LabOrder] (
    [LabOrderId]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [PatientId]     BIGINT          NULL,
    [OrderDate]     DATETIME        NULL,
    [DoctorId]      INT             NULL,
    [OrderPriority] NVARCHAR (20)   NULL,
    [ClinicalNotes] NVARCHAR (1000) NULL,
    PRIMARY KEY CLUSTERED ([LabOrderId] ASC)
);


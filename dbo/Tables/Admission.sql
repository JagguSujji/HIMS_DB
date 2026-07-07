CREATE TABLE [dbo].[Admission] (
    [AdmissionId]       BIGINT   IDENTITY (1, 1) NOT NULL,
    [PatientId]         BIGINT   NULL,
    [AdmissionDate]     DATETIME NULL,
    [AdmissionStatusId] INT      NULL,
    [AdmissionTypeId]   INT      NULL,
    [AdmittingDoctorId] INT      NULL,
    [DischargeDoctorId] INT      NULL,
    [RoomId]            INT      NULL,
    [BedId]             INT      NULL,
    [DischargeDate]     DATETIME NULL,
    PRIMARY KEY CLUSTERED ([AdmissionId] ASC)
);


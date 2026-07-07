CREATE TABLE [dbo].[Prescription] (
    [PrescriptionId]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [ConsultationId]   BIGINT        NULL,
    [PrescriptionDate] DATETIME      NULL,
    [EncounterId]      INT           NULL,
    [PrescribedBy]     INT           NULL,
    [Status]           NVARCHAR (50) DEFAULT ('ACTIVE') NULL,
    [ValidUntil]       DATETIME      NULL,
    [PrescriptionType] VARCHAR (30)  NULL,
    [IsActive]         BIT           DEFAULT ((1)) NULL,
    [PatientId]        BIGINT        NULL,
    PRIMARY KEY CLUSTERED ([PrescriptionId] ASC)
);


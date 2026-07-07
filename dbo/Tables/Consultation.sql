CREATE TABLE [dbo].[Consultation] (
    [ConsultationId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [EncounterId]    BIGINT         NULL,
    [DoctorId]       INT            NULL,
    [Notes]          NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([ConsultationId] ASC)
);


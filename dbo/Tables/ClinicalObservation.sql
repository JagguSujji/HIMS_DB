CREATE TABLE [dbo].[ClinicalObservation] (
    [ObservationId]    BIGINT         IDENTITY (1, 1) NOT NULL,
    [PatientId]        BIGINT         NOT NULL,
    [EncounterId]      BIGINT         NULL,
    [ObservationType]  NVARCHAR (100) NULL,
    [ObservationValue] NVARCHAR (MAX) NULL,
    [RecordedOn]       DATETIME2 (7)  DEFAULT (getutcdate()) NULL,
    [RecordedBy]       BIGINT         NULL,
    PRIMARY KEY CLUSTERED ([ObservationId] ASC)
);


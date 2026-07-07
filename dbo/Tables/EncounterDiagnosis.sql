CREATE TABLE [dbo].[EncounterDiagnosis] (
    [EncounterDiagnosisId] BIGINT       IDENTITY (1, 1) NOT NULL,
    [EncounterId]          BIGINT       NOT NULL,
    [ICD10Code]            VARCHAR (20) NULL,
    [DiagnosisType]        VARCHAR (30) NULL,
    [IsConfirmed]          BIT          NULL,
    [CreatedOn]            DATETIME     DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([EncounterDiagnosisId] ASC)
);


CREATE TABLE [dbo].[AIDiagnosisMapping] (
    [DiagnosisMappingId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [SymptomOntologyId]  BIGINT         NULL,
    [ICD10Code]          VARCHAR (20)   NULL,
    [ConfidenceScore]    DECIMAL (5, 2) NULL,
    [ClinicalPriority]   INT            NULL,
    PRIMARY KEY CLUSTERED ([DiagnosisMappingId] ASC),
    FOREIGN KEY ([SymptomOntologyId]) REFERENCES [dbo].[AISymptomOntology] ([SymptomOntologyId])
);


CREATE TABLE [dbo].[NursingAssessment] (
    [AssessmentId]   INT            NOT NULL,
    [PatientId]      INT            NULL,
    [EncounterId]    INT            NULL,
    [AssessmentText] NVARCHAR (MAX) NULL,
    [CreatedOn]      DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([AssessmentId] ASC)
);


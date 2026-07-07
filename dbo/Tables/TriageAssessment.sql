CREATE TABLE [dbo].[TriageAssessment] (
    [TriageId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [ERVisitId]  BIGINT         NULL,
    [Severity]   NVARCHAR (50)  NULL,
    [Notes]      NVARCHAR (MAX) NULL,
    [AssessedOn] DATETIME2 (7)  DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([TriageId] ASC)
);


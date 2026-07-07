CREATE TABLE [dbo].[ICD10Diagnosis] (
    [ICD10DiagnosisId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [ICDCode]          VARCHAR (20)   NOT NULL,
    [DiagnosisName]    NVARCHAR (500) NOT NULL,
    [ShortDescription] NVARCHAR (500) NULL,
    [ChapterName]      NVARCHAR (200) NULL,
    [IsBillable]       BIT            DEFAULT ((1)) NOT NULL,
    [IsActive]         BIT            DEFAULT ((1)) NOT NULL,
    [CreatedOn]        DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ICD10DiagnosisId] ASC),
    UNIQUE NONCLUSTERED ([ICDCode] ASC)
);


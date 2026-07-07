CREATE TABLE [dbo].[Symptom] (
    [SymptomId]   INT            IDENTITY (1, 1) NOT NULL,
    [SymptomCode] VARCHAR (20)   NULL,
    [SymptomName] NVARCHAR (200) NULL,
    [Description] NVARCHAR (500) NULL,
    [IsActive]    BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([SymptomId] ASC),
    UNIQUE NONCLUSTERED ([SymptomCode] ASC)
);


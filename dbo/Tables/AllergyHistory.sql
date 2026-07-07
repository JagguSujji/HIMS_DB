CREATE TABLE [dbo].[AllergyHistory] (
    [AllergyId] INT           NOT NULL,
    [PatientId] INT           NULL,
    [Substance] VARCHAR (200) NULL,
    [Reaction]  VARCHAR (200) NULL,
    [Severity]  VARCHAR (50)  NULL,
    [IsActive]  BIT           NULL,
    PRIMARY KEY CLUSTERED ([AllergyId] ASC)
);


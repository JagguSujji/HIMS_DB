CREATE TABLE [dbo].[AISymptomOntology] (
    [SymptomOntologyId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [SymptomCode]       VARCHAR (30)   NULL,
    [SymptomName]       NVARCHAR (200) NULL,
    [ParentSymptomId]   BIGINT         NULL,
    [SeverityLevel]     VARCHAR (30)   NULL,
    [IsActive]          BIT            NULL,
    PRIMARY KEY CLUSTERED ([SymptomOntologyId] ASC),
    FOREIGN KEY ([ParentSymptomId]) REFERENCES [dbo].[AISymptomOntology] ([SymptomOntologyId])
);


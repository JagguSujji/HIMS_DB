CREATE TABLE [dbo].[SNOMEDConcept] (
    [SNOMEDConceptId]    BIGINT         IDENTITY (1, 1) NOT NULL,
    [ConceptId]          VARCHAR (30)   NOT NULL,
    [FullySpecifiedName] NVARCHAR (500) NULL,
    [PreferredTerm]      NVARCHAR (300) NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([SNOMEDConceptId] ASC),
    UNIQUE NONCLUSTERED ([ConceptId] ASC)
);


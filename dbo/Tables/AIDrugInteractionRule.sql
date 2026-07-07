CREATE TABLE [dbo].[AIDrugInteractionRule] (
    [DrugInteractionRuleId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [Drug1Id]               BIGINT         NULL,
    [Drug2Id]               BIGINT         NULL,
    [Severity]              VARCHAR (30)   NULL,
    [Description]           NVARCHAR (MAX) NULL,
    [Recommendation]        NVARCHAR (MAX) NULL,
    [IsActive]              BIT            NULL,
    PRIMARY KEY CLUSTERED ([DrugInteractionRuleId] ASC)
);


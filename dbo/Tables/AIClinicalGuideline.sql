CREATE TABLE [dbo].[AIClinicalGuideline] (
    [GuidelineId]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [GuidelineCode]      VARCHAR (50)   NULL,
    [GuidelineName]      NVARCHAR (300) NULL,
    [Specialty]          VARCHAR (100)  NULL,
    [SourceOrganization] NVARCHAR (200) NULL,
    [VersionNo]          VARCHAR (50)   NULL,
    [GuidelineText]      NVARCHAR (MAX) NULL,
    [EffectiveDate]      DATE           NULL,
    [IsActive]           BIT            NULL,
    PRIMARY KEY CLUSTERED ([GuidelineId] ASC)
);


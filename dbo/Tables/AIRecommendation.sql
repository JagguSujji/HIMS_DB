CREATE TABLE [dbo].[AIRecommendation] (
    [RecommendationId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [RecommendationType] VARCHAR (100)  NULL,
    [RecommendationText] NVARCHAR (MAX) NULL,
    [PriorityLevel]      VARCHAR (20)   NULL,
    [IsActive]           BIT            NULL,
    PRIMARY KEY CLUSTERED ([RecommendationId] ASC)
);


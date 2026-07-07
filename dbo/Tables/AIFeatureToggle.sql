CREATE TABLE [dbo].[AIFeatureToggle] (
    [FeatureId]   INT           NOT NULL,
    [FeatureName] VARCHAR (100) NULL,
    [IsEnabled]   BIT           NULL,
    PRIMARY KEY CLUSTERED ([FeatureId] ASC)
);


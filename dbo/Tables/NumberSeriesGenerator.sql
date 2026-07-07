CREATE TABLE [dbo].[NumberSeriesGenerator] (
    [SeriesId]     INT           NOT NULL,
    [ModuleName]   VARCHAR (100) NULL,
    [Prefix]       VARCHAR (20)  NULL,
    [CurrentValue] INT           NULL,
    PRIMARY KEY CLUSTERED ([SeriesId] ASC)
);


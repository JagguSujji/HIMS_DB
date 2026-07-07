CREATE TABLE [dbo].[CoverageType] (
    [CoverageTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CoverageCode]   VARCHAR (20)   NULL,
    [CoverageName]   NVARCHAR (100) NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([CoverageTypeId] ASC)
);


CREATE TABLE [dbo].[AIConfidenceLevel] (
    [ConfidenceLevelId] INT            IDENTITY (1, 1) NOT NULL,
    [ConfidenceCode]    VARCHAR (20)   NULL,
    [MinimumScore]      DECIMAL (5, 2) NULL,
    [MaximumScore]      DECIMAL (5, 2) NULL,
    [Description]       NVARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([ConfidenceLevelId] ASC)
);


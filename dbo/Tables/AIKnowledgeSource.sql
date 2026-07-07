CREATE TABLE [dbo].[AIKnowledgeSource] (
    [KnowledgeSourceId] INT            IDENTITY (1, 1) NOT NULL,
    [SourceName]        NVARCHAR (200) NULL,
    [SourceType]        VARCHAR (50)   NULL,
    [VersionNo]         VARCHAR (50)   NULL,
    [Website]           NVARCHAR (300) NULL,
    [IsActive]          BIT            NULL,
    PRIMARY KEY CLUSTERED ([KnowledgeSourceId] ASC)
);


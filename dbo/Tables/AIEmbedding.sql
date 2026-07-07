CREATE TABLE [dbo].[AIEmbedding] (
    [EmbeddingId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [SourceType]  VARCHAR (50)   NULL,
    [SourceId]    BIGINT         NULL,
    [VectorData]  NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([EmbeddingId] ASC)
);


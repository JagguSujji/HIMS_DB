CREATE TABLE [dbo].[AIModelVersion] (
    [AIModelVersionId] BIGINT       IDENTITY (1, 1) NOT NULL,
    [AIModelId]        INT          NOT NULL,
    [VersionName]      VARCHAR (50) NULL,
    [ReleaseDate]      DATE         NULL,
    [IsDefault]        BIT          NULL,
    [IsActive]         BIT          NULL,
    PRIMARY KEY CLUSTERED ([AIModelVersionId] ASC),
    FOREIGN KEY ([AIModelId]) REFERENCES [dbo].[AIModel] ([AIModelId])
);


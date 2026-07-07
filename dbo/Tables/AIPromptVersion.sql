CREATE TABLE [dbo].[AIPromptVersion] (
    [PromptVersionId]  BIGINT   IDENTITY (1, 1) NOT NULL,
    [PromptTemplateId] BIGINT   NULL,
    [VersionNumber]    INT      NULL,
    [PromptText]       TEXT     NULL,
    [CreatedOn]        DATETIME NULL,
    PRIMARY KEY CLUSTERED ([PromptVersionId] ASC)
);


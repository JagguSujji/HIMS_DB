CREATE TABLE [dbo].[AIPromptTemplate] (
    [PromptTemplateId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [PromptCode]       VARCHAR (50)   NULL,
    [PromptName]       NVARCHAR (200) NULL,
    [ModuleName]       VARCHAR (50)   NULL,
    [PromptText]       NVARCHAR (MAX) NULL,
    [Temperature]      DECIMAL (5, 2) NULL,
    [MaxTokens]        INT            NULL,
    [IsSystemPrompt]   BIT            NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([PromptTemplateId] ASC)
);


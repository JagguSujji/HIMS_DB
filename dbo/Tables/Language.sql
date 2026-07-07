CREATE TABLE [dbo].[Language] (
    [LanguageId]   INT            IDENTITY (1, 1) NOT NULL,
    [LanguageCode] VARCHAR (10)   NULL,
    [LanguageName] NVARCHAR (100) NULL,
    [IsActive]     BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([LanguageId] ASC)
);


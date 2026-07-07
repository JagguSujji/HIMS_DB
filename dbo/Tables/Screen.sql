CREATE TABLE [dbo].[Screen] (
    [ScreenId]   INT            IDENTITY (1, 1) NOT NULL,
    [ScreenCode] VARCHAR (50)   NULL,
    [ScreenName] NVARCHAR (200) NULL,
    [ModuleName] VARCHAR (100)  NULL,
    [IsActive]   BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ScreenId] ASC)
);


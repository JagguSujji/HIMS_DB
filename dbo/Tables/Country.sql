CREATE TABLE [dbo].[Country] (
    [CountryId]   INT           IDENTITY (1, 1) NOT NULL,
    [CountryCode] VARCHAR (10)  NOT NULL,
    [CountryName] VARCHAR (100) NOT NULL,
    [IsActive]    BIT           DEFAULT ((1)) NOT NULL,
    [CreatedOn]   DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([CountryId] ASC)
);


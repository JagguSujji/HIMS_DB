CREATE TABLE [dbo].[State] (
    [StateId]   INT           IDENTITY (1, 1) NOT NULL,
    [CountryId] INT           NOT NULL,
    [StateName] VARCHAR (100) NOT NULL,
    [StateCode] VARCHAR (10)  NULL,
    [IsActive]  BIT           DEFAULT ((1)) NOT NULL,
    [CreatedOn] DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([StateId] ASC),
    FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([CountryId])
);


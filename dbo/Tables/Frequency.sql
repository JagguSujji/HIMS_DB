CREATE TABLE [dbo].[Frequency] (
    [FrequencyId]   INT            IDENTITY (1, 1) NOT NULL,
    [FrequencyCode] VARCHAR (20)   NULL,
    [FrequencyName] NVARCHAR (100) NULL,
    [TimesPerDay]   DECIMAL (5, 2) NULL,
    [IsActive]      BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([FrequencyId] ASC)
);


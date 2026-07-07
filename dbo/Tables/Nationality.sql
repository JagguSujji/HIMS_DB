CREATE TABLE [dbo].[Nationality] (
    [NationalityId]   INT            IDENTITY (1, 1) NOT NULL,
    [NationalityCode] VARCHAR (10)   NULL,
    [NationalityName] NVARCHAR (100) NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([NationalityId] ASC)
);


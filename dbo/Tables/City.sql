CREATE TABLE [dbo].[City] (
    [CityId]     INT           IDENTITY (1, 1) NOT NULL,
    [DistrictId] INT           NOT NULL,
    [CityName]   VARCHAR (100) NOT NULL,
    [PostalCode] VARCHAR (20)  NULL,
    [IsActive]   BIT           DEFAULT ((1)) NOT NULL,
    [CreatedOn]  DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([CityId] ASC),
    FOREIGN KEY ([DistrictId]) REFERENCES [dbo].[District] ([DistrictId])
);


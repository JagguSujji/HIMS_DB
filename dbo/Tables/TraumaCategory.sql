CREATE TABLE [dbo].[TraumaCategory] (
    [TraumaCategoryId] INT            IDENTITY (1, 1) NOT NULL,
    [TraumaCode]       VARCHAR (20)   NULL,
    [TraumaName]       NVARCHAR (100) NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([TraumaCategoryId] ASC)
);


CREATE TABLE [dbo].[Occupation] (
    [OccupationId]   INT            IDENTITY (1, 1) NOT NULL,
    [OccupationCode] VARCHAR (20)   NULL,
    [OccupationName] NVARCHAR (100) NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([OccupationId] ASC)
);


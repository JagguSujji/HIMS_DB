CREATE TABLE [dbo].[Religion] (
    [ReligionId]   INT            IDENTITY (1, 1) NOT NULL,
    [ReligionCode] VARCHAR (20)   NULL,
    [ReligionName] NVARCHAR (100) NULL,
    [IsActive]     BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ReligionId] ASC)
);


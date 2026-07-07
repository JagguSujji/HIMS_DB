CREATE TABLE [dbo].[RadiationLevel] (
    [RadiationLevelId] INT            IDENTITY (1, 1) NOT NULL,
    [RadiationCode]    VARCHAR (20)   NULL,
    [RadiationName]    NVARCHAR (100) NULL,
    [DoseRange]        NVARCHAR (100) NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([RadiationLevelId] ASC)
);


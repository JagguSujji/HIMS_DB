CREATE TABLE [dbo].[ResultFlag] (
    [ResultFlagId] INT            IDENTITY (1, 1) NOT NULL,
    [FlagCode]     VARCHAR (20)   NULL,
    [FlagName]     NVARCHAR (100) NULL,
    [DisplayColor] VARCHAR (20)   NULL,
    [IsActive]     BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ResultFlagId] ASC)
);


CREATE TABLE [dbo].[YesNoFlag] (
    [YesNoFlagId] INT           IDENTITY (1, 1) NOT NULL,
    [FlagCode]    CHAR (1)      NULL,
    [FlagName]    NVARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([YesNoFlagId] ASC)
);


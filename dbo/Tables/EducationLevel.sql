CREATE TABLE [dbo].[EducationLevel] (
    [EducationLevelId] INT            IDENTITY (1, 1) NOT NULL,
    [EducationCode]    VARCHAR (20)   NULL,
    [EducationName]    NVARCHAR (100) NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([EducationLevelId] ASC)
);


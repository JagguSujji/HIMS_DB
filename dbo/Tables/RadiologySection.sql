CREATE TABLE [dbo].[RadiologySection] (
    [RadiologySectionId] INT            IDENTITY (1, 1) NOT NULL,
    [SectionCode]        VARCHAR (20)   NULL,
    [SectionName]        NVARCHAR (100) NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([RadiologySectionId] ASC)
);


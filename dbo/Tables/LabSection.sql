CREATE TABLE [dbo].[LabSection] (
    [LabSectionId]   INT            IDENTITY (1, 1) NOT NULL,
    [LabSectionCode] VARCHAR (20)   NULL,
    [LabSectionName] NVARCHAR (100) NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([LabSectionId] ASC)
);


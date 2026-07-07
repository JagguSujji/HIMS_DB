CREATE TABLE [dbo].[RelationshipType] (
    [RelationshipTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [RelationshipCode]   VARCHAR (20)   NULL,
    [RelationshipName]   NVARCHAR (100) NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([RelationshipTypeId] ASC)
);


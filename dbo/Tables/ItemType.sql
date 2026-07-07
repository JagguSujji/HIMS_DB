CREATE TABLE [dbo].[ItemType] (
    [ItemTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [ItemTypeCode] VARCHAR (20)   NULL,
    [ItemTypeName] NVARCHAR (100) NULL,
    [IsActive]     BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ItemTypeId] ASC)
);


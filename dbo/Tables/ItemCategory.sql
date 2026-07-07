CREATE TABLE [dbo].[ItemCategory] (
    [ItemCategoryId] INT            IDENTITY (1, 1) NOT NULL,
    [CategoryCode]   VARCHAR (20)   NULL,
    [CategoryName]   NVARCHAR (100) NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ItemCategoryId] ASC)
);


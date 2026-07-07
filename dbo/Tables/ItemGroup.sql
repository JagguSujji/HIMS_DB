CREATE TABLE [dbo].[ItemGroup] (
    [ItemGroupId]    INT            IDENTITY (1, 1) NOT NULL,
    [ItemCategoryId] INT            NOT NULL,
    [GroupCode]      VARCHAR (20)   NULL,
    [GroupName]      NVARCHAR (100) NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ItemGroupId] ASC),
    FOREIGN KEY ([ItemCategoryId]) REFERENCES [dbo].[ItemCategory] ([ItemCategoryId])
);


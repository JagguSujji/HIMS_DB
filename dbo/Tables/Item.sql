CREATE TABLE [dbo].[Item] (
    [ItemId]         INT            IDENTITY (1, 1) NOT NULL,
    [ItemName]       NVARCHAR (200) NULL,
    [ItemCategoryId] INT            NULL,
    PRIMARY KEY CLUSTERED ([ItemId] ASC)
);


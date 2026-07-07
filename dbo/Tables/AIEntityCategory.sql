CREATE TABLE [dbo].[AIEntityCategory] (
    [EntityCategoryId] INT            IDENTITY (1, 1) NOT NULL,
    [CategoryCode]     VARCHAR (30)   NULL,
    [CategoryName]     NVARCHAR (100) NULL,
    [IsActive]         BIT            NULL,
    PRIMARY KEY CLUSTERED ([EntityCategoryId] ASC)
);


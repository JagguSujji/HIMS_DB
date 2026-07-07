CREATE TABLE [dbo].[AssetCategory] (
    [AssetCategoryId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [CategoryCode]    NVARCHAR (30)  NOT NULL,
    [CategoryName]    NVARCHAR (150) NOT NULL,
    [Description]     NVARCHAR (500) NULL,
    [IsActive]        BIT            CONSTRAINT [DF_AssetCategory_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedOn]       DATETIME2 (7)  CONSTRAINT [DF_AssetCategory_CreatedOn] DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([AssetCategoryId] ASC),
    CONSTRAINT [UQ_AssetCategory_Code] UNIQUE NONCLUSTERED ([CategoryCode] ASC)
);


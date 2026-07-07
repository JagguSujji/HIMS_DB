CREATE TABLE [dbo].[DocumentCategory] (
    [DocumentCategoryId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [CategoryCode]       NVARCHAR (30)  NOT NULL,
    [CategoryName]       NVARCHAR (150) NOT NULL,
    [Description]        NVARCHAR (500) NULL,
    [IsSystemDefined]    BIT            CONSTRAINT [DF_DocumentCategory_IsSystem] DEFAULT ((0)) NOT NULL,
    [IsActive]           BIT            CONSTRAINT [DF_DocumentCategory_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedOn]          DATETIME2 (7)  CONSTRAINT [DF_DocumentCategory_CreatedOn] DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([DocumentCategoryId] ASC),
    CONSTRAINT [UQ_DocumentCategory_Code] UNIQUE NONCLUSTERED ([CategoryCode] ASC)
);


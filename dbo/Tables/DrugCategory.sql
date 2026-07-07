CREATE TABLE [dbo].[DrugCategory] (
    [DrugCategoryId]   INT            IDENTITY (1, 1) NOT NULL,
    [DrugCategoryCode] VARCHAR (20)   NOT NULL,
    [DrugCategoryName] NVARCHAR (100) NOT NULL,
    [Description]      NVARCHAR (300) NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    [CreatedOn]        DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([DrugCategoryId] ASC),
    UNIQUE NONCLUSTERED ([DrugCategoryCode] ASC)
);


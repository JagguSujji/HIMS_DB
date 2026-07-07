CREATE TABLE [dbo].[Drug] (
    [DrugId]         INT            IDENTITY (1, 1) NOT NULL,
    [DrugName]       NVARCHAR (200) NULL,
    [DrugCategoryId] INT            NULL,
    PRIMARY KEY CLUSTERED ([DrugId] ASC)
);


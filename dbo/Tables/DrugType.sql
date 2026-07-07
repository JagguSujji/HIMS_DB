CREATE TABLE [dbo].[DrugType] (
    [DrugTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [DrugTypeCode] VARCHAR (20)   NULL,
    [DrugTypeName] NVARCHAR (100) NULL,
    [IsActive]     BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([DrugTypeId] ASC)
);


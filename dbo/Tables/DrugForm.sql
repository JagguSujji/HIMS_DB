CREATE TABLE [dbo].[DrugForm] (
    [DrugFormId]   INT            IDENTITY (1, 1) NOT NULL,
    [DrugFormCode] VARCHAR (20)   NULL,
    [DrugFormName] NVARCHAR (100) NULL,
    [IsActive]     BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([DrugFormId] ASC),
    UNIQUE NONCLUSTERED ([DrugFormCode] ASC)
);


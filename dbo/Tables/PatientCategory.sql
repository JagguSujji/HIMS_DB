CREATE TABLE [dbo].[PatientCategory] (
    [PatientCategoryId] INT            IDENTITY (1, 1) NOT NULL,
    [CategoryCode]      VARCHAR (20)   NOT NULL,
    [CategoryName]      NVARCHAR (100) NOT NULL,
    [Description]       NVARCHAR (300) NULL,
    [IsActive]          BIT            DEFAULT ((1)) NOT NULL,
    [CreatedOn]         DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([PatientCategoryId] ASC),
    UNIQUE NONCLUSTERED ([CategoryCode] ASC)
);


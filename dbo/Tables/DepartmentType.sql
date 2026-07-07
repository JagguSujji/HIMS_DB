CREATE TABLE [dbo].[DepartmentType] (
    [DepartmentTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [TypeCode]         VARCHAR (20)   NOT NULL,
    [TypeName]         NVARCHAR (100) NOT NULL,
    [Description]      NVARCHAR (300) NULL,
    [IsActive]         BIT            DEFAULT ((1)) NOT NULL,
    [CreatedOn]        DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([DepartmentTypeId] ASC),
    UNIQUE NONCLUSTERED ([TypeCode] ASC)
);


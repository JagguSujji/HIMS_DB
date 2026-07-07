CREATE TABLE [dbo].[EmploymentType] (
    [EmploymentTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [EmploymentTypeCode] VARCHAR (20)   NOT NULL,
    [EmploymentTypeName] NVARCHAR (100) NOT NULL,
    [Description]        NVARCHAR (300) NULL,
    [IsActive]           BIT            DEFAULT ((1)) NOT NULL,
    [CreatedBy]          INT            NULL,
    [CreatedOn]          DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [ModifiedBy]         INT            NULL,
    [ModifiedOn]         DATETIME2 (7)  NULL,
    [RowVersion]         ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([EmploymentTypeId] ASC),
    UNIQUE NONCLUSTERED ([EmploymentTypeCode] ASC)
);


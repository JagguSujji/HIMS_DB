CREATE TABLE [dbo].[Department] (
    [DepartmentId]     INT            IDENTITY (1, 1) NOT NULL,
    [DepartmentCode]   VARCHAR (20)   NOT NULL,
    [DepartmentName]   NVARCHAR (200) NOT NULL,
    [DepartmentTypeId] INT            NULL,
    [IsClinical]       BIT            DEFAULT ((0)) NOT NULL,
    [Description]      NVARCHAR (500) NULL,
    [IsActive]         BIT            DEFAULT ((1)) NOT NULL,
    [Remarks]          NVARCHAR (500) NULL,
    [CreatedBy]        INT            NULL,
    [CreatedOn]        DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [ModifiedBy]       INT            NULL,
    [ModifiedOn]       DATETIME2 (7)  NULL,
    [RowVersion]       ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([DepartmentId] ASC)
);


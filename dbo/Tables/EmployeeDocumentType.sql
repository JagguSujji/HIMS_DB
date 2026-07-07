CREATE TABLE [dbo].[EmployeeDocumentType] (
    [EmployeeDocumentTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [DocumentTypeCode]       VARCHAR (20)   NULL,
    [DocumentTypeName]       NVARCHAR (100) NULL,
    [IsMandatory]            BIT            DEFAULT ((0)) NULL,
    [IsActive]               BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([EmployeeDocumentTypeId] ASC),
    UNIQUE NONCLUSTERED ([DocumentTypeCode] ASC)
);


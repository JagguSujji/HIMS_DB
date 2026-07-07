CREATE TABLE [dbo].[DocumentType] (
    [DocumentTypeId]     INT            IDENTITY (1, 1) NOT NULL,
    [DocumentTypeCode]   VARCHAR (20)   NULL,
    [DocumentTypeName]   NVARCHAR (100) NULL,
    [IsIdentityDocument] BIT            NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([DocumentTypeId] ASC)
);


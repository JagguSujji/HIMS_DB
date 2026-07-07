CREATE TABLE [dbo].[PatientDocument] (
    [PatientDocumentId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [PatientId]         BIGINT         NULL,
    [DocumentTypeId]    INT            NULL,
    [FilePath]          NVARCHAR (300) NULL,
    [IsVerified]        BIT            DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([PatientDocumentId] ASC)
);


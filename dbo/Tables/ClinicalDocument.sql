CREATE TABLE [dbo].[ClinicalDocument] (
    [DocumentId]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [PatientId]    BIGINT        NOT NULL,
    [EncounterId]  BIGINT        NULL,
    [DocumentType] VARCHAR (50)  NULL,
    [Title]        VARCHAR (255) NULL,
    [Content]      TEXT          NULL,
    [CreatedBy]    BIGINT        NULL,
    [CreatedOn]    DATETIME      DEFAULT (getdate()) NULL,
    [IsFinal]      BIT           DEFAULT ((0)) NULL,
    [DocumentPath] VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([DocumentId] ASC)
);


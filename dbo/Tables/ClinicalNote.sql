CREATE TABLE [dbo].[ClinicalNote] (
    [ClinicalNoteId] INT            NOT NULL,
    [PatientId]      INT            NULL,
    [EncounterId]    INT            NULL,
    [NoteType]       VARCHAR (50)   NULL,
    [NoteText]       NVARCHAR (MAX) NULL,
    [CreatedBy]      INT            NULL,
    [CreatedOn]      DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([ClinicalNoteId] ASC)
);


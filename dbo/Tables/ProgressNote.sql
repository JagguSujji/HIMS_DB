CREATE TABLE [dbo].[ProgressNote] (
    [ProgressNoteId] INT            NOT NULL,
    [EncounterId]    INT            NULL,
    [PatientId]      INT            NULL,
    [Assessment]     NVARCHAR (MAX) NULL,
    [Plan]           NVARCHAR (MAX) NULL,
    [CreatedOn]      DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([ProgressNoteId] ASC)
);


CREATE TABLE [dbo].[ICURoundNote] (
    [RoundNoteId]    BIGINT         IDENTITY (1, 1) NOT NULL,
    [ICUAdmissionId] BIGINT         NOT NULL,
    [DoctorId]       BIGINT         NOT NULL,
    [Assessment]     NVARCHAR (MAX) NOT NULL,
    [Plan]           NVARCHAR (MAX) NOT NULL,
    [CreatedOn]      DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([RoundNoteId] ASC),
    CONSTRAINT [FK_ICURound_ICUAdmission] FOREIGN KEY ([ICUAdmissionId]) REFERENCES [dbo].[ICUAdmission] ([ICUAdmissionId])
);


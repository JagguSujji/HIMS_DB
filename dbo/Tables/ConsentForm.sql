CREATE TABLE [dbo].[ConsentForm] (
    [ConsentId]   INT           NOT NULL,
    [PatientId]   INT           NULL,
    [ConsentType] VARCHAR (100) NULL,
    [IsAgreed]    BIT           NULL,
    [SignedOn]    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([ConsentId] ASC)
);


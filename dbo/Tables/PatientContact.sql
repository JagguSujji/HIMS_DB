CREATE TABLE [dbo].[PatientContact] (
    [PatientContactId] BIGINT        IDENTITY (1, 1) NOT NULL,
    [PatientId]        BIGINT        NULL,
    [ContactType]      VARCHAR (50)  NULL,
    [ContactValue]     VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([PatientContactId] ASC)
);


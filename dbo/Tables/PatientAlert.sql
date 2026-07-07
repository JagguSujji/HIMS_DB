CREATE TABLE [dbo].[PatientAlert] (
    [PatientAlertId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [PatientId]      BIGINT         NULL,
    [AlertType]      VARCHAR (100)  NULL,
    [Description]    NVARCHAR (300) NULL,
    PRIMARY KEY CLUSTERED ([PatientAlertId] ASC)
);


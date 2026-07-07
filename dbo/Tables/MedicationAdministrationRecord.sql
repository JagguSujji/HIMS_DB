CREATE TABLE [dbo].[MedicationAdministrationRecord] (
    [MARId]          INT           NOT NULL,
    [PatientId]      INT           NULL,
    [DrugId]         INT           NULL,
    [Dose]           VARCHAR (100) NULL,
    [AdministeredBy] INT           NULL,
    [AdministeredOn] DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([MARId] ASC)
);


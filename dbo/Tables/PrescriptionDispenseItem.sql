CREATE TABLE [dbo].[PrescriptionDispenseItem] (
    [PrescriptionDispenseItemId] INT             IDENTITY (1, 1) NOT NULL,
    [DispenseId]                 INT             NULL,
    [DrugId]                     INT             NULL,
    [Quantity]                   DECIMAL (18, 2) NULL,
    [Dose]                       NVARCHAR (100)  NULL,
    PRIMARY KEY CLUSTERED ([PrescriptionDispenseItemId] ASC)
);


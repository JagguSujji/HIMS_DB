CREATE TABLE [dbo].[PharmacyDispense] (
    [DispenseId]     INT      NOT NULL,
    [PrescriptionId] INT      NULL,
    [DispenseDate]   DATETIME NULL,
    [DispensedBy]    INT      NULL,
    PRIMARY KEY CLUSTERED ([DispenseId] ASC)
);


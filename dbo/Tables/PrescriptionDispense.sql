CREATE TABLE [dbo].[PrescriptionDispense] (
    [DispenseId]     BIGINT   IDENTITY (1, 1) NOT NULL,
    [PrescriptionId] BIGINT   NULL,
    [DispenseDate]   DATETIME NULL,
    [DispensedBy]    BIGINT   NULL,
    PRIMARY KEY CLUSTERED ([DispenseId] ASC)
);


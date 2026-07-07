CREATE TABLE [dbo].[PharmacyDispenseAudit] (
    [DispenseAuditId]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [PrescriptionId]    BIGINT          NOT NULL,
    [DrugId]            BIGINT          NOT NULL,
    [BatchId]           BIGINT          NULL,
    [QuantityDispensed] DECIMAL (18, 2) NOT NULL,
    [DispensedBy]       BIGINT          NOT NULL,
    [DispensedOn]       DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    [StoreId]           BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([DispenseAuditId] ASC)
);


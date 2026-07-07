CREATE TABLE [dbo].[ControlledDrugRegister] (
    [RegisterId]  BIGINT          IDENTITY (1, 1) NOT NULL,
    [DrugId]      BIGINT          NOT NULL,
    [PatientId]   BIGINT          NULL,
    [DoctorId]    BIGINT          NULL,
    [Quantity]    DECIMAL (10, 2) NULL,
    [DispensedOn] DATETIME2 (7)   DEFAULT (getutcdate()) NULL,
    [WitnessedBy] BIGINT          NULL,
    PRIMARY KEY CLUSTERED ([RegisterId] ASC)
);


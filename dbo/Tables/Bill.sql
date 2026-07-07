CREATE TABLE [dbo].[Bill] (
    [BillId]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [PatientId]   BIGINT          NULL,
    [BillDate]    DATETIME        NULL,
    [TotalAmount] DECIMAL (18, 2) NULL,
    PRIMARY KEY CLUSTERED ([BillId] ASC)
);


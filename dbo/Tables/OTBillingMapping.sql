CREATE TABLE [dbo].[OTBillingMapping] (
    [OTBillingId]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [OTScheduleId]     BIGINT          NOT NULL,
    [InvoiceId]        BIGINT          NULL,
    [SurgeryCharge]    DECIMAL (18, 2) NULL,
    [OTCharge]         DECIMAL (18, 2) NULL,
    [AnesthesiaCharge] DECIMAL (18, 2) NULL,
    [ConsumableCharge] DECIMAL (18, 2) NULL,
    [TotalAmount]      DECIMAL (18, 2) NULL,
    PRIMARY KEY CLUSTERED ([OTBillingId] ASC),
    CONSTRAINT [FK_OTBilling_Schedule] FOREIGN KEY ([OTScheduleId]) REFERENCES [dbo].[OTSchedule] ([OTScheduleId])
);


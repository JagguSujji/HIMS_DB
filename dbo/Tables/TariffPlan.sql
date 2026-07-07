CREATE TABLE [dbo].[TariffPlan] (
    [TariffPlanId]    INT            IDENTITY (1, 1) NOT NULL,
    [TariffPlanCode]  VARCHAR (20)   NULL,
    [TariffPlanName]  NVARCHAR (100) NULL,
    [InsuranceTypeId] INT            NULL,
    [EffectiveFrom]   DATE           NULL,
    [EffectiveTo]     DATE           NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([TariffPlanId] ASC),
    FOREIGN KEY ([InsuranceTypeId]) REFERENCES [dbo].[InsuranceType] ([InsuranceTypeId])
);


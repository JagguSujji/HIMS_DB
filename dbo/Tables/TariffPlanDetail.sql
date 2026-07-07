CREATE TABLE [dbo].[TariffPlanDetail] (
    [TariffDetailId]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [TariffPlanId]      BIGINT          NOT NULL,
    [ServiceId]         BIGINT          NOT NULL,
    [Price]             DECIMAL (18, 2) NOT NULL,
    [InsuranceSharePct] DECIMAL (5, 2)  NULL,
    [IsCovered]         BIT             DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([TariffDetailId] ASC)
);


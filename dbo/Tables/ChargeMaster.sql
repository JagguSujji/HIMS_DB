CREATE TABLE [dbo].[ChargeMaster] (
    [ChargeId]   INT             NOT NULL,
    [ChargeCode] VARCHAR (50)    NULL,
    [ChargeName] VARCHAR (200)   NULL,
    [Amount]     DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([ChargeId] ASC)
);


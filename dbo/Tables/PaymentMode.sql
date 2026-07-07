CREATE TABLE [dbo].[PaymentMode] (
    [PaymentModeId]   INT            IDENTITY (1, 1) NOT NULL,
    [PaymentModeCode] VARCHAR (20)   NULL,
    [PaymentModeName] NVARCHAR (100) NULL,
    [IsElectronic]    BIT            NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([PaymentModeId] ASC)
);


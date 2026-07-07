CREATE TABLE [dbo].[BillingType] (
    [BillingTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [BillingTypeCode] VARCHAR (20)   NULL,
    [BillingTypeName] NVARCHAR (100) NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([BillingTypeId] ASC)
);


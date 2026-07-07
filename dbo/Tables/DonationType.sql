CREATE TABLE [dbo].[DonationType] (
    [DonationTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [DonationTypeCode] VARCHAR (20)   NULL,
    [DonationTypeName] NVARCHAR (100) NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([DonationTypeId] ASC)
);


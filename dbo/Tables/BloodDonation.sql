CREATE TABLE [dbo].[BloodDonation] (
    [DonationId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [DonorName]    NVARCHAR (200) NULL,
    [DonationDate] DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([DonationId] ASC)
);


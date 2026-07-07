CREATE TABLE [dbo].[InsuranceClaim] (
    [ClaimId]   BIGINT   IDENTITY (1, 1) NOT NULL,
    [PolicyId]  BIGINT   NULL,
    [ClaimDate] DATETIME NULL,
    PRIMARY KEY CLUSTERED ([ClaimId] ASC)
);


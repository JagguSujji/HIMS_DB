CREATE TABLE [dbo].[ClaimReason] (
    [ClaimReasonId]   INT            IDENTITY (1, 1) NOT NULL,
    [ClaimReasonCode] VARCHAR (20)   NULL,
    [ClaimReasonName] NVARCHAR (100) NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ClaimReasonId] ASC)
);


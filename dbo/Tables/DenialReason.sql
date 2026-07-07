CREATE TABLE [dbo].[DenialReason] (
    [DenialReasonId]   INT            IDENTITY (1, 1) NOT NULL,
    [DenialReasonCode] VARCHAR (20)   NULL,
    [DenialReasonName] NVARCHAR (200) NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([DenialReasonId] ASC)
);


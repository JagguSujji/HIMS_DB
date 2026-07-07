CREATE TABLE [dbo].[RefundReason] (
    [RefundReasonId]   INT            IDENTITY (1, 1) NOT NULL,
    [RefundReasonCode] VARCHAR (20)   NULL,
    [RefundReasonName] NVARCHAR (100) NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([RefundReasonId] ASC)
);


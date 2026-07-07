CREATE TABLE [dbo].[PaymentStatus] (
    [PaymentStatusId]   INT            IDENTITY (1, 1) NOT NULL,
    [PaymentStatusCode] VARCHAR (20)   NULL,
    [PaymentStatusName] NVARCHAR (100) NULL,
    [IsClosed]          BIT            DEFAULT ((0)) NULL,
    [IsActive]          BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([PaymentStatusId] ASC)
);


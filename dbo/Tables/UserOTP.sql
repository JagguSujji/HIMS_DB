CREATE TABLE [dbo].[UserOTP] (
    [OTPId]      INT          IDENTITY (1, 1) NOT NULL,
    [UserId]     INT          NULL,
    [OTPCode]    VARCHAR (10) NULL,
    [ExpiryTime] DATETIME     NULL,
    [IsUsed]     BIT          DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([OTPId] ASC)
);


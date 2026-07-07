CREATE TABLE [dbo].[UserPasswordReset] (
    [ResetId]    INT           IDENTITY (1, 1) NOT NULL,
    [UserId]     INT           NULL,
    [Token]      VARCHAR (200) NULL,
    [ExpiryTime] DATETIME      NULL,
    [IsUsed]     BIT           DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([ResetId] ASC)
);


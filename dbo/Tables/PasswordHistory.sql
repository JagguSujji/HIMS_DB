CREATE TABLE [dbo].[PasswordHistory] (
    [PasswordHistoryId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserId]            INT            NOT NULL,
    [PasswordHash]      NVARCHAR (500) NOT NULL,
    [ChangedOn]         DATETIME2 (7)  NOT NULL,
    [ChangedBy]         INT            NULL,
    PRIMARY KEY CLUSTERED ([PasswordHistoryId] ASC),
    CONSTRAINT [FK_PasswordHistory_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[ApplicationUser] ([UserId])
);


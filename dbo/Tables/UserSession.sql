CREATE TABLE [dbo].[UserSession] (
    [SessionId]       UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [UserId]          INT              NOT NULL,
    [LoginTime]       DATETIME2 (7)    NOT NULL,
    [LogoutTime]      DATETIME2 (7)    NULL,
    [IPAddress]       VARCHAR (100)    NULL,
    [DeviceName]      NVARCHAR (200)   NULL,
    [BrowserName]     NVARCHAR (200)   NULL,
    [OperatingSystem] NVARCHAR (200)   NULL,
    [RefreshToken]    NVARCHAR (MAX)   NULL,
    [IsActive]        BIT              DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([SessionId] ASC),
    CONSTRAINT [FK_UserSession_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[ApplicationUser] ([UserId])
);


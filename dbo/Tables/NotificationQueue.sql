CREATE TABLE [dbo].[NotificationQueue] (
    [NotificationId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserId]         BIGINT         NULL,
    [Message]        NVARCHAR (500) NULL,
    [Type]           NVARCHAR (50)  NULL,
    [IsRead]         BIT            DEFAULT ((0)) NULL,
    [CreatedOn]      DATETIME2 (7)  DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([NotificationId] ASC)
);


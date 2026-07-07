CREATE TABLE [dbo].[NotificationType] (
    [NotificationTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [NotificationTypeCode] VARCHAR (20)   NULL,
    [NotificationTypeName] NVARCHAR (100) NULL,
    [IsActive]             BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([NotificationTypeId] ASC)
);


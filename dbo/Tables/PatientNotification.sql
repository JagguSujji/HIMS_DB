CREATE TABLE [dbo].[PatientNotification] (
    [NotificationId] INT            NOT NULL,
    [PatientId]      INT            NULL,
    [Message]        NVARCHAR (MAX) NULL,
    [IsRead]         BIT            NULL,
    [CreatedOn]      DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([NotificationId] ASC)
);


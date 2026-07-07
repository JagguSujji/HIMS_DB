CREATE     PROCEDURE [dbo].[USP_Notification_Create]

(
 @UserId INT=NULL,
 @PatientId INT=NULL,
 @NotificationTypeId INT,
 @Message NVARCHAR(MAX),
 @CreatedBy INT=NULL
)

AS
BEGIN

SET NOCOUNT ON;


IF @UserId IS NOT NULL
BEGIN

INSERT INTO NotificationQueue
(
 UserId,
 Message,
 Type,
 IsRead,
 CreatedOn
)
VALUES
(
 @UserId,
 @Message,
 @NotificationTypeId,
 0,
 GETDATE()
);

END


IF @PatientId IS NOT NULL
BEGIN

INSERT INTO PatientNotification
(
 PatientId,
 Message,
 IsRead,
 CreatedOn
)
VALUES
(
 @PatientId,
 @Message,
 0,
 GETDATE()
);

END


SELECT SCOPE_IDENTITY() NotificationId;


END

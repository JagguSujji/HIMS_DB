



/************************************************************
 NOTIFICATION ENGINE
************************************************************/


CREATE     PROCEDURE [dbo].[USP_Notification_SendUser]
(
 @UserId INT,
 @Message NVARCHAR(MAX),
 @Type VARCHAR(50)
)
AS
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
 @Type,
 0,
 GETDATE()
)


END

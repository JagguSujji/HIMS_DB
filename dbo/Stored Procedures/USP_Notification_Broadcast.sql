


CREATE     PROCEDURE [dbo].[USP_Notification_Broadcast]
(
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

SELECT

UserId,
@Message,
@Type,
0,
GETDATE()

FROM ApplicationUser

WHERE IsActive=1


END

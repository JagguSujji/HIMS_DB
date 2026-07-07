


CREATE     PROCEDURE [dbo].[USP_Notification_Unread_Count]
(
 @UserId INT
)
AS
BEGIN


SELECT COUNT(*) TotalUnread

FROM NotificationQueue

WHERE UserId=@UserId

AND IsRead=0


END

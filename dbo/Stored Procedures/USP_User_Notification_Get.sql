CREATE     PROCEDURE [dbo].[USP_User_Notification_Get]


(
 @UserId INT
)

AS
BEGIN


SELECT

NotificationId,
Message,
Type,
IsRead,
CreatedOn


FROM NotificationQueue


WHERE

UserId=@UserId


ORDER BY

CreatedOn DESC;


END

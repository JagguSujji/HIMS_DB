CREATE     PROCEDURE [dbo].[USP_Notification_Pending_Get]


AS
BEGIN


SELECT


NotificationId,

UserId,

Message,

Type


FROM NotificationQueue


WHERE


IsRead=0


ORDER BY

CreatedOn;



END

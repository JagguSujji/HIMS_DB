CREATE     PROCEDURE [dbo].[USP_Notification_MarkRead]


(
 @NotificationId INT
)

AS
BEGIN


UPDATE NotificationQueue


SET

IsRead=1


WHERE NotificationId=@NotificationId;



END

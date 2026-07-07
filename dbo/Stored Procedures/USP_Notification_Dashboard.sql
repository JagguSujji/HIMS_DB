CREATE     PROCEDURE [dbo].[USP_Notification_Dashboard]


AS
BEGIN


SELECT


COUNT(*) TotalNotifications,


SUM
(
CASE WHEN IsRead=0 THEN 1 ELSE 0 END
)

UnreadNotifications


FROM NotificationQueue;



SELECT


COUNT(*) PatientNotifications


FROM PatientNotification;



END

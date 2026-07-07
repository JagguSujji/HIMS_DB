CREATE     PROCEDURE [dbo].[USP_Notification_Cleanup]


(
 @Days INT=180

)

AS
BEGIN


DELETE FROM NotificationQueue


WHERE


CreatedOn < DATEADD(DAY,-@Days,GETDATE());



END

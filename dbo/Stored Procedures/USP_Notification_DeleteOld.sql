


CREATE     PROCEDURE [dbo].[USP_Notification_DeleteOld]
(
 @Days INT=90
)
AS
BEGIN


DELETE FROM NotificationQueue

WHERE CreatedOn < DATEADD(DAY,-@Days,GETDATE())


END

CREATE     PROCEDURE [dbo].[USP_Patient_Notification_Get]


(
 @PatientId INT
)

AS
BEGIN


SELECT


NotificationId,

Message,

IsRead,

CreatedOn


FROM PatientNotification


WHERE PatientId=@PatientId


ORDER BY

CreatedOn DESC;



END

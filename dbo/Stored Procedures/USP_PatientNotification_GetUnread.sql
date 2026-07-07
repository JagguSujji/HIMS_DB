CREATE     PROCEDURE [dbo].[USP_PatientNotification_GetUnread]
(
 @PatientId INT
)
AS
BEGIN

SET NOCOUNT ON;


SELECT
 NotificationId,
 PatientId,
 Message,
 IsRead,
 CreatedOn
FROM dbo.PatientNotification
WHERE PatientId=@PatientId
AND IsRead=0
ORDER BY CreatedOn DESC;


END

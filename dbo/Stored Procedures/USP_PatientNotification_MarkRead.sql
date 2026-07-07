CREATE     PROCEDURE [dbo].[USP_PatientNotification_MarkRead]
(
 @NotificationId INT
)
AS
BEGIN

SET NOCOUNT ON;


UPDATE dbo.PatientNotification
SET
 IsRead=1
WHERE NotificationId=@NotificationId;


SELECT @NotificationId AS NotificationId;


END

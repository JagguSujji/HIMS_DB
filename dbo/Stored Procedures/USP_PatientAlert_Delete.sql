CREATE     PROCEDURE [dbo].[USP_PatientAlert_Delete]
(
 @PatientAlertId INT
)
AS
BEGIN

DELETE FROM dbo.PatientAlert
WHERE PatientAlertId=@PatientAlertId;


SELECT @PatientAlertId AS DeletedId;

END

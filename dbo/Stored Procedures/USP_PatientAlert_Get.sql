CREATE     PROCEDURE [dbo].[USP_PatientAlert_Get]
(
 @PatientId INT
)
AS
BEGIN

SET NOCOUNT ON;

SELECT
 PatientAlertId,
 PatientId,
 AlertType,
 Description
FROM dbo.PatientAlert
WHERE PatientId=@PatientId;


END

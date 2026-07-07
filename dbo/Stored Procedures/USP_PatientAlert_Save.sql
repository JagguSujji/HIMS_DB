CREATE     PROCEDURE [dbo].[USP_PatientAlert_Save]
(
    @PatientAlertId INT=NULL,
    @PatientId INT,
    @AlertType VARCHAR(100),
    @Description VARCHAR(500)
)
AS
BEGIN

SET NOCOUNT ON;


BEGIN TRY


IF EXISTS
(
 SELECT 1 FROM dbo.PatientAlert
 WHERE PatientAlertId=@PatientAlertId
)
BEGIN

UPDATE dbo.PatientAlert
SET
 AlertType=@AlertType,
 Description=@Description
WHERE PatientAlertId=@PatientAlertId;


END
ELSE
BEGIN


INSERT INTO dbo.PatientAlert
(
PatientId,
AlertType,
Description
)
VALUES
(
@PatientId,
@AlertType,
@Description
);


SET @PatientAlertId=SCOPE_IDENTITY();

END


SELECT @PatientAlertId AS PatientAlertId;


END TRY
BEGIN CATCH

THROW;

END CATCH

END

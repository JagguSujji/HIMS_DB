CREATE     PROCEDURE [dbo].[USP_PatientNotification_Create]
(
 @PatientId INT,
 @Message VARCHAR(MAX)
)
AS
BEGIN

SET NOCOUNT ON;

BEGIN TRY


INSERT INTO dbo.PatientNotification
(
 PatientId,
 Message,
 IsRead,
 CreatedOn
)
VALUES
(
 @PatientId,
 @Message,
 0,
 GETDATE()
);


SELECT SCOPE_IDENTITY() AS NotificationId;


END TRY
BEGIN CATCH

THROW;

END CATCH

END

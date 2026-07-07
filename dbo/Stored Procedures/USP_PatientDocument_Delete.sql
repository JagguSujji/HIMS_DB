CREATE     PROCEDURE [dbo].[USP_PatientDocument_Delete]
(
    @PatientDocumentId INT
)
AS
BEGIN

SET NOCOUNT ON;

BEGIN TRY

DELETE FROM dbo.PatientDocument
WHERE PatientDocumentId=@PatientDocumentId;


SELECT @PatientDocumentId AS DeletedId;


END TRY
BEGIN CATCH

THROW;

END CATCH

END

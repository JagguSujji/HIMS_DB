


CREATE     PROCEDURE [dbo].[USP_PatientDocument_Verify]
(
 @PatientDocumentId BIGINT,
 @VerifiedBy BIGINT
)
AS
BEGIN

UPDATE dbo.PatientDocument
SET IsVerified=1
WHERE PatientDocumentId=@PatientDocumentId;

END

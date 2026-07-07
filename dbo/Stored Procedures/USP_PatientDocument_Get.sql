CREATE     PROCEDURE [dbo].[USP_PatientDocument_Get]
(
    @PatientId INT
)
AS
BEGIN

SET NOCOUNT ON;

BEGIN TRY

SELECT
    PD.PatientDocumentId,
    PD.PatientId,
    PD.DocumentTypeId,
    DT.DocumentTypeName,
    PD.FilePath
FROM dbo.PatientDocument PD
LEFT JOIN dbo.DocumentType DT
ON DT.DocumentTypeId = PD.DocumentTypeId
WHERE PD.PatientId=@PatientId;


END TRY
BEGIN CATCH

THROW;

END CATCH

END

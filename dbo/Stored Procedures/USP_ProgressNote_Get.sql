


/*--------------------------------------------------------
 Progress Note Get
--------------------------------------------------------*/
CREATE     PROCEDURE [dbo].[USP_ProgressNote_Get]
(
 @PatientId INT
)
AS
BEGIN

SELECT
 ProgressNoteId,
 EncounterId,
 Assessment,
 [Plan],
 CreatedOn
FROM ProgressNote
WHERE PatientId=@PatientId
ORDER BY CreatedOn DESC;

END

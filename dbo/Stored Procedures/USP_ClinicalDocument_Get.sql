


---------------------------------------------------------------
-- 2. Clinical Document Get
---------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ClinicalDocument_Get]
(
 @PatientId INT
)
AS
BEGIN

SELECT
DocumentId,
PatientId,
EncounterId,
DocumentType,
Title,
Content,
CreatedOn,
IsFinal

FROM dbo.ClinicalDocument

WHERE PatientId=@PatientId

ORDER BY CreatedOn DESC;

END

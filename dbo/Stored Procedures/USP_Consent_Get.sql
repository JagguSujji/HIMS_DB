


---------------------------------------------------------------
-- 9. Consent Get
---------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Consent_Get]
(
 @PatientId INT
)
AS
BEGIN

SELECT *
FROM dbo.ConsentForm
WHERE PatientId=@PatientId
ORDER BY SignedOn DESC;

END

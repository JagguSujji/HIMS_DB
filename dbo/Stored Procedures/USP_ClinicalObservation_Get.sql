


---------------------------------------------------------------
-- 7. Observation History
---------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ClinicalObservation_Get]
(
 @PatientId INT
)
AS
BEGIN

SELECT *
FROM dbo.ClinicalObservation
WHERE PatientId=@PatientId
ORDER BY RecordedOn DESC;

END

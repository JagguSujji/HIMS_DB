


/*--------------------------------------------------------
 Vital History
--------------------------------------------------------*/
CREATE     PROCEDURE [dbo].[USP_VitalSigns_GetHistory]
(
 @PatientId INT
)
AS
BEGIN

SELECT
 VS.*,
 VT.VitalName
FROM VitalSigns VS
INNER JOIN VitalType VT
ON VS.VitalTypeId=VT.VitalTypeId
WHERE VS.PatientId=@PatientId
ORDER BY RecordedOn DESC;

END

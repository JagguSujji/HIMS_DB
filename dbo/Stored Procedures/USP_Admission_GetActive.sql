


CREATE     PROCEDURE [dbo].[USP_Admission_GetActive]
(
 @PatientId BIGINT
)
AS
BEGIN

SELECT *
FROM dbo.Admission
WHERE PatientId=@PatientId
AND DischargeDate IS NULL;

END

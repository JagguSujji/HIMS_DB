CREATE     PROCEDURE [dbo].[USP_Admission_GetHistory]
(
 @PatientId INT
)
AS
BEGIN

SET NOCOUNT ON;

BEGIN TRY

SELECT
 A.AdmissionId,
 A.PatientId,
 A.AdmissionDate,
 A.DischargeDate,
 A.RoomId,
 A.BedId,
 S.StatusName AS AdmissionStatus,
 R.RoomNumber,
 B.BedNumber
FROM dbo.Admission A

LEFT JOIN dbo.AdmissionStatus S
ON S.AdmissionStatusId=A.AdmissionStatusId

LEFT JOIN dbo.Room R
ON R.RoomId=A.RoomId

LEFT JOIN dbo.Bed B
ON B.BedId=A.BedId

WHERE A.PatientId=@PatientId
ORDER BY A.AdmissionDate DESC;


END TRY
BEGIN CATCH
THROW;
END CATCH

END

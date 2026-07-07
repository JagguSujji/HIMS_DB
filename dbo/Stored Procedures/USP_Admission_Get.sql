CREATE     PROCEDURE [dbo].[USP_Admission_Get]


(
 @AdmissionId BIGINT
)

AS
BEGIN


SELECT


A.AdmissionId,

A.PatientId,

P.UHID,

P.FirstName,

A.AdmissionDate,

AS1.StatusName,

R.RoomNumber,

B.BedNumber



FROM dbo.Admission A


INNER JOIN dbo.Patient P

ON A.PatientId=P.PatientId


LEFT JOIN dbo.AdmissionStatus AS1

ON A.AdmissionStatusId=AS1.AdmissionStatusId


LEFT JOIN dbo.Room R

ON A.RoomId=R.RoomId


LEFT JOIN dbo.Bed B

ON A.BedId=B.BedId



WHERE

A.AdmissionId=@AdmissionId;



END

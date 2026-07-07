CREATE     PROCEDURE [dbo].[USP_IPD_PatientDetails_Get]
(
 @AdmissionId INT
)
AS
BEGIN

SET NOCOUNT ON;


SELECT

A.AdmissionId,
P.PatientId,
P.UHID,
P.FirstName,
P.LastName,
P.Mobile,

A.AdmissionDate,

W.WardName,
R.RoomNumber,
B.BedNumber,

S.StatusName AdmissionStatus


FROM dbo.Admission A

INNER JOIN dbo.Patient P
ON P.PatientId=A.PatientId

LEFT JOIN dbo.Bed B
ON B.BedId=A.BedId

LEFT JOIN dbo.Room R
ON R.RoomId=B.RoomId

LEFT JOIN dbo.Ward W
ON W.WardId=R.WardId

LEFT JOIN dbo.AdmissionStatus S
ON S.AdmissionStatusId=A.AdmissionStatusId


WHERE A.AdmissionId=@AdmissionId;


END

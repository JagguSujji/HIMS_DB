CREATE     PROCEDURE [dbo].[USP_IPD_CurrentPatients]


AS
BEGIN


SELECT


A.AdmissionId,

P.UHID,

P.FirstName,

A.AdmissionDate,

R.RoomNumber,

B.BedNumber



FROM dbo.Admission A


INNER JOIN dbo.Patient P

ON A.PatientId=P.PatientId


INNER JOIN dbo.Bed B

ON A.BedId=B.BedId


INNER JOIN dbo.Room R

ON B.RoomId=R.RoomId



WHERE


A.DischargeDate IS NULL;



END

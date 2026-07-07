CREATE     PROCEDURE [dbo].[USP_Inpatient_List]


AS
BEGIN


SELECT


A.AdmissionId,

P.UHID,

P.FirstName,


A.AdmissionDate,


W.WardName,

R.RoomNumber,

B.BedNumber


FROM dbo.Admission A


INNER JOIN dbo.Patient P

ON A.PatientId=P.PatientId


INNER JOIN dbo.BedAllocation BA

ON A.AdmissionId=BA.AdmissionId


INNER JOIN dbo.Bed B

ON BA.BedId=B.BedId


INNER JOIN dbo.Room R

ON B.RoomId=R.RoomId


INNER JOIN dbo.Ward W

ON R.FloorId=W.WardId


WHERE

BA.ToDate IS NULL;



END

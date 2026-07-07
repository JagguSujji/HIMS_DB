CREATE     PROCEDURE [dbo].[USP_Patient_CurrentBed]


(
 @PatientId BIGINT
)

AS
BEGIN


SELECT


P.UHID,

P.FirstName,


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

P.PatientId=@PatientId


AND BA.ToDate IS NULL;



END




-------------------------------------------------------------
-- 20. Today Appointment List
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Appointment_TodayList]
(
 @DoctorId INT=NULL
)
AS
BEGIN


SELECT

A.AppointmentId,
A.AppointmentDate,
P.UHID,
P.FirstName,
P.LastName,
A.ReasonForVisit

FROM dbo.Appointment A

INNER JOIN dbo.Patient P
ON P.PatientId=A.PatientId

WHERE

CAST(A.AppointmentDate AS DATE)
=
CAST(GETDATE() AS DATE)

AND
(@DoctorId IS NULL OR A.DoctorId=@DoctorId)

ORDER BY A.AppointmentDate;


END

CREATE     PROCEDURE [dbo].[USP_Appointment_GetDoctorDay]

(
 @DoctorId BIGINT,
 @Date DATE
)

AS
BEGIN


SELECT

A.AppointmentId,

A.PatientId,

P.UHID,

P.FirstName+' '+P.LastName AS PatientName,

A.AppointmentDate,

S.StatusName


FROM dbo.Appointment A


INNER JOIN dbo.Patient P

ON A.PatientId=P.PatientId


INNER JOIN dbo.AppointmentStatus S

ON A.AppointmentStatusId=S.AppointmentStatusId



WHERE

A.DoctorId=@DoctorId

AND CAST(A.AppointmentDate AS DATE)=@Date;


END

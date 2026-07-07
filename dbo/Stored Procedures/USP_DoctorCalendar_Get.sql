CREATE     PROCEDURE [dbo].[USP_DoctorCalendar_Get]


(
 @DoctorId BIGINT,

 @Date DATE

)

AS
BEGIN


SELECT


APS.SlotId,

APS.StartTime,

APS.EndTime,

APS.IsBooked,


P.UHID,

P.FirstName,


A.AppointmentId


FROM dbo.AppointmentSlot APS


LEFT JOIN dbo.Appointment A

ON APS.DoctorId=A.DoctorId

AND APS.SlotDate=A.AppointmentDate



LEFT JOIN dbo.Patient P

ON A.PatientId=P.PatientId



WHERE


APS.DoctorId=@DoctorId


AND APS.SlotDate=@Date



ORDER BY

APS.StartTime;



END

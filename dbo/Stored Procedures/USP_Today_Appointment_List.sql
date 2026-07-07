CREATE     PROCEDURE [dbo].[USP_Today_Appointment_List]


AS
BEGIN


SELECT


A.AppointmentId,

P.UHID,

P.FirstName,

P.LastName,

A.AppointmentDate,

A.AppointmentStatusId


FROM dbo.Appointment A


INNER JOIN dbo.Patient P

ON A.PatientId=P.PatientId



WHERE


CAST(A.AppointmentDate AS DATE)=CAST(GETDATE() AS DATE)


ORDER BY

A.AppointmentDate;



END

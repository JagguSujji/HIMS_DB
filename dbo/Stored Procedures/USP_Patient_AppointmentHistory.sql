CREATE     PROCEDURE [dbo].[USP_Patient_AppointmentHistory]


(
 @PatientId BIGINT
)

AS
BEGIN


SELECT


A.AppointmentId,

A.AppointmentDate,

E.FirstName+' '+E.LastName AS DoctorName,


APS.StartTime,

APS.EndTime


FROM dbo.Appointment A


INNER JOIN dbo.Provider PR

ON A.DoctorId=PR.ProviderId


INNER JOIN dbo.Employee E

ON PR.EmployeeId=E.EmployeeId


LEFT JOIN dbo.AppointmentSlot APS

ON A.DoctorId=APS.DoctorId


WHERE


A.PatientId=@PatientId


ORDER BY

A.AppointmentDate DESC;



END

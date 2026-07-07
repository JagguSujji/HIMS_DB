



CREATE     PROCEDURE [dbo].[USP_Doctor_Productivity_Report]
(
 @DoctorId INT=NULL,
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN


SELECT

D.EmployeeId,

E.FirstName+' '+E.LastName DoctorName,

COUNT(A.AppointmentId) Appointments,

COUNT(V.VisitId) Visits,


AVG(CAST(DATEDIFF(MINUTE,
E.JoiningDate,
GETDATE()) AS FLOAT))
AverageExperience


FROM Provider D

INNER JOIN Employee E
ON D.EmployeeId=E.EmployeeId

LEFT JOIN Appointment A
ON A.DoctorId=D.ProviderId

LEFT JOIN Visit V
ON V.DoctorId=D.ProviderId


WHERE
(@DoctorId IS NULL OR D.ProviderId=@DoctorId)

GROUP BY
D.EmployeeId,
E.FirstName,
E.LastName


END

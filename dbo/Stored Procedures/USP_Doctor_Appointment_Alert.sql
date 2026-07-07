CREATE     PROCEDURE [dbo].[USP_Doctor_Appointment_Alert]


AS
BEGIN


INSERT INTO NotificationQueue
(
UserId,
Message,
Type,
IsRead,
CreatedOn
)


SELECT


AU.UserId,


'New appointment assigned to you.',


'APPOINTMENT',


0,


GETDATE()



FROM Appointment A


INNER JOIN Provider P

ON A.DoctorId=P.EmployeeId


INNER JOIN ApplicationUser AU

ON P.EmployeeId=AU.EmployeeId



WHERE


CAST(A.AppointmentDate AS DATE)=CAST(GETDATE() AS DATE);



END

CREATE     PROCEDURE [dbo].[USP_FrontOffice_Dashboard]


AS
BEGIN


SELECT


(
SELECT COUNT(*)

FROM Patient

WHERE CAST(RegistrationDate AS DATE)=CAST(GETDATE() AS DATE)

) NewPatients,


(
SELECT COUNT(*)

FROM Appointment

WHERE CAST(AppointmentDate AS DATE)=CAST(GETDATE() AS DATE)

) Appointments,


(
SELECT COUNT(*)

FROM Visit

WHERE CAST(CheckInTime AS DATE)=CAST(GETDATE() AS DATE)

) CheckedInPatients,


(
SELECT COUNT(*)

FROM QueueToken

WHERE Status='WAITING'

) WaitingPatients;



END

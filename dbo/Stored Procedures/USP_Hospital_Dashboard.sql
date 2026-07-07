CREATE     PROCEDURE [dbo].[USP_Hospital_Dashboard]

AS
BEGIN

SELECT

(
SELECT COUNT(*)
FROM Patient
WHERE CAST(RegistrationDate AS DATE)=CAST(GETDATE() AS DATE)
) TodayNewPatients,


(
SELECT COUNT(*)
FROM Visit
WHERE CAST(VisitDate AS DATE)=CAST(GETDATE() AS DATE)
) TodayVisits,


(
SELECT COUNT(*)
FROM Admission
WHERE AdmissionStatusId=1
) CurrentAdmissions,


(
SELECT COUNT(*)
FROM Bed
WHERE IsOccupied=1
) OccupiedBeds,


(
SELECT COUNT(*)
FROM Appointment
WHERE CAST(AppointmentDate AS DATE)=CAST(GETDATE() AS DATE)
) TodayAppointments,


(
SELECT COUNT(*)
FROM LabOrder
WHERE CAST(OrderDate AS DATE)=CAST(GETDATE() AS DATE)
) LabOrders,


(
SELECT COUNT(*)
FROM RadiologyOrder
WHERE CAST(OrderDate AS DATE)=CAST(GETDATE() AS DATE)
) RadiologyOrders;


END

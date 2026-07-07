CREATE     PROCEDURE [dbo].[USP_Management_KPI_Dashboard]


AS
BEGIN


SELECT


(
SELECT COUNT(*)
FROM Patient
)
TotalPatients,


(
SELECT COUNT(*)
FROM Admission
WHERE AdmissionStatusId=1
)
ActiveIPD,


(
SELECT COUNT(*)
FROM Bed
WHERE IsOccupied=1
)
BedOccupancy,


(
SELECT SUM(TotalAmount)
FROM InvoiceHeader
)
TotalBilling,


(
SELECT SUM(Amount)
FROM Payment
)
TotalCollection;



END

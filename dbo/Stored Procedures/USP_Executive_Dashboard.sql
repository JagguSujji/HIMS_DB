/* ============================================================
 MODULE 14
 REPORTING, DASHBOARD, ANALYTICS & MIS
 MISSING STORED PROCEDURES ONLY
============================================================ */


/***************************************************************
 EXECUTIVE MANAGEMENT REPORTS
****************************************************************/


CREATE     PROCEDURE [dbo].[USP_Executive_Dashboard]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN

SELECT

(SELECT COUNT(*) 
 FROM Patient
 WHERE RegistrationDate BETWEEN @FromDate AND @ToDate)
AS TotalPatients,


(SELECT COUNT(*)
 FROM Visit
 WHERE VisitDate BETWEEN @FromDate AND @ToDate)
AS TotalOPVisits,


(SELECT COUNT(*)
 FROM Admission
 WHERE AdmissionDate BETWEEN @FromDate AND @ToDate)
AS TotalAdmissions,


(SELECT COUNT(*)
 FROM Surgery
 WHERE SurgeryDate BETWEEN @FromDate AND @ToDate)
AS TotalSurgeries,


(SELECT SUM(TotalAmount)
 FROM InvoiceHeader
 WHERE CreatedOn BETWEEN @FromDate AND @ToDate)
AS Revenue


END

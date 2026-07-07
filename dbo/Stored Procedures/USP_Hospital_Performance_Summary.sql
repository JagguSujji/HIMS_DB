



CREATE     PROCEDURE [dbo].[USP_Hospital_Performance_Summary]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN

SELECT

H.HospitalName,

COUNT(DISTINCT P.PatientId) Patients,

COUNT(DISTINCT V.VisitId) Visits,

--COUNT(DISTINCT A.AdmissionId) Admissions,

SUM(I.TotalAmount) Revenue


FROM Hospital H

LEFT JOIN Branch B
ON H.HospitalId=B.HospitalId

LEFT JOIN Patient P
ON 1=1

LEFT JOIN Visit V
ON V.PatientId=P.PatientId

LEFT JOIN InvoiceHeader I
ON I.PatientId=P.PatientId


GROUP BY H.HospitalName

END

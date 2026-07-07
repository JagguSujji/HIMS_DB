



/***************************************************************
 IPD ANALYTICS
****************************************************************/


CREATE     PROCEDURE [dbo].[USP_IPD_Revenue_Report]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN


SELECT

B.BranchName,

COUNT(A.AdmissionId) Admissions,

SUM(I.TotalAmount) Revenue


FROM Admission A

INNER JOIN Patient P
ON P.PatientId=A.PatientId

LEFT JOIN InvoiceHeader I
ON I.PatientId=P.PatientId

LEFT JOIN Branch B
ON B.BranchId=A.RoomId


WHERE A.AdmissionDate BETWEEN @FromDate AND @ToDate

GROUP BY B.BranchName


END

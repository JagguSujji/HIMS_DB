



CREATE     PROCEDURE [dbo].[USP_Length_Of_Stay_Report]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN


SELECT

AVG(DATEDIFF
(
DAY,
AdmissionDate,
ISNULL(DischargeDate,GETDATE())
))
AverageLOS,


COUNT(*) TotalAdmissions


FROM Admission

WHERE AdmissionDate BETWEEN @FromDate AND @ToDate


END

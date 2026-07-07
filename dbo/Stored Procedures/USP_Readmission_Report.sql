



CREATE     PROCEDURE [dbo].[USP_Readmission_Report]
(
 @Days INT=30
)
AS
BEGIN


SELECT

PatientId,

COUNT(*) AdmissionCount


FROM Admission


WHERE AdmissionDate >= DATEADD(DAY,-@Days,GETDATE())


GROUP BY PatientId

HAVING COUNT(*)>1


END

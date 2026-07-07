CREATE     PROCEDURE [dbo].[USP_IPD_Census_Report]


AS
BEGIN


SELECT


COUNT(*) TotalAdmissions,


SUM(CASE WHEN AdmissionStatusId=1 THEN 1 ELSE 0 END)
ActivePatients,


SUM(CASE WHEN DischargeDate IS NOT NULL THEN 1 ELSE 0 END)
DischargedPatients


FROM Admission;


END

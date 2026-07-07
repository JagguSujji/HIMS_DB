CREATE     PROCEDURE [dbo].[USP_IPD_AdmissionSummary_Get]
(
 @PatientId INT
)
AS
BEGIN

SET NOCOUNT ON;


SELECT

COUNT(*) TotalAdmissions,

SUM
(
CASE WHEN DischargeDate IS NULL THEN 1 ELSE 0 END
)
CurrentAdmissions

FROM dbo.Admission

WHERE PatientId=@PatientId;


END




CREATE     PROCEDURE [dbo].[USP_IPD_PatientClinicalSummary]
(
 @AdmissionId BIGINT
)
AS
BEGIN

SELECT
A.AdmissionId,
P.UHID,
P.FirstName,
P.LastName,
CN.NoteText,
PN.Assessment,
PN.[Plan]

FROM dbo.Admission A

INNER JOIN dbo.Patient P
ON A.PatientId=P.PatientId

LEFT JOIN dbo.ClinicalNote CN
ON CN.PatientId=P.PatientId

LEFT JOIN dbo.ProgressNote PN
ON PN.PatientId=P.PatientId

WHERE A.AdmissionId=@AdmissionId;

END

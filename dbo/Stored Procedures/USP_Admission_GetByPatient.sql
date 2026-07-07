


--------------------------------------------------------------
-- ADMISSION / IPD MODULE
--------------------------------------------------------------


CREATE     PROCEDURE [dbo].[USP_Admission_GetByPatient]
(
 @PatientId BIGINT
)
AS
BEGIN

SELECT *
FROM dbo.Admission
WHERE PatientId=@PatientId
ORDER BY AdmissionDate DESC;

END

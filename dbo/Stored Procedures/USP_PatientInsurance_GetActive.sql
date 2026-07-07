


CREATE     PROCEDURE [dbo].[USP_PatientInsurance_GetActive]
(
 @PatientId BIGINT
)
AS
BEGIN

SELECT *
FROM dbo.PatientInsurance
WHERE PatientId=@PatientId;

END

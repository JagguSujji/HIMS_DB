


/***********************************************************
 Patient Insurance Policy
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_InsurancePolicy_GetByPatient]
(
 @PatientId INT
)
AS
BEGIN

SELECT
IP.*,
PR.ProviderName

FROM InsurancePolicy IP

LEFT JOIN PatientInsurance PI
ON IP.PolicyId=PI.PolicyId

LEFT JOIN InsuranceProvider PR
ON PI.InsuranceProviderId=PR.InsuranceProviderId

WHERE IP.PatientId=@PatientId;

END

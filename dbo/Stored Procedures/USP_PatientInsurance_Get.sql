CREATE     PROCEDURE [dbo].[USP_PatientInsurance_Get]

(
 @PatientId BIGINT
)

AS
BEGIN


SELECT

PI.PatientInsuranceId,
IP.ProviderName,
PI.PolicyNumber

FROM dbo.PatientInsurance PI


INNER JOIN dbo.InsuranceProvider IP

ON PI.InsuranceProviderId=IP.InsuranceProviderId


WHERE

PI.PatientId=@PatientId;


END

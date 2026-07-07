CREATE     PROCEDURE [dbo].[USP_InsuranceClaim_Pending]


AS
BEGIN


SELECT


CS.ClaimId,

IP.ProviderName,

CS.SubmissionDate,

CS.Status


FROM dbo.ClaimSubmission CS


INNER JOIN dbo.InsurancePolicy POL

ON CS.PolicyId=POL.PolicyId


INNER JOIN dbo.PatientInsurance PI

ON POL.PolicyId=PI.PolicyNumber


INNER JOIN dbo.InsuranceProvider IP

ON PI.InsuranceProviderId=IP.InsuranceProviderId



WHERE CS.Status='NEW';



END

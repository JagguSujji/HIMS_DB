


/***********************************************************
 Insurance Dashboard
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Insurance_Dashboard]
AS
BEGIN


SELECT

(SELECT COUNT(*) 
FROM InsuranceClaim)
TotalClaims,


(SELECT COUNT(*)
FROM ClaimSubmission
WHERE Status='PENDING')
PendingClaims,


(SELECT COUNT(*)
FROM ClaimSubmission
WHERE Status='APPROVED')
ApprovedClaims,


(SELECT COUNT(*)
FROM ClaimSubmission
WHERE Status='DENIED')
DeniedClaims;


END

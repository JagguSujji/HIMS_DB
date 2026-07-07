


/***********************************************************
 Claim Get
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_InsuranceClaim_Get]
(
 @ClaimId INT
)
AS
BEGIN

SELECT *
FROM InsuranceClaim
WHERE ClaimId=@ClaimId;

END

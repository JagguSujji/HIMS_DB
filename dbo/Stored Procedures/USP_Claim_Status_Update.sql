


/***********************************************************
 Update Claim Status
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Claim_Status_Update]
(
 @ClaimId INT,
 @Status VARCHAR(50)
)
AS
BEGIN

UPDATE ClaimSubmission

SET Status=@Status

WHERE ClaimId=@ClaimId;


END

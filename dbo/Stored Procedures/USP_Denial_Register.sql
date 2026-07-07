


/***********************************************************
 Register Claim Denial
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Denial_Register]
(
 @ClaimId INT,
 @ReasonId INT
)
AS
BEGIN

UPDATE ClaimSubmission

SET Status='DENIED'

WHERE ClaimId=@ClaimId;


SELECT
@ClaimId ClaimId,
@ReasonId ReasonId,
GETDATE() CreatedOn;


END

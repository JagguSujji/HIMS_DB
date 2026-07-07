


/***********************************************************
 Claim Pending Report
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Claim_Pending_Report]
AS
BEGIN

SELECT *

FROM ClaimSubmission

WHERE Status IN
(
'PENDING',
'SUBMITTED'
);

END

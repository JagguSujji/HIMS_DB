


/***********************************************************
 Find Approval Level
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_ApprovalLevel_Find]
(
 @Amount DECIMAL(18,2)
)
AS
BEGIN


SELECT TOP 1 *

FROM ApprovalLevel

WHERE 
@Amount BETWEEN MinimumAmount AND MaximumAmount

ORDER BY SequenceNo;


END

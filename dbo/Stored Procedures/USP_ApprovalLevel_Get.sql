


/***********************************************************
 Approval Level Lookup
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_ApprovalLevel_Get]
AS
BEGIN

SELECT *

FROM ApprovalLevel

WHERE IsActive=1;

END

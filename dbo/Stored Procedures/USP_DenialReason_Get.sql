


/***********************************************************
 Denial Reasons
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_DenialReason_Get]
AS
BEGIN

SELECT *

FROM DenialReason

WHERE IsActive=1;

END

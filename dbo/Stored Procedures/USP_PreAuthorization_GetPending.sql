


/***********************************************************
 Pending Pre Authorization
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_PreAuthorization_GetPending]
AS
BEGIN

SELECT *

FROM PreAuthorization

WHERE Status='PENDING';

END

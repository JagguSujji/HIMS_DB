



/************************************************************
 BILLING MASTER
************************************************************/


CREATE     PROCEDURE [dbo].[USP_BillingType_GetAll]
AS
BEGIN

SELECT *

FROM BillingType

WHERE IsActive=1

END

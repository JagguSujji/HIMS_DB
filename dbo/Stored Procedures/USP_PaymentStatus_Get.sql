


/***********************************************************
 Payment Status Master
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_PaymentStatus_Get]
AS
BEGIN

SELECT *
FROM PaymentStatus
WHERE IsActive=1;

END

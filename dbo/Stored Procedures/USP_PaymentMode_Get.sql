


/***********************************************************
 Payment Mode Master
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_PaymentMode_Get]
AS
BEGIN

SELECT *
FROM PaymentMode
WHERE IsActive=1;

END

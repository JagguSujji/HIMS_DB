


/***********************************************************
 Get Payment Details
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Payment_GetById]
(
 @PaymentId INT
)
AS
BEGIN

SELECT *
FROM Payment
WHERE PaymentId=@PaymentId;

END




/***********************************************************
 Refund History
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Refund_GetHistory]
(
 @PaymentId INT
)
AS
BEGIN

SELECT *
FROM RefundTransaction
WHERE PaymentId=@PaymentId
ORDER BY RefundedOn DESC;

END

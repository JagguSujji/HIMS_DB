


/***********************************************************
 Refund Create
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Refund_Create]
(
 @PaymentId INT,
 @Amount DECIMAL(18,2),
 @Reason VARCHAR(500)
)
AS
BEGIN

INSERT INTO RefundTransaction
(
 PaymentId,
 Amount,
 Reason,
 RefundedOn
)
VALUES
(
 @PaymentId,
 @Amount,
 @Reason,
 GETDATE()
)

END

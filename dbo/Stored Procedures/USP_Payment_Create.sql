/*==========================================================
 Module 9 Part 2
 Billing & Revenue Cycle Management
 Payment / Allocation / Refund / Outstanding
==========================================================*/


/***********************************************************
 Payment Create
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Payment_Create]
(
    @BillId INT,
    @PaymentDate DATETIME,
    @Amount DECIMAL(18,2),
    @PaymentModeId INT,
    @TransactionReference VARCHAR(100)=NULL,
    @ReceivedBy INT,
    @CurrencyId INT=NULL,
    @ExchangeRate DECIMAL(18,4)=1,
    @PaymentGateway VARCHAR(100)=NULL
)
AS
BEGIN

INSERT INTO Payment
(
 BillId,
 PaymentDate,
 Amount,
 PaymentModeId,
 TransactionReference,
 ReceivedBy,
 PaymentStatusId,
 CurrencyId,
 ExchangeRate,
 PaymentGateway
)
VALUES
(
 @BillId,
 @PaymentDate,
 @Amount,
 @PaymentModeId,
 @TransactionReference,
 @ReceivedBy,
 1,
 @CurrencyId,
 @ExchangeRate,
 @PaymentGateway
)

SELECT SCOPE_IDENTITY() PaymentId;

END

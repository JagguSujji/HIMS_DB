


/***********************************************************
 Credit Note
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_CreditNote_Create]
(
 @InvoiceId INT,
 @Amount DECIMAL(18,2),
 @Reason VARCHAR(500)
)
AS
BEGIN

INSERT INTO CreditNote
(
 InvoiceId,
 Amount,
 Reason,
 CreatedOn
)
VALUES
(
 @InvoiceId,
 @Amount,
 @Reason,
 GETDATE()
)

END

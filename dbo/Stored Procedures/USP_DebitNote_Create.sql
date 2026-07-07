


/***********************************************************
 Debit Note
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_DebitNote_Create]
(
 @InvoiceId INT,
 @Amount DECIMAL(18,2),
 @Reason VARCHAR(500)
)
AS
BEGIN

INSERT INTO DebitNote
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

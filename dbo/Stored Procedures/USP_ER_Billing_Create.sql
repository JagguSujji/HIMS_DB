CREATE     PROCEDURE [dbo].[USP_ER_Billing_Create]


(
 @PatientId BIGINT,

 @Amount DECIMAL(18,2)

)

AS
BEGIN


INSERT INTO InvoiceHeader

(
PatientId,
TotalAmount,
Status,
CreatedOn
)


VALUES

(
@PatientId,
@Amount,
'OPEN',
GETDATE()
);



END

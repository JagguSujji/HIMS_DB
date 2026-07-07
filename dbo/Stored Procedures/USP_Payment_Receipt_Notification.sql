CREATE     PROCEDURE [dbo].[USP_Payment_Receipt_Notification]


(
 @PaymentId INT

)

AS
BEGIN


DECLARE

@PatientId INT;



SELECT

@PatientId=PatientId


FROM InvoiceHeader I


INNER JOIN Payment P

ON I.InvoiceId=P.BillId


WHERE

P.PaymentId=@PaymentId;



INSERT INTO PatientNotification

(
PatientId,
Message,
IsRead,
CreatedOn
)

VALUES

(
@PatientId,
'Payment received successfully.',
0,
GETDATE()
);



END

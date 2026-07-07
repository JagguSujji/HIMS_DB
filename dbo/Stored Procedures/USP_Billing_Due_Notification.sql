CREATE     PROCEDURE [dbo].[USP_Billing_Due_Notification]


AS
BEGIN


INSERT INTO PatientNotification
(
PatientId,
Message,
IsRead,
CreatedOn
)


SELECT


PatientId,


'Your outstanding hospital bill payment is pending.',


0,


GETDATE()



FROM InvoiceHeader


WHERE


BalanceAmount > 0;



END

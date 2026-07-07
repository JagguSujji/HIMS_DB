CREATE     PROCEDURE [dbo].[USP_PaymentTerm_Get]


AS
BEGIN


SELECT


PaymentTermId,

PaymentTermCode,

PaymentTermName,

DueDays


FROM PaymentTerm


WHERE IsActive=1;



END

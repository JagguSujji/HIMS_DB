CREATE     PROCEDURE [dbo].[USP_TaxMaster_GetAll]


AS
BEGIN


SELECT


TaxId,

TaxName,

TaxRate


FROM TaxMaster


WHERE IsActive=1;



END

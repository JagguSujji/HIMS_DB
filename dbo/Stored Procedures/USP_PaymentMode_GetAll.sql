


CREATE     PROCEDURE [dbo].[USP_PaymentMode_GetAll]
AS
BEGIN

SELECT *

FROM PaymentMode

WHERE IsActive=1

END

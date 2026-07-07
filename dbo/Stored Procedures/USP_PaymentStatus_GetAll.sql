


CREATE     PROCEDURE [dbo].[USP_PaymentStatus_GetAll]
AS
BEGIN

SELECT *

FROM PaymentStatus

WHERE IsActive=1

END

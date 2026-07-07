


CREATE     PROCEDURE [dbo].[USP_DiscountType_Get]
AS
BEGIN

SELECT *

FROM DiscountType

WHERE IsActive=1

END

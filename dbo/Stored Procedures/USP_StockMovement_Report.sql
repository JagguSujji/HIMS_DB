


CREATE     PROCEDURE [dbo].[USP_StockMovement_Report]
(
 @ItemId INT
)
AS
BEGIN

SELECT *

FROM StockMovement

WHERE ItemId=@ItemId

ORDER BY MovementDate DESC;

END

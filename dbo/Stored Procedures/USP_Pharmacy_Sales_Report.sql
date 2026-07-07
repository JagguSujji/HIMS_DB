CREATE     PROCEDURE [dbo].[USP_Pharmacy_Sales_Report]


(
 @FromDate DATE,

 @ToDate DATE

)

AS
BEGIN


SELECT


SUM(Quantity) TotalQuantity


FROM DrugInventoryMovement


WHERE


MovementType='SALE'


AND


CAST(MovementDate AS DATE)

BETWEEN @FromDate AND @ToDate;



END

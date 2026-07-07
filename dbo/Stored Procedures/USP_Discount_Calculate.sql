


/***********************************************************
 Discount Calculation
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Discount_Calculate]
(
 @Amount DECIMAL(18,2),
 @DiscountPercentage DECIMAL(5,2)
)
AS
BEGIN

SELECT

@Amount DiscountBefore,

(@Amount*@DiscountPercentage/100) DiscountAmount,

(@Amount-(@Amount*@DiscountPercentage/100))
FinalAmount;

END

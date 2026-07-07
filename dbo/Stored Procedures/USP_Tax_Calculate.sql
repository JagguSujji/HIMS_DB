


/***********************************************************
 Tax Calculation
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Tax_Calculate]
(
 @Amount DECIMAL(18,2),
 @TaxPercentage DECIMAL(5,2)
)
AS
BEGIN

SELECT
@Amount TaxableAmount,
(@Amount*@TaxPercentage/100) TaxAmount,
(@Amount+(@Amount*@TaxPercentage/100)) TotalAmount;

END

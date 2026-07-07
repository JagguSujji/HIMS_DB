CREATE     PROCEDURE [dbo].[USP_Lab_ResultFlag_Check]


(
 @Value DECIMAL(18,2),
 @Minimum DECIMAL(18,2),
 @Maximum DECIMAL(18,2)
)

AS
BEGIN


IF @Value < @Minimum

SELECT 'LOW' ResultFlag;


ELSE IF @Value > @Maximum

SELECT 'HIGH' ResultFlag;


ELSE

SELECT 'NORMAL' ResultFlag;


END

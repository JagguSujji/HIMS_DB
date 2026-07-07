


/*******************************************************
 14. Check Normal Range
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabResult_CheckRange]
(
 @LabTestId INT,
 @GenderId INT,
 @Age INT,
 @Value DECIMAL(18,2)
)
AS
BEGIN


SELECT

CASE

WHEN @Value < MinimumValue
THEN 'LOW'

WHEN @Value > MaximumValue
THEN 'HIGH'

ELSE 'NORMAL'

END ResultFlag


FROM dbo.NormalRange

WHERE
LabTestId=@LabTestId
AND GenderId=@GenderId
AND @Age BETWEEN AgeFrom AND AgeTo;


END

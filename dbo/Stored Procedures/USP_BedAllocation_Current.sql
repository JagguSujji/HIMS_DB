


CREATE     PROCEDURE [dbo].[USP_BedAllocation_Current]
(
 @BedId BIGINT
)
AS
BEGIN

SELECT *
FROM dbo.BedAllocation
WHERE BedId=@BedId
AND ToDate IS NULL;

END




CREATE     PROCEDURE [dbo].[USP_BedAllocation_Close]
(
 @BedAllocationId BIGINT,
 @ToDate DATETIME
)
AS
BEGIN

UPDATE dbo.BedAllocation
SET ToDate=@ToDate
WHERE BedAllocationId=@BedAllocationId;

END

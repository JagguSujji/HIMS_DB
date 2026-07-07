CREATE     PROCEDURE [dbo].[USP_Bed_Release]

(
 @BedId BIGINT
)

AS
BEGIN


UPDATE dbo.Bed

SET

IsOccupied=0


WHERE BedId=@BedId;



UPDATE dbo.BedAllocation

SET

ToDate=GETDATE()


WHERE

BedId=@BedId

AND ToDate IS NULL;



INSERT INTO dbo.BedStatusLog

(
BedId,
StatusFrom,
StatusTo,
CreatedOn
)

VALUES

(
@BedId,
'OCCUPIED',
'AVAILABLE',
GETDATE()
);


END

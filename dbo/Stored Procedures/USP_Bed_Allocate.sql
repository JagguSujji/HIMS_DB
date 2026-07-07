CREATE     PROCEDURE [dbo].[USP_Bed_Allocate]


(
 @AdmissionId BIGINT,
 @BedId BIGINT
)

AS
BEGIN


INSERT INTO dbo.BedAllocation

(
AdmissionId,
BedId,
FromDate
)

VALUES

(
@AdmissionId,
@BedId,
GETDATE()
);



UPDATE dbo.Bed

SET

IsOccupied=1,


BedStatusId=

(
SELECT BedStatusId
FROM BedStatus
WHERE StatusCode='OCCUPIED'
)


WHERE BedId=@BedId;



INSERT INTO dbo.BedStatusLog

(
BedId,
BedStatusId,
StatusFrom,
StatusTo,
CreatedOn
)

VALUES

(
@BedId,
(
SELECT BedStatusId
FROM BedStatus
WHERE StatusCode='OCCUPIED'
),
'AVAILABLE',
'OCCUPIED',
GETDATE()
);



END

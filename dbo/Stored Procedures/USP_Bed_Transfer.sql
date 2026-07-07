CREATE     PROCEDURE [dbo].[USP_Bed_Transfer]


(
 @AdmissionId BIGINT,
 @OldBedId BIGINT,
 @NewBedId BIGINT,
 @Reason VARCHAR(500)
)

AS
BEGIN


INSERT INTO dbo.BedTransferHistory

(
BedId,
FromAdmissionId,
ToAdmissionId,
TransferDate,
Reason
)

VALUES

(
@OldBedId,
@AdmissionId,
@AdmissionId,
GETDATE(),
@Reason
);



UPDATE dbo.BedAllocation

SET

ToDate=GETDATE()

WHERE

AdmissionId=@AdmissionId

AND BedId=@OldBedId

AND ToDate IS NULL;



EXEC dbo.USP_Bed_Allocate

@AdmissionId,
@NewBedId;



UPDATE dbo.Bed

SET IsOccupied=0

WHERE BedId=@OldBedId;



END

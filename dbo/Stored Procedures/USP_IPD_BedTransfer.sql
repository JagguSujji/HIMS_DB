CREATE     PROCEDURE [dbo].[USP_IPD_BedTransfer]


(
 @AdmissionId BIGINT,

 @FromBedId BIGINT,

 @ToBedId BIGINT,

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
@FromBedId,
@AdmissionId,
@AdmissionId,
GETDATE(),
@Reason
);



UPDATE dbo.Bed

SET IsOccupied=0

WHERE BedId=@FromBedId;



UPDATE dbo.Bed

SET IsOccupied=1

WHERE BedId=@ToBedId;



UPDATE dbo.Admission

SET

BedId=@ToBedId


WHERE AdmissionId=@AdmissionId;



END




CREATE     PROCEDURE [dbo].[USP_BedTransferHistory_Insert]
(
 @BedId BIGINT,
 @FromAdmissionId BIGINT,
 @ToAdmissionId BIGINT,
 @Reason NVARCHAR(500)
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
 @BedId,
 @FromAdmissionId,
 @ToAdmissionId,
 GETDATE(),
 @Reason
);

END

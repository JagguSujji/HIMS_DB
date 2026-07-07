CREATE     PROCEDURE [dbo].[USP_BedTransferHistory_Get]
(
 @AdmissionId INT
)
AS
BEGIN

SET NOCOUNT ON;


SELECT
 BTH.BedTransferId,
 BTH.BedId,
 BTH.FromAdmissionId,
 BTH.ToAdmissionId,
 BTH.TransferDate,
 BTH.Reason,
 B.BedNumber

FROM dbo.BedTransferHistory BTH

INNER JOIN dbo.Bed B
ON B.BedId=BTH.BedId

WHERE 
BTH.FromAdmissionId=@AdmissionId
OR
BTH.ToAdmissionId=@AdmissionId

ORDER BY TransferDate DESC;


END

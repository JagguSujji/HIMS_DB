CREATE     PROCEDURE [dbo].[USP_BedAllocation_GetHistory]
(
 @AdmissionId INT
)
AS
BEGIN

SET NOCOUNT ON;

SELECT
 BA.BedAllocationId,
 BA.AdmissionId,
 BA.BedId,
 B.BedNumber,
 BA.FromDate,
 BA.ToDate

FROM dbo.BedAllocation BA

INNER JOIN dbo.Bed B
ON B.BedId=BA.BedId

WHERE BA.AdmissionId=@AdmissionId

ORDER BY BA.FromDate DESC;

END

CREATE     PROCEDURE [dbo].[USP_BedStatusHistory_Get]
(
 @BedId INT
)
AS
BEGIN

SET NOCOUNT ON;


SELECT
 BSL.BedStatusLogId,
 BSL.BedId,
 --BS1.StatusName AS StatusFrom,
 --BS2.StatusName AS StatusTo,
 BSL.Remarks
 --,BSL.CreatedOn

FROM dbo.BedStatusLog BSL

--LEFT JOIN dbo.BedStatus BS1
--ON BS1.BedStatusId=BSL.StatusFrom

--LEFT JOIN dbo.BedStatus BS2
--ON BS2.BedStatusId=BSL.StatusTo

WHERE BSL.BedId=@BedId

ORDER BY BSL.CreatedOn DESC;


END

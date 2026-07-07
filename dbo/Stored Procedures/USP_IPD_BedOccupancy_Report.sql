CREATE     PROCEDURE [dbo].[USP_IPD_BedOccupancy_Report]
(
 @BranchId INT=NULL
)
AS
BEGIN

SET NOCOUNT ON;


SELECT

W.WardName,
COUNT(B.BedId) TotalBeds,

SUM
(
CASE WHEN B.IsOccupied=1 THEN 1 ELSE 0 END
)
OccupiedBeds,

SUM
(
CASE WHEN B.IsOccupied=0 THEN 1 ELSE 0 END
)
AvailableBeds


FROM dbo.Bed B

INNER JOIN dbo.Room R
ON R.RoomId=B.RoomId

INNER JOIN dbo.Ward W
ON W.WardId=R.WardId

GROUP BY W.WardName;


END

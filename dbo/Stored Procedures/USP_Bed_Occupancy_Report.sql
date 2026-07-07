CREATE     PROCEDURE [dbo].[USP_Bed_Occupancy_Report]


AS
BEGIN


SELECT


W.WardName,


COUNT(B.BedId) TotalBeds,


SUM(CASE WHEN B.IsOccupied=1 THEN 1 ELSE 0 END)
OccupiedBeds,


SUM(CASE WHEN B.IsOccupied=0 THEN 1 ELSE 0 END)
AvailableBeds



FROM Bed B


INNER JOIN Room R

ON B.RoomId=R.RoomId


INNER JOIN Ward W

ON R.WardId=W.WardId



GROUP BY

W.WardName;


END

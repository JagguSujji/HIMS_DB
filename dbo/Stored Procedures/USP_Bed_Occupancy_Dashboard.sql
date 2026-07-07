CREATE     PROCEDURE [dbo].[USP_Bed_Occupancy_Dashboard]


AS
BEGIN


SELECT


COUNT(*) TotalBeds,


SUM
(
CASE WHEN IsOccupied=1 THEN 1 ELSE 0 END
)
OccupiedBeds,


SUM
(
CASE WHEN IsOccupied=0 THEN 1 ELSE 0 END
)
AvailableBeds


FROM dbo.Bed;



END

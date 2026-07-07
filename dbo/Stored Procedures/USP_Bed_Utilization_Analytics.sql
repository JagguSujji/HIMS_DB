



/***************************************************************
 RESOURCE UTILIZATION
****************************************************************/


CREATE     PROCEDURE [dbo].[USP_Bed_Utilization_Analytics]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN


SELECT

COUNT(*) TotalBeds,

SUM(
CASE WHEN IsOccupied=1 THEN 1 ELSE 0 END
)
OccupiedBeds,


CAST(
SUM(
CASE WHEN IsOccupied=1 THEN 1 ELSE 0 END
)*100.0/
COUNT(*)
AS DECIMAL(10,2))
OccupancyPercentage


FROM Bed


END

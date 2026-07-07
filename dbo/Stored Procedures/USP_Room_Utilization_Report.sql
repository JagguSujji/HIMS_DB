



CREATE     PROCEDURE [dbo].[USP_Room_Utilization_Report]
AS
BEGIN


SELECT

R.RoomNumber,

COUNT(B.BedId) TotalBeds,

SUM(CASE WHEN B.IsOccupied=1 THEN 1 ELSE 0 END)
OccupiedBeds


FROM Room R

LEFT JOIN Bed B
ON R.RoomId=B.RoomId


GROUP BY R.RoomNumber


END

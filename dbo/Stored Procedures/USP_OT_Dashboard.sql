CREATE     PROCEDURE [dbo].[USP_OT_Dashboard]


AS
BEGIN


SELECT


(
SELECT COUNT(*)
FROM Surgery
WHERE CAST(SurgeryDate AS DATE)=CAST(GETDATE() AS DATE)
)
TodaySurgeries,


(
SELECT COUNT(*)
FROM OTSchedule
)
ScheduledOT,


(
SELECT COUNT(*)
FROM Surgery
WHERE SurgeryDate < GETDATE()
)
Completed;


END

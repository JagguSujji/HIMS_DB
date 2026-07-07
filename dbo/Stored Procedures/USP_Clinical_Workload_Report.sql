



CREATE     PROCEDURE [dbo].[USP_Clinical_Workload_Report]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN


SELECT

EncounterType,

COUNT(*) TotalEncounters


FROM Encounter


WHERE StartTime BETWEEN @FromDate AND @ToDate


GROUP BY EncounterType


END

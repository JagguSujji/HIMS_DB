



/***************************************************************
 QUALITY & OPERATIONS
****************************************************************/


CREATE     PROCEDURE [dbo].[USP_Patient_Wait_Time_Report]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN


SELECT

AVG
(
DATEDIFF
(
MINUTE,
CheckInTime,
CheckOutTime
)
)
AverageWaitingMinutes


FROM Visit


WHERE VisitDate BETWEEN @FromDate AND @ToDate


END

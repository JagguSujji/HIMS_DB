



CREATE     PROCEDURE [dbo].[USP_System_Usage_Analytics]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN


SELECT

Username,

COUNT(*) LoginCount


FROM LoginAudit


WHERE LoginDateTime BETWEEN @FromDate AND @ToDate


GROUP BY Username


END

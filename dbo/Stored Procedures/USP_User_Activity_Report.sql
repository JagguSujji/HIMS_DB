CREATE     PROCEDURE [dbo].[USP_User_Activity_Report]


(
 @FromDate DATE,

 @ToDate DATE

)

AS
BEGIN


SELECT


U.Username,

COUNT(L.LoginAuditId) LoginCount,


SUM
(
CASE WHEN L.IsSuccessful=1 THEN 1 ELSE 0 END
)
SuccessfulLogin,


SUM
(
CASE WHEN L.IsSuccessful=0 THEN 1 ELSE 0 END
)
FailedLogin



FROM LoginAudit L


INNER JOIN ApplicationUser U

ON L.UserId=U.UserId



WHERE


CAST(L.LoginDateTime AS DATE)

BETWEEN @FromDate AND @ToDate



GROUP BY

U.Username;



END

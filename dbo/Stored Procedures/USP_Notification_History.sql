CREATE     PROCEDURE [dbo].[USP_Notification_History]


(
 @FromDate DATE,

 @ToDate DATE

)

AS
BEGIN


SELECT


N.NotificationId,

N.Message,

N.IsRead,

N.CreatedOn,


U.Username



FROM NotificationQueue N


LEFT JOIN ApplicationUser U

ON N.UserId=U.UserId



WHERE


CAST(N.CreatedOn AS DATE)

BETWEEN @FromDate AND @ToDate



ORDER BY

N.CreatedOn DESC;



END

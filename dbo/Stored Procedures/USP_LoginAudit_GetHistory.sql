


CREATE     PROCEDURE [dbo].[USP_LoginAudit_GetHistory]
(
 @UserId INT
)
AS
BEGIN

SELECT *

FROM LoginAudit

WHERE UserId=@UserId

ORDER BY LoginDateTime DESC;

END

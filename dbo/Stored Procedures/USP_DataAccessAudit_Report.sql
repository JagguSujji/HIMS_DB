


/************************************************************
 Data Access Audit Report
************************************************************/

CREATE     PROCEDURE [dbo].[USP_DataAccessAudit_Report]
(
 @UserId INT=NULL
)
AS
BEGIN


SELECT *

FROM DataAccessAuditLog

WHERE
(@UserId IS NULL OR UserId=@UserId)

ORDER BY AccessedOn DESC;


END




/************************************************************
 Audit Event History
************************************************************/

CREATE     PROCEDURE [dbo].[USP_AuditEvent_Get]
(
 @TableName VARCHAR(100),
 @RecordId INT
)
AS
BEGIN

SELECT *

FROM AuditEvent

WHERE TableName=@TableName
AND RecordId=@RecordId

ORDER BY ChangedOn DESC;

END

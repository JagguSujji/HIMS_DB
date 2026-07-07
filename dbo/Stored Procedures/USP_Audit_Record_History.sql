CREATE     PROCEDURE [dbo].[USP_Audit_Record_History]


(
 @TableName VARCHAR(100),

 @RecordId INT

)

AS
BEGIN


SELECT


*

FROM AuditLog


WHERE


TableName=@TableName

AND

RecordId=@RecordId



ORDER BY

ChangedOn DESC;



END

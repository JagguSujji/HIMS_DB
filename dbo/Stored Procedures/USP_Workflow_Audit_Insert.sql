CREATE     PROCEDURE [dbo].[USP_Workflow_Audit_Insert]


(
 @ModuleName VARCHAR(100),

 @RecordId INT,

 @FromStatus VARCHAR(50),

 @ToStatus VARCHAR(50),

 @ChangedBy INT

)

AS
BEGIN


INSERT INTO AuditLog

(
TableName,
RecordId,
Action,
OldValue,
NewValue,
ChangedBy,
ChangedOn
)


VALUES

(
@ModuleName,
@RecordId,
'STATUS_CHANGE',
@FromStatus,
@ToStatus,
@ChangedBy,
GETDATE()
);



END

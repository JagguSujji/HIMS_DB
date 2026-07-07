CREATE     PROCEDURE [dbo].[USP_AuditLog_Insert]


(
 @TableName VARCHAR(100),

 @RecordId INT,

 @Action VARCHAR(50),

 @OldValue NVARCHAR(MAX),

 @NewValue NVARCHAR(MAX),

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
ChangedOn,
ChangedBy
)


VALUES

(
@TableName,
@RecordId,
@Action,
@OldValue,
@NewValue,
GETDATE(),
@ChangedBy
);



END

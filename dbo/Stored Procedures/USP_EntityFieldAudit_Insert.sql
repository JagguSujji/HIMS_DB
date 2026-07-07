CREATE     PROCEDURE [dbo].[USP_EntityFieldAudit_Insert]


(
 @TableName VARCHAR(100),

 @ColumnName VARCHAR(100),

 @RecordId INT,

 @OldValue NVARCHAR(MAX),

 @NewValue NVARCHAR(MAX),

 @ChangedBy INT

)

AS
BEGIN


INSERT INTO EntityFieldAuditLog

(
TableName,
ColumnName,
RecordId,
OldValue,
NewValue,
ChangedBy,
ChangedOn
)


VALUES

(
@TableName,
@ColumnName,
@RecordId,
@OldValue,
@NewValue,
@ChangedBy,
GETDATE()
);



END

CREATE     PROCEDURE [dbo].[USP_WorkflowStatus_Get]

(
 @ModuleName VARCHAR(100)
)

AS
BEGIN


SELECT

WorkflowStatusId,

WorkflowStatusCode,

WorkflowStatusName,

DisplayOrder

FROM WorkflowStatus


WHERE ModuleName=@ModuleName


ORDER BY DisplayOrder;



END

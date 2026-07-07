



CREATE     PROCEDURE [dbo].[USP_Workflow_Status_Update]
(
 @WorkflowStatusId INT,
 @ModuleName VARCHAR(100)
)
AS
BEGIN


UPDATE WorkflowStatus

SET ModuleName=@ModuleName

WHERE WorkflowStatusId=@WorkflowStatusId


END

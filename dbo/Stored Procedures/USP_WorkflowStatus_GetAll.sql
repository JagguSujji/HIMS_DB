




/************************************************************
 WORKFLOW AUTOMATION
************************************************************/


CREATE     PROCEDURE [dbo].[USP_WorkflowStatus_GetAll]
(
 @ModuleName VARCHAR(100)
)
AS
BEGIN


SELECT *

FROM WorkflowStatus

WHERE ModuleName=@ModuleName

AND IsActive=1

ORDER BY DisplayOrder


END

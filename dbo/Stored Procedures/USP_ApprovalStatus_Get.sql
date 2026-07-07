CREATE     PROCEDURE [dbo].[USP_ApprovalStatus_Get]


AS
BEGIN


SELECT

ApprovalStatusId,

ApprovalStatusCode,

ApprovalStatusName


FROM ApprovalStatus


WHERE IsActive=1;


END

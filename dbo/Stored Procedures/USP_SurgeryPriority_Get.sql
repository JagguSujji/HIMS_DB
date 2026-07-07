CREATE     PROCEDURE [dbo].[USP_SurgeryPriority_Get]

AS
BEGIN


SELECT

SurgeryPriorityId,
PriorityCode,
PriorityName,
DisplayOrder


FROM dbo.SurgeryPriority


WHERE IsActive=1

ORDER BY DisplayOrder;


END

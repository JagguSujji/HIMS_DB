



CREATE     PROCEDURE [dbo].[USP_ServiceRequest_Pending_Get]
AS
BEGIN


SELECT *

FROM ServiceRequest

WHERE Status NOT IN
(
'CLOSED',
'COMPLETED'
)

ORDER BY CreatedOn


END

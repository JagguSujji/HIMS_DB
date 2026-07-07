


CREATE     PROCEDURE [dbo].[USP_EventStream_GetLatest]
(
 @TopCount INT=100
)
AS
BEGIN


SELECT TOP(@TopCount)*

FROM RealTimeEventStream

ORDER BY CreatedOn DESC


END

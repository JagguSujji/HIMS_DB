CREATE     PROCEDURE [dbo].[USP_OTStatus_Get]

AS
BEGIN


SELECT

OTStatusId,
OTStatusCode,
OTStatusName,
DisplayColor


FROM dbo.OTStatus


WHERE IsActive=1;


END
